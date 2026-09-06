# Project State

Version: 0.2.0-db-foundation
State date: 2026-09-07

## Current phase
Database foundation implementation.

## Completed work
- All 15 Project Source documents reviewed for initialization.
- Foundational research, evidence, attribution, scoring, indicator, data, database, sector, policy, counterfactual, execution and GitHub frameworks established.
- Repository `india-growth-transformation-tracker` confirmed and initialized.
- PostgreSQL schema migration framework implemented.
- Initial canonical database schema implemented in `db/migrations/001_initial_schema.sql`.
- Controlled vocabulary structure implemented in `db/migrations/002_controlled_vocabularies.sql`.
- Canonical taxonomy seed implemented in `db/seeds/001_canonical_taxonomy.sql`.
- Migration runner and seed runner implemented.
- Static migration/schema tests implemented.
- PostgreSQL integration test and GitHub Actions database validation workflow implemented.
- Database reproducibility documentation implemented in `db/README.md`.

## In progress
- CI execution of the PostgreSQL integration suite.
- Formal resolution of documented terminology conflicts before policy onboarding and scoring.

## Pending
- Machine-readable Master Indicator Registry population.
- Source registry population and provenance ingestion.
- Domain taxonomy seed, once an authoritative domain registry is established.
- International country registry expansion beyond India.
- ETL and validation framework.
- Pilot sector selection and onboarding.
- Pilot data ingestion and research.
- Attribution and scoring engines.
- API and website implementation.
- Automated source monitoring and publication workflow.

## Open decisions
- ISSUE-001: canonical descriptive labels for P1-P5 policy materiality.
- ISSUE-002: analytical government-term boundary convention. Exact administration dates are stored, but this does not settle analytical term-window methodology.
- ISSUE-004: attribution confidence mapping where A-D is used in the External Conditions framework.
- ISSUE-005: final sector score weights, normalization and composite formulas.
- ISSUE-006: API and website implementation contracts.
- Final pilot sector.
- Final public data/content licensing treatment per source.

## Research gaps
- No substantive sector research has been loaded.
- No verified indicator observations have been loaded.
- No policy evaluation records have been completed.
- No public score has been calculated.

## Technical gaps
- Live PostgreSQL execution has not been run from this ChatGPT environment because no PostgreSQL server or Docker runtime is available here.
- CI is configured to execute clean-database migration, seed and integration validation.
- No source/data ingestion pipeline.
- No API or website implementation.

## Database foundation
- 33 canonical sectors seeded.
- 354 canonical sub-sector entries seeded from the Master Research Taxonomy.
- 28 States and 8 Union Territories seeded.
- India geography seeded.
- Government terms seeded as exact administration-date records for storage. Analytical boundary methodology remains open under ISSUE-002.
- Domains table implemented but not populated because the Project Sources do not provide a complete authoritative domain registry.
- Country table implemented and India seeded. International country coverage remains an explicit future registry dependency.
- Provenance, source snapshots, dataset vintages, observation revisions, audit events and public provenance view implemented.
- Scoring infrastructure implemented without final weights or composite formulas.

## Immediate next action
Verify CI execution of the database migration/integration workflow. If green, proceed to the Master Indicator Registry and Source Registry implementation without beginning substantive sector research.
