#!/usr/bin/env python3
"""Load the deterministic canonical taxonomy seed once."""
from __future__ import annotations

import os
from pathlib import Path

import psycopg

ROOT = Path(__file__).resolve().parents[1]
SEED_FILE = ROOT / "db" / "seeds" / "001_canonical_taxonomy.sql"


def main() -> None:
    url = os.environ.get("DATABASE_URL")
    if not url:
        raise SystemExit("DATABASE_URL is required")
    with psycopg.connect(url) as conn:
        exists = conn.execute(
            "SELECT EXISTS (SELECT 1 FROM tracker.taxonomy_versions WHERE version_code = %s)",
            ("TAXONOMY-1.0",),
        ).fetchone()[0]
        if exists:
            print("canonical taxonomy already seeded: TAXONOMY-1.0")
            return
        conn.execute(SEED_FILE.read_text(encoding="utf-8"))
        conn.commit()
    print(f"seeded {SEED_FILE.name}")


if __name__ == "__main__":
    main()
