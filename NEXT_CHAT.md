# Next Chat

## Current position
Database foundation implementation completed in the repository on 2026-09-07, pending execution of the PostgreSQL CI validation workflow.

## Implemented
- Versioned PostgreSQL migrations.
- Canonical schema for governance, geography, sectors, policies, programmes, schemes, interventions, indicators, observations, sources, datasets, evidence, claims, outcomes, external events, counterfactuals, attribution, findings, scoring infrastructure, releases, audit and publication.
- Controlled vocabularies.
- Canonical taxonomy seed: 33 sectors and 354 sub-sectors.
- India plus 28 States and 8 Union Territories.
- Provenance and vintage structures.
- Migration and seed runners.
- Static and integration test coverage.
- GitHub Actions PostgreSQL validation workflow.

## Open controls
- ISSUE-001: materiality descriptions.
- ISSUE-002: analytical term-window convention.
- ISSUE-004: attribution confidence mapping.
- ISSUE-005: final scoring weights and composite formulas.
- ISSUE-DB-001: authoritative domain registry.
- ISSUE-DB-002: international country registry.
- ISSUE-DB-003: CI validation result.

## Research boundary
No substantive sector research, policy evaluation, verified observations or public scores have been added.

## Next executable task
Verify the PostgreSQL CI workflow. If it passes, implement the machine-readable Indicator Registry and Source Registry structures and seed only authoritative registry content already present in the Project Sources. Do not begin substantive sector research until the data foundation and registry layer are validated.
