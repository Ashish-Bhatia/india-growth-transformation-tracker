# Research Ledger

No substantive policy or causal sector research has been verified as completed. The Manufacturing pilot contains repository-verified IIP, ASI, NAS and PLFS descriptive data ingestion records. Dataset-specific ingestion validation is executed by Database Validation CI.

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
- Seed boundary: authoritative Source and Indicator records are now present and verified.
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
- Acquisition: official MoSPI source reference preserved. Direct binary retrieval was unavailable, so no SHA-256 was claimed.
- Snapshot: `SNP-MOSPI-IIP-20260601-001`.
- Observation layer: 37 monthly observations from April 2023 through April 2026.
- Validation: passed with `methodology_change` flag. April 2026 is provisional.
- Evidence status: descriptive data evidence only. No policy, attribution or scoring conclusion was introduced.
- CI validation: Database Validation #32 executed `tests/test_iip_ingestion.py` successfully.
- Last verified: 2026-09-07

## IIP August-2026 release-state vintage record
- Research ID: DATA-MFG-IIP-002
- Question: Does the official 28 August 2026 IIP release represent a new methodology vintage or a revised release-state of the existing 2022-23-base series?
- Sector: Manufacturing (`MFG`)
- Indicator: `IND-MFG-IIP-001`
- Dataset: `DS-MOSPI-IIP-001`
- Vintage: `VNT-MOSPI-IIP-2022-23-20260828`
- Official release: 2026-08-28, Quick Estimates for July 2026.
- Determination: new release-state vintage of the existing 2022-23-base dataset, not a new base-year or indicator-definition vintage.
- Revision handling: April 2026 and June 2026 revisions are preserved; May is added; July 2026 is provisional.
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
- Acquisition manifest: `ACQ-MOSPI-ASI-2023-24`, retrieved status, lineage and validation status `passed_with_flags`.
- Validation report: `DS-MOSPI-ASI-001-VNT-MOSPI-ASI-2023-24`, status `passed_with_flags`, with `registered_manufacturing_coverage_limit` recorded.
- Observation layer: `IND-MFG-ASI-GVA-001` = 245833605 ₹ lakh; `IND-MFG-ASI-EMP-001` = 19589131 persons. Both are All-India, observed, quality grade A, and linked to the ASI vintage and dataset.
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
- Source-reference lineage preserved; binary artifact hash remains unavailable and is not claimed.
- Validation report: `DS-MOSPI-NAS-001-VNT-MOSPI-NAS-2026-08-31`, status `passed_with_flags`, flag `methodology_change`.
- Registered observations ingested: `IND-MFG-GVA-GROWTH-001` for 2023-24 = 12.7%, 2024-25 = 9.3%, 2025-26 = 10.7%; `IND-MFG-GVA-SHARE-001` for 2022-23 = 14.7%, 2023-24 = 14.7%, 2024-25 = 14.5%, 2025-26 = 14.8%.
- Observation finality: 2024-25 revised; 2025-26 provisional.
- Methodology control: current 2022-23-base series retained separately from the superseded 2011-12-base series. No cross-vintage splice introduced.
- Indicator health: both NAS Manufacturing indicators remain `Watch`.
- Dataset status: `DS-MOSPI-NAS-001` remains `registered_only` at dataset level; acquired state is represented by the vintage record.
- CI validation: Database Validation #32 executed `tests/test_nas_ingestion.py` successfully.
- Evidence status: descriptive data evidence only. No policy, attribution, counterfactual or scoring conclusion was introduced.
- Last verified: 2026-09-07

## Ingestion integrity correction record
- Research ID: DATA-INTEGRITY-001
- Question: Does Database Validation actually validate the acquired ASI, IIP and NAS ingestion boundary, and do provenance contracts reflect the current seeded registry architecture?
- Date opened: 2026-09-07
- Findings: Database Validation #26 passed but did not execute the dataset-specific ASI, IIP or NAS tests; database integration validates migration, seed and referential integrity only; registry flags and NAS manifest were stale/inconsistent.
- Corrections: Database Validation was expanded to execute ASI, IIP and NAS ingestion tests; raw/canonical paths were added to workflow triggers; registry flags and NAS provenance contracts were corrected.
- Verification: Database Validation #32, run `34064219332`, terminal `success`. Dataset-specific ingestion tests, migration, seed and database integration all completed successfully.
- Historical state: Before PLFS acquisition, the remaining gate was current-HEAD CI plus continuity verification and PLFS remained blocked. This is preserved as historical state and is superseded by the PLFS acquisition/validation record below.
- Last verified: 2026-09-07

## PLFS acquisition and validation record
- Research ID: DATA-MFG-PLFS-001
- Question: Can the official PLFS 2025 release state be acquired by reference and validated for the registered Manufacturing worker-share indicator while preserving its methodology boundary?
- Sector: Manufacturing (`MFG`)
- Indicator: `IND-MFG-PLFS-SHARE-001`
- Dataset: `DS-MOSPI-PLFS-001`
- Vintage: `VNT-MOSPI-PLFS-2025`
- Snapshot: `SNP-MOSPI-PLFS-20260327-001`
- Acquisition commit: `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`.
- Acquisition manifest: `ACQ-MOSPI-PLFS-2025`.
- Source locator and source-reference lineage preserved. Binary publication artifact is not preserved; `file_hash=null` remains explicit.
- Canonical observations: 2022 = 11.2%, 2023 = 11.7%, 2024 = 11.6%, 2025 = 12.1%.
- Validation: `tests/test_plfs_ingestion.py` verified vintage, snapshot, manifest, values, geography, dataset linkage, quality grade and methodology flag.
- Database Validation #35, run `34066759564`, terminal `success`, executed the PLFS ingestion test, migration, seed and database integration successfully on the acquisition commit.
- Boundary: PLFS acquisition and dataset-ingestion validation boundary is CLOSED.
- Methodology control: PLFS 2025 sampling methodology and survey-cycle change remains an explicit unresolved comparability break. Do not treat 2025 as seamlessly comparable with earlier PLFS methodology.
- Evidence status: descriptive data evidence only. No policy, attribution, counterfactual, effectiveness or scoring conclusion introduced.
- Last verified: 2026-09-07

## Documentation and continuity corrections
- `c1a6690e9980430c380c7e13912da63b52313ce2` updated `PROJECT_STATE.md` after PLFS validation.
- `dbc690b22de747a01520eb52cdc43cc1f77bdfd5` updated `NEXT_CHAT.md` as a documentation descendant.
- `567a74db8ae8388e9b63275b360751787188d753` reconciled the five continuity records after PLFS validation.
- `0d6b4d55c26d54b49ff0aef93ed69878cd7c4fd0` corrected `PROJECT_STATE.md` to the actual main HEAD at the time of correction.
- `3f28b18ad1acccff200d1059b1f657bc98220f20` corrected `NEXT_CHAT.md` to the then-current main HEAD.
- The current main HEAD must always be verified directly from GitHub. Documentation descendants do not inherit the CI result of the PLFS acquisition commit.
- Exact current-HEAD CI must be recorded literally as `NO RUN / NOT VERIFIED` unless an actual workflow run exists for the exact SHA.
