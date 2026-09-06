# Next Chat

## Current position
Operational provenance and ingestion conventions are implemented on main as of 2026-09-07. Database foundation and registry layer are execution-validated. The Source Registry and Master Indicator Registry remain intentionally unseeded.

## Completed
- Versioned PostgreSQL migrations.
- Canonical database schema for governance, geography, sectors, policies, programmes, schemes, interventions, indicators, observations, sources, datasets, evidence, claims, outcomes, external events, counterfactuals, attribution, findings, scoring infrastructure, releases, audit and publication.
- Controlled vocabularies.
- Canonical taxonomy: 33 sectors and 354 sub-sectors.
- India plus 28 States and 8 Union Territories.
- Source snapshots, locators, dataset vintages and observation revision structures.
- Source Registry and Master Indicator Registry JSON Schema contracts and intentionally empty registry documents.
- Registry structural tests and CI validation.
- Operational provenance and ingestion conventions.
- Machine-readable ingestion manifest contract.
- Provenance/ingestion convention tests.

## Registry seed status
Both registries are intentionally empty. No fabricated source or indicator records were added. Record-level seeding remains dependent on authoritative source discovery and verification.

## Open controls
- ISSUE-INIT-001: materiality descriptions.
- ISSUE-INIT-002: analytical government-term boundary convention.
- ISSUE-INIT-004: attribution confidence mapping.
- ISSUE-INIT-005: final scoring weights and composite formulas.
- ISSUE-INIT-006: API and website implementation contracts.
- ISSUE-DB-001: authoritative domain registry.
- ISSUE-DB-002: international country registry.
- ISSUE-REG-001: authoritative record-level source and indicator registry seed dependency.
- Final pilot sector.
- Final public data/content licensing treatment per source.

## Research boundary
No substantive sector research, policy evaluation, verified observations or public scores have been added.

## Next executable task
Begin authoritative record-level source discovery and controlled Source Registry seeding. For each verified source, establish the minimum dataset and provenance chain needed for future indicator registration. Then establish authoritative indicator records only where definitions and source mappings are verified.

Do not begin substantive sector research. Do not resolve open methodology decisions by implication. Do not seed domains or international countries without authoritative registry content. Preserve source tier separately from evidence grade and causal strength.
