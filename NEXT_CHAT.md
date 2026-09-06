# Next Chat

## Current position
Registry-layer implementation is complete and awaiting execution validation as of 2026-09-07.

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

## Next executable task after registry validation
Implement operational provenance and ingestion conventions using the existing source, dataset, snapshot, locator, vintage and observation structures. Define raw-to-clean-to-derived lineage, acquisition metadata, source-change handling, release calendars, validation states and reproducible ingestion contracts. Do not begin substantive sector research until the provenance chain and ingestion conventions are operational.