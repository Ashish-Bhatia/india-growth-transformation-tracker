#!/usr/bin/env python3
"""Apply versioned PostgreSQL migrations in lexical order.

Migrations are transactional. A failed migration rolls back its own transaction.
Applied migrations are immutable and tracked in public.schema_migrations.
"""
from __future__ import annotations

import argparse
import os
from pathlib import Path

import psycopg

ROOT = Path(__file__).resolve().parents[1]
MIGRATIONS = ROOT / "db" / "migrations"


def database_url() -> str:
    value = os.environ.get("DATABASE_URL")
    if not value:
        raise SystemExit("DATABASE_URL is required")
    return value


def ensure_meta(conn: psycopg.Connection) -> None:
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS public.schema_migrations (
            version TEXT PRIMARY KEY,
            applied_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
        """
    )
    conn.commit()


def applied(conn: psycopg.Connection) -> set[str]:
    return {row[0] for row in conn.execute("SELECT version FROM public.schema_migrations")}


def migrations() -> list[Path]:
    return sorted(MIGRATIONS.glob("[0-9][0-9][0-9]_*.sql"))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--status", action="store_true")
    args = parser.parse_args()

    with psycopg.connect(database_url()) as conn:
        ensure_meta(conn)
        done = applied(conn)
        files = migrations()

        if args.status:
            for path in files:
                print(f"{path.name}: {'applied' if path.name in done else 'pending'}")
            return

        for path in files:
            if path.name in done:
                continue
            sql = path.read_text(encoding="utf-8")
            try:
                with conn.transaction():
                    conn.execute(sql)
                    conn.execute(
                        "INSERT INTO public.schema_migrations(version) VALUES (%s)",
                        (path.name,),
                    )
            except Exception:
                raise RuntimeError(f"Migration failed and was rolled back: {path.name}")
            print(f"applied {path.name}")


if __name__ == "__main__":
    main()
