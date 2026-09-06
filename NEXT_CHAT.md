# Next Chat

## Current position
Registry layer is execution-validated as of 2026-09-07. The project is now at the operational provenance and ingestion-conventions phase.

## Completed
- Versioned PostgreSQL migrations.
- Canonical schema for governance, geography, sectors, policies, programmes, schemes, interventions, indicators, observations, sources, datasets, evidence, claims, outcomes, external events, counterfactuals, attribution, findings, scoring infrastructure, releases, audit and publication.
- Controlled vocabularies.
- Canonical taxonomy seed: 33 sectors and 354 sub-sectors.
- India plus 28 States and 8 Union Territories.
- Provenance and vintage structures.
- Migration and seed runners.
- Static and integration test coverage.
- GitHub Actions PostgreSQL validation workflow.
- CI run 34057565918 successfully executed PostgreSQL 16, clean migration, canonical seed loading, static tests and database integration tests.
- Machine-readable Source Registry JSON Schema and registry document.
- Machine-readable Master Indicator Registry JSON Schema and registry document.
- Registry structural tests and CI coverage.
- Registry seed-boundary documentation.
- CI run 34058734002 successfully executed registry tests, PostgreSQL 16 migration, seed loading and database integration tests.

## Registry seed status
Both registries are intentionally empty. The Project Sources define the required metadata structures, source hierarchy and indicator families, but do not provide complete authoritative record-level registries with source mappings. No fabricated records were added.

## Open controls
- ISSUE-INIT-001: materiality descriptions.
- ISSUE-INIT-002: analytical term-window convention.
- ISSUE-INIT-004: attribution confidence mapping.
- ISSUE-INIT-005: final scoring weights and composite formulas.
- ISSUE-INIT-006: API and website implementation contracts.
- ISSUE-DB-001: authoritative domain registry.
- ISSUE-DB-002: international country registry.
- ISSUE-REG-001: authoritative record-level source and indicator registry seed dependency.

## Research boundary
No substantive sector research, policy evaluation, verified observations or public scores have been added.

## Next executable task
Implement operational provenance and ingestion conventions using the existing source, dataset, snapshot, locator, vintage and observation structures. Define:

1. source acquisition record conventions
2. raw, clean and derived layer lineage
3. dataset and vintage registration
4. snapshot and hash conventions
5. source locator conventions
6. transformation and calculation provenance
7. release-calendar and freshness metadata
8. source-change and methodology-change handling
9. validation and anomaly states
10. reproducible ingestion contracts and tests.

Do not begin substantive sector research until the database, Source Registry, Indicator Registry, provenance chain and ingestion conventions are operational.