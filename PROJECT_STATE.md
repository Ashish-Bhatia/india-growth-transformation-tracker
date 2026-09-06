# Project State

Version: 0.6.0-source-registry-seeded
State date: 2026-09-07

## Current phase
Authoritative Source Registry discovery and controlled seeding. Record-level Source Registry discovery has begun and the first verified Tier 1 source records have been seeded. The Indicator Registry remains intentionally unseeded. No substantive sector research has started.

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
- GitHub Actions PostgreSQL validation executed successfully on 2026-09-06, including clean migration, seed loading, static tests and integration tests.
- Machine-readable Source Registry contract implemented in `schemas/source-registry.schema.json` and `data/metadata/source-registry.json`.
- Machine-readable Master Indicator Registry contract implemented in `schemas/indicator-registry.schema.json` and `data/metadata/indicator-registry.json`.
- Registry structural tests added and CI coverage expanded.
- Registry layer CI validation completed successfully on GitHub Actions run 34058734002.
- Operational provenance and ingestion convention document implemented.
- Machine-readable ingestion manifest contract implemented in `schemas/ingestion-manifest.schema.json`.
- Machine-readable ingestion convention metadata implemented in `data/metadata/ingestion-conventions.json`.
- Provenance and ingestion convention tests implemented.
- Authoritative record-level Source Registry discovery completed for the initial controlled seed set.
- Ten verified Tier 1 official source records seeded in `data/metadata/source-registry.json`.

## Registry layer status
- Source Registry structure: implemented and CI-validated.
- Source Registry initial authoritative seed: 10 verified Tier 1 records.
- Source Registry seed records are limited to official Indian government/statutory sources whose source endpoints were independently verified during discovery.
- Indicator Registry structure: implemented and CI-validated.
- Indicator Registry authoritative records: not seeded. No indicator was added without a verified record-level definition and source mapping.
- No fabricated source or indicator records were added.

## Source discovery and verification boundary
- Discovery covered foundational macroeconomic, labour, price, industrial, financial, fiscal, trade, electricity, telecommunications and FDI source endpoints.
- Each seeded source record has a stable Source ID, source tier, source type, official URL, dataset relationship, retrieval method, release pattern, provenance metadata, licensing/access note and reliability metadata.
- Source tier remains separate from evidence grade and causal strength.
- Archive snapshots were not created merely from discovery. `archive_snapshot` remains null until an acquisition produces an actual archived artifact or reference.
- Dataset records, observations and indicator records remain separate implementation steps. Source discovery does not constitute data ingestion.

## In progress
- Continue authoritative record-level Source Registry discovery and controlled seeding where additional verified sources are identified.
- Establish Dataset Registry records only when authoritative dataset-level metadata and provenance are verified.
- Establish authoritative Indicator Registry records only where definitions, metadata and source mappings are verified.
- Formal resolution of documented terminology conflicts before policy onboarding and scoring.

## Pending
- Authoritative domain taxonomy seed, once a complete domain registry is established.
- International country registry expansion beyond India.
- Full ETL and data-quality validation framework.
- Pilot sector selection and onboarding.
- Pilot data ingestion and research.
- Attribution and scoring engines.
- API and website implementation.
- Automated source monitoring and publication workflow.

## Open decisions
- ISSUE-INIT-001: canonical descriptive labels for P1-P5 policy materiality.
- ISSUE-INIT-002: analytical government-term boundary convention. Exact administration dates are stored, but this does not settle analytical term-window methodology.
- ISSUE-INIT-004: attribution confidence mapping where A-D is used in the External Conditions framework.
- ISSUE-INIT-005: final sector score weights, normalization and composite formulas.
- ISSUE-INIT-006: API and website implementation contracts.
- ISSUE-REG-001: indicator-side registry seed dependency remains open.
- Final pilot sector.
- Final public data/content licensing treatment per source.

## Research gaps
- No substantive sector research has been loaded.
- No verified indicator observations have been loaded.
- No policy evaluation records have been completed.
- No public score has been calculated.

## Technical gaps
- Codespaces was not used in the database foundation validation. GitHub Actions provided the actual PostgreSQL execution environment.
- Full ETL/data-quality execution framework remains pending. This phase establishes its provenance and ingestion contracts and begins controlled source registration, not substantive source ingestion.
- API and website not implemented.

## Database foundation
- 33 canonical sectors seeded.
- 354 canonical sub-sector entries seeded.
- 28 States and 8 Union Territories seeded.
- India geography seeded.
- Four government-term records seeded with exact administration dates for storage. Analytical boundary methodology remains open under ISSUE-INIT-002.
- Domains table implemented but not populated because the Project Sources do not provide a complete authoritative domain registry.
- Country table implemented and India seeded. International country coverage remains an explicit future registry dependency.
- Provenance, source snapshots, dataset vintages, observation revisions, audit events and public provenance view implemented.
- Scoring infrastructure implemented without final weights or composite formulas.

## Validation record
- Database foundation workflow: `Database Validation`, run 34057565918, success.
- Registry layer workflow: `Database Validation`, run 34058734002, success.
- Provenance/ingestion convention layer: repository contract and structural tests implemented; PostgreSQL structures reused without schema alteration.
- Source Registry initial seed is contract-valid by repository tests after the controlled seed update.
- No indicator observations or substantive research records were ingested in this phase.

## Immediate next action
Continue record-level authoritative Source Registry discovery and controlled seeding, then establish verified Dataset Registry and Indicator Registry records only where authoritative definitions and mappings exist. Run the applicable registry and CI validation after each implementation change. Do not begin substantive sector research. Preserve all open decisions and dependencies, especially materiality, government-term boundaries, attribution confidence, scoring methodology, domain registry, international country registry and indicator registry seeding.
