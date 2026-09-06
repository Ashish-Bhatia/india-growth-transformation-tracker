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

For GitHub Codespaces, the repository `.devcontainer/devcontainer.json` uses the root `docker-compose.yml` with PostgreSQL 16. The Codespace development container and database share a network namespace, so the same `DATABASE_URL` contract is available on `localhost:5432`.

### Codespaces bootstrap

1. Rebuild or create a Codespace from the repository after the `.devcontainer` configuration is present.
2. Confirm the database is reachable:

```bash
pg_isready -h localhost -p 5432 -U tracker -d igt_tracker
```

3. Confirm the environment variable is present:

```bash
printf '%s\n' "$DATABASE_URL"
```

Expected value:

```text
postgresql://tracker:tracker@localhost:5432/igt_tracker
```

4. Install the development dependencies if the post-create command has not already run:

```bash
python -m pip install -r requirements-dev.txt
```

5. Apply the existing migrations without modifying them:

```bash
python scripts/db_migrate.py
```

6. Load the existing canonical taxonomy seed:

```bash
python scripts/db_seed.py
```

7. Run the existing integration test:

```bash
python -m pytest tests/test_database_integration.py -q
```

The Codespace database is disposable development infrastructure. It does not contain research observation acquisition logic and it must not be treated as a substitute for canonical repository state.

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
