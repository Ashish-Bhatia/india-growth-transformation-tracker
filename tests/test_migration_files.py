from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
MIGRATIONS = ROOT / "db" / "migrations"


def migration_files():
    return sorted(MIGRATIONS.glob("[0-9][0-9][0-9]_*.sql"))


def test_migration_versions_are_unique_and_ordered():
    files = migration_files()
    assert files
    versions = [p.name[:3] for p in files]
    assert len(versions) == len(set(versions))
    assert versions == sorted(versions)


def test_migrations_are_transactional():
    for path in migration_files():
        sql = path.read_text(encoding="utf-8").strip()
        assert sql.startswith("BEGIN;")
        assert sql.endswith("COMMIT;")


def test_initial_schema_has_required_tables():
    sql = (MIGRATIONS / "001_initial_schema.sql").read_text(encoding="utf-8")
    required = {
        "governments", "government_terms", "sectors", "sub_sectors", "domains",
        "countries", "states", "districts", "geographies", "policies",
        "policy_versions", "programmes", "schemes", "interventions", "indicators",
        "indicator_versions", "observations", "observation_vintages", "sources",
        "datasets", "source_snapshots", "source_locators", "evidence", "claims",
        "outcomes", "external_events", "counterfactuals", "attribution_records",
        "research_findings", "scores", "score_methodologies", "score_weights",
        "research_versions", "research_runs", "data_releases", "audit_events",
        "reviews", "publications", "calculations",
    }
    tables = set(re.findall(r"CREATE TABLE tracker\.([a-z_]+)", sql))
    assert required <= tables


def test_no_final_score_weights_are_seeded():
    seed = (ROOT / "db" / "seeds" / "001_canonical_taxonomy.sql").read_text(encoding="utf-8")
    assert "score_weights" not in seed
    assert "final_score" not in seed


def test_materiality_labels_have_no_competing_descriptions():
    vocab = (MIGRATIONS / "002_controlled_vocabularies.sql").read_text(encoding="utf-8")
    assert "('materiality','P1','P1',NULL,1)" in vocab
    assert "('materiality','P5','P5',NULL,5)" in vocab
