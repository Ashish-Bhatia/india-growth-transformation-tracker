# Research Ledger

No substantive policy or causal sector research has been verified as completed. The Manufacturing pilot contains repository-verified IIP, ASI and NAS descriptive data ingestion records. Dataset-specific ingestion validation is now executed by Database Validation CI.

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
- Seed boundary: authoritative Source and Indicator records are now present and verified. Registry seed flags therefore represent the current seeded state.
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
- CI validation: Database Validation #32 executed `tests/test_iip_ingestion.py` successfully.
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
- Evidence: the release retains base 2022-23, states that June 2026 incorporates updated production data, and labels July 2026 a quick estimate.
- Revision handling: April 2026 is preserved as 119.3 in the June 1 vintage and recorded as 118.7 in the August 28 vintage. May 2026 is added. July 2026 is provisional.
- Snapshot: `SNP-MOSPI-IIP-20260828-001`.
- Acquisition: official release reference preserved. Direct binary artifact retrieval was unavailable, so no SHA-256 was claimed.
- Validation: passed with flags for prior-observation revisions and July 2026 quick estimate.
- Observation layer: four new release-state observations for April-July 2026. Canonical observation count is now 41 across two preserved vintages.
- Indicator health: `Watch`.
- Evidence status: descriptive data evidence only. No policy, attribution or scoring conclusion was introduced.
- CI validation: Database Validation #32 executed the IIP ingestion test successfully.
- Last verified: 2026-09-07

## ASI 2023-24 ingestion record

- Research ID: DATA-MFG-ASI-001
- Question: Can the official ASI 2023-24 release be registered, validated and loaded for the registered Manufacturing ASI indicators while preserving the registered-organised-manufacturing coverage limitation?
- Sector: Manufacturing (`MFG`)
- Dataset: `DS-MOSPI-ASI-001`
- Vintage: `VNT-MOSPI-ASI-2023-24`
- Official release date: 2025-08-27.
- Reference period: April 2023-March 2024.
- Snapshot: `SNP-MOSPI-ASI-20250827-001`.
- Source locators: `LOC-MOSPI-ASI-20250827-PRESS-NOTE-TABLE-1`, `LOC-MOSPI-ASI-20250827-SUMMARY-ALL-INDIA`, `LOC-MOSPI-ASI-20250827-SUMMARY-STATE-GVA`.
- Acquisition manifest: `ACQ-MOSPI-ASI-2023-24`, retrieved status, lineage and validation status `passed_with_flags`.
- Validation report: `DS-MOSPI-ASI-001-VNT-MOSPI-ASI-2023-24`, status `passed_with_flags`, with `registered_manufacturing_coverage_limit` recorded.
- Observation layer: `IND-MFG-ASI-GVA-001` = 245833605 ₹ lakh, source-defined; `IND-MFG-ASI-EMP-001` = 19589131 persons. Both are All-India, observed, quality grade A, and linked to the ASI vintage and dataset.
- Coverage control: ASI GVA is not total manufacturing GVA; ASI persons engaged are not total manufacturing employment.
- Dataset status decision: `DS-MOSPI-ASI-001` remains dataset-level `registered_only`; acquisition is represented by `VNT-MOSPI-ASI-2023-24` as `acquired`.
- CI validation: Database Validation #32 executed `tests/test_asi_ingestion.py` successfully.
- Evidence status: descriptive data evidence only. No policy, attribution or scoring conclusion was introduced.
- Last verified: 2026-09-07

## NAS 2026 ingestion record

- Research ID: DATA-MFG-NAS-001
- Question: Can the current National Accounts Statistics release be acquired, validated and loaded only for already registered Manufacturing GVA indicators while preserving the 2022-23 methodology boundary?
- Sector: Manufacturing (`MFG`)
- Dataset: `DS-MOSPI-NAS-001`
- Vintage: `VNT-MOSPI-NAS-2026-08-31`
- Official release: 2026-08-31, National Accounts Statistics - 2026 publication.
- Snapshot: `SNP-MOSPI-NAS-20260831-001`.
- Acquisition manifest: `ACQ-MOSPI-NAS-2026`, status `retrieved` and schema-aligned.
- Source-reference lineage: `data/raw/mospi/nas/VNT-MOSPI-NAS-2026-08-31/source-reference.json` preserves the official publication reference. Binary artifact hash remains unavailable and is not claimed.
- Validation report: `DS-MOSPI-NAS-001-VNT-MOSPI-NAS-2026-08-31`, status `passed_with_flags`, flag `methodology_change`.
- Source locators: official MoSPI NAS publication page, official current-series manufacturing GVA release, and MoSPI FAQ/methodology reference.
- Registered observations ingested: `IND-MFG-GVA-GROWTH-001` for 2023-24 = 12.7%, 2024-25 = 9.3%, 2025-26 = 10.7%; `IND-MFG-GVA-SHARE-001` for 2022-23 = 14.7%, 2023-24 = 14.7%, 2024-25 = 14.5%, 2025-26 = 14.8%.
- Observation finality: 2024-25 records are marked revised; 2025-26 records are marked provisional. No value is presented as final where the source identifies a provisional estimate.
- Methodology control: current 2022-23-base series retained separately from the superseded 2011-12-base series. No cross-vintage splice or unsupported calculation was introduced.
- Indicator health: both NAS Manufacturing indicators remain `Watch` because current observations are present but the series remains revision-prone and the latest annual observation is provisional.
- Dataset status: `DS-MOSPI-NAS-001` remains `registered_only` at dataset level; the acquired state is represented by the vintage record.
- CI validation: Database Validation #32 executed `tests/test_nas_ingestion.py` successfully.
- Evidence status: descriptive data evidence only. No policy, attribution, counterfactual or scoring conclusion was introduced.
- Last verified: 2026-09-07

## Ingestion integrity correction record

- Research ID: DATA-INTEGRITY-001
- Question: Does Database Validation actually validate the acquired ASI, IIP and NAS ingestion boundary, and do provenance contracts reflect the current seeded registry architecture?
- Date opened: 2026-09-07
- Findings:
  - Database Validation #26 passed, but its workflow did not execute the dataset-specific ASI, IIP or NAS tests.
  - `tests/test_database_integration.py` validates migration, seed and referential integrity only; `scripts/db_seed.py` seeds the taxonomy foundation and does not load canonical observation CSVs.
  - `source_registry_seeded=false` and `indicator_registry_seeded=false` were stale after authoritative registries were populated.
  - NAS ingestion manifest was structurally inconsistent with the ingestion-manifest schema.
- Corrections:
  - Database Validation now executes `tests/test_asi_ingestion.py`, `tests/test_iip_ingestion.py` and `tests/test_nas_ingestion.py`.
  - Workflow path filters now include raw and canonical data trees.
  - Registry seed flags are now true and the operational provenance document reflects the seeded registry boundary.
  - NAS source-reference lineage was added and the NAS manifest was aligned to the schema. Binary hash remains null.
- Verification: Database Validation #32, run `34064219332`, terminal `success`. The dataset-specific ingestion test step, migration, seed and database integration steps all completed successfully.
- Current HEAD status: the continuity-document descendants after the CI-tested correction commit have no separate workflow run. Current-HEAD CI is recorded literally as `no run` and is not inferred from run #32.
- Conclusion: The dataset-specific ingestion validation boundary is implemented and terminal-successful at the correction commit. The remaining gate is explicit current-HEAD CI status plus continuity verification. PLFS remains blocked until that gate is closed.
- Evidence status: repository integrity and descriptive data validation only. No policy, attribution or scoring conclusion introduced.
- Last verified: 2026-09-07
