#!/usr/bin/env python3
"""Apply versioned PostgreSQL migrations in lexical order.

Each migration owns its transaction. A failed migration is rolled back before
its version is recorded. Applied migration files are immutable by convention.
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
                conn.execute(sql)
                conn.commit()
            except Exception as exc:
                conn.rollback()
                raise RuntimeError(f"Migration failed and was rolled back: {path.name}") from exc

            conn.execute(
                "INSERT INTO public.schema_migrations(version) VALUES (%s)",
                (path.name,),
            )
            conn.commit()
            print(f"applied {path.name}")


if __name__ == "__main__":
    main()
