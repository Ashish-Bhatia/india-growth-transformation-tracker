import os
from pathlib import Path

import psycopg
import pytest

ROOT = Path(__file__).resolve().parents[1]


@pytest.mark.integration
def test_clean_database_migrates_and_seeds():
    url = os.environ.get("DATABASE_URL")
    if not url:
        pytest.skip("DATABASE_URL not configured")

    with psycopg.connect(url) as conn:
        conn.execute("DROP SCHEMA IF EXISTS tracker CASCADE")
        conn.execute("DROP TABLE IF EXISTS public.schema_migrations")
        conn.commit()

    import subprocess
    subprocess.run(["python", "scripts/db_migrate.py"], cwd=ROOT, check=True)
    subprocess.run(["python", "scripts/db_seed.py"], cwd=ROOT, check=True)

    with psycopg.connect(url) as conn:
        assert conn.execute("SELECT count(*) FROM tracker.sectors").fetchone()[0] == 33
        assert conn.execute("SELECT count(*) FROM tracker.sub_sectors").fetchone()[0] == 354
        assert conn.execute("SELECT count(*) FROM tracker.states WHERE state_type='state'").fetchone()[0] == 28
        assert conn.execute("SELECT count(*) FROM tracker.states WHERE state_type='union_territory'").fetchone()[0] == 8
        assert conn.execute("SELECT count(*) FROM tracker.government_terms").fetchone()[0] == 4
        assert conn.execute("SELECT count(*) FROM tracker.controlled_vocabularies WHERE vocabulary_code='materiality'").fetchone()[0] == 5
        assert conn.execute("SELECT count(*) FROM tracker.score_weights").fetchone()[0] == 0
        assert conn.execute("SELECT count(*) FROM tracker.domains").fetchone()[0] == 0

        # Referential-integrity smoke test: an orphaned observation must fail.
        with pytest.raises(psycopg.errors.ForeignKeyViolation):
            conn.execute(
                "INSERT INTO tracker.observations (indicator_id, measurement_date, period_label, unit, status, dataset_id) VALUES (999999, CURRENT_DATE, 'test', 'count', 'raw', 999999)"
            )
            conn.commit()
        conn.rollback()
