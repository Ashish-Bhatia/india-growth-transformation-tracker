# Database Foundation

The tracker uses PostgreSQL as its canonical structured analytical layer. The implementation follows the Master Database Schema, Master Research Taxonomy, Data Governance, Indicator, Source Acquisition, Execution Protocol and GitHub specifications.

## Local setup

Requirements:

- Python 3.11+
- PostgreSQL 15+

Set:

```text
DATABASE_URL=postgresql://tracker:tracker@localhost:5432/igt_tracker
```

For local Docker development, use the repository Docker Compose configuration.

## Migrations

Migrations live in `db/migrations/` and are applied in lexical version order:

```bash
python scripts/db_migrate.py
python scripts/db_migrate.py --status
```

Migration files are transactional. A failed migration is rolled back. Applied migration files must not be edited destructively. Schema changes require a new migration.

The runner records applied versions in `public.schema_migrations`.

There are no destructive down migrations in the initial foundation. Rollback of a failed migration is transactional. Rollback of an already-applied production change requires a new forward migration or restoration of the database from an approved backup/release state.

## Seed data

After migrations:

```bash
python scripts/db_seed.py
```

The seed is repeat-safe. It loads the canonical taxonomy version only once.

The current seed includes:

- government administrations and term records
- 33 canonical sectors
- 354 canonical sub-sector entries from the taxonomy source
- India
- 28 States and 8 Union Territories
- India and state/UT geography records

The source taxonomy does not provide a complete domain-level list. The `domains` table is therefore implemented but intentionally unseeded until an authoritative domain registry exists.

The country table is seeded with India only. International country coverage remains extensible and must be populated from an approved country registry before peer research.

## Design notes

Stable public identifiers are represented by immutable `code` columns. Database primary keys use generated numeric identifiers. Display names are never used as primary keys.

Source tier, evidence grade, attribution grade, attribution confidence and data quality grade remain separate fields.

Policy materiality stores only P1-P5 at this stage. The conflicting descriptive vocabularies remain unresolved and are not hard-coded into the materiality lookup.

Scoring tables support methodology, dimensions and weights, but no final sector weights or composite formulas are seeded.

Observations preserve dataset and vintage references, revision status and prior-observation linkage. Source snapshots preserve retrieval metadata and hashes where available.

## Tests

Static schema tests:

```bash
python -m pytest tests/test_migration_files.py
```

Integration tests require a reachable PostgreSQL instance and are run in CI against PostgreSQL.

## Environment and secrets

Never commit database passwords, API keys or other credentials. Use environment configuration locally and CI secrets in automated environments.
