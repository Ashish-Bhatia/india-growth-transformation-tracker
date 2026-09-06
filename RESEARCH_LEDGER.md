# Research Ledger

No substantive policy or causal sector research has been verified as completed. The first verified data-ingestion record for the Manufacturing pilot is now complete.

## Initialization record

- Research ID: INIT-001
- Question: What is the current project implementation state after review of all Project Sources?
- Sector: Project-wide
- Policy: None
- Date opened: 2026-09-07
- Sources searched: All 15 Project Source documents available in the project
- Sources found: 15 foundational framework documents
- Findings: Methodology and architecture are substantially specified. Implementation and substantive research were not evidenced at initialization.
- Conclusion: Project moved from initialization into database foundation implementation.
- Last verified: 2026-09-07

## Database foundation record

- Research ID: DB-001
- Question: Has the canonical PostgreSQL analytical foundation been implemented and execution-validated from the Project Sources?
- Sector: Project-wide
- Policy: None
- Date opened: 2026-09-07
- Sources used: Master Research Taxonomy and Data Model; Master Database Schema & ER Model; Data Governance & Versioning; Indicator Framework; Source & Data Acquisition Architecture; Research Execution Protocol; GitHub Repository Specification
- Implementation: PostgreSQL schema migration framework, controlled vocabularies, canonical taxonomy seed, migration runner, seed runner, static tests, integration test and CI workflow added to the repository.
- Taxonomy seeded: 33 sectors, 354 sub-sectors, government terms, India, 28 States, 8 Union Territories.
- Domains: Schema implemented; seed deferred because the Project Sources do not provide a complete authoritative domain registry.
- International geography: Country model implemented; India seeded; broader country registry deferred.
- Provenance: Sources, datasets, source snapshots, source locators, vintages, observation revisions, audit events and public provenance view implemented.
- Scoring: Configurable schema implemented; no final weights, normalization or composite formulas seeded.
- Research status: No substantive sector research or verified observations added at this stage.
- Validation: GitHub Actions workflow run 34057565918 executed against PostgreSQL 16 and completed successfully. Static migration tests, migrations, seed loading and database integration tests all passed.
- Last verified: 2026-09-07

## Registry layer record

- Research ID: REG-001
- Question: Does the repository contain machine-readable Source Registry and Master Indicator Registry structures without inventing unsupported records?
- Sector: Project-wide
- Policy: None
- Date opened: 2026-09-07
- Sources used: Source & Data Acquisition Architecture; Master Indicator Registry; Indicator Framework; Master Database Schema & ER Model; GitHub Repository Specification
- Implementation: JSON Schema contracts plus versioned machine-readable registry documents added under `schemas/` and `data/metadata/`. Registry structural tests added and CI workflow expanded to execute them.
- Source Registry fields covered: source ID, source name, institution, source tier, source type, URL/reference, dataset relationship, retrieval method, frequency, publication/release pattern, archive/snapshot, provenance, licensing/access, reliability metadata and status.
- Indicator Registry fields covered: permanent indicator ID, name, definition, unit, frequency, directionality, indicator type, measurement type, sector, sub-sector, domain, geography, baseline, benchmark, target, calculation method, methodology version, update class, health status, source mapping and version history.
- Seed boundary: no source or indicator records were invented. Project Sources specify required metadata and indicator families, but do not provide complete authoritative record-level registries with source mappings.
- Validation: GitHub Actions run 34058734002 completed successfully. Registry tests, PostgreSQL migration, seed loading and database integration tests all passed against PostgreSQL 16.
- Status: Registry layer execution-validated.
- Last verified: 2026-09-07

## IIP first-vintage ingestion record

- Research ID: DATA-MFG-IIP-001
- Question: Can the first authoritative Manufacturing IIP vintage be acquired, validated and loaded while preserving the required source, vintage, snapshot and observation lineage?
- Sector: Manufacturing (`MFG`)
- Indicator: `IND-MFG-IIP-001`
- Dataset: `DS-MOSPI-IIP-001`
- Vintage: `VNT-MOSPI-IIP-2022-23`
- Official release: 2026-06-01, first press release of the new IIP series with base year 2022-23.
- Acquisition: official MoSPI source reference preserved. Direct binary retrieval was unavailable in the execution environment, so no SHA-256 was claimed.
- Snapshot: `SNP-MOSPI-IIP-20260601-001`.
- Locators: `LOC-MOSPI-IIP-20260601-STATEMENT-I` and `LOC-MOSPI-IIP-20260601-STATEMENT-IIA`.
- Observation layer: 37 monthly observations from April 2023 through April 2026.
- Validation: passed with `methodology_change` flag. Base year, unit, frequency, geography, duplicate count, missing periods, annual indices and April 2026 growth reconciled successfully.
- April 2026: source identifies the observation as a quick estimate; canonical status is `provisional`.
- Evidence status: descriptive data evidence only. No policy, attribution or scoring conclusion was introduced.
- Local targeted test: `tests/test_iip_ingestion.py`, 1 passed.
- Last verified: 2026-09-07

## IIP August-2026 release-state vintage record

- Research ID: DATA-MFG-IIP-002
- Question: Does the official 28 August 2026 IIP release represent a new methodology vintage or a revised release-state of the existing 2022-23-base series, and can its revisions be ingested without altering the first vintage?
- Sector: Manufacturing (`MFG`)
- Indicator: `IND-MFG-IIP-001`
- Dataset: `DS-MOSPI-IIP-001`
- Vintage: `VNT-MOSPI-IIP-2022-23-20260828`
- Official release: 2026-08-28, Quick Estimates for July 2026.
- Determination: new release-state vintage of the existing 2022-23-base dataset, not a new base-year or indicator-definition vintage.
- Evidence: the release retains base 2022-23, states that June 2026 incorporates updated production data, and labels July 2026 a quick estimate. It reports manufacturing indices of 118.7 for April 2026, 122.2 for May 2026, 125.3 for June 2026 and 127.4 for July 2026.
- Revision handling: April 2026 is preserved as 119.3 in the June 1 vintage and recorded as 118.7 in the August 28 vintage. June 2026 is recorded as 125.3 in the August vintage. May 2026 is added. July 2026 is provisional.
- Snapshot: `SNP-MOSPI-IIP-20260828-001`.
- Locators: `LOC-MOSPI-IIP-20260828-STATEMENT-I`, `LOC-MOSPI-IIP-20260828-STATEMENT-IIA`, `LOC-MOSPI-IIP-20260828-STATEMENT-IV`.
- Acquisition: official release reference preserved. Direct binary artifact retrieval was unavailable, so no SHA-256 was claimed.
- Validation: passed with flags for prior-observation revisions and July 2026 quick estimate.
- Observation layer: four new release-state observations for April-July 2026. Canonical observation count is now 41 across two preserved vintages.
- Indicator health: `Watch`, because the latest observation is provisional and the series remains revision-prone.
- Evidence status: descriptive data evidence only. No policy, attribution or scoring conclusion was introduced.
- Last verified: 2026-09-07
