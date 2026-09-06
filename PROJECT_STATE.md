# Project State

Version: 0.14.0-ingestion-integrity-correction
State date: 2026-09-07

## Current phase
Manufacturing pilot-sector onboarding, minimum authoritative Dataset Registry and Indicator Registry establishment, with ASI 2023-24, two IIP release-state vintages and NAS 2026 acquired vintages represented in the provenance layer and registered Manufacturing observations ingested. The current gate is ingestion-validation integrity. PLFS acquisition is explicitly blocked until this gate is complete.

## Verified repository state
- Current main HEAD: `9fcfa29082e81fb82ff0dffb1e93bf1426e9ddfc`.
- Latest commit: `docs: record repository integrity audit findings`.
- Latest CI run exercising the corrected Database Validation workflow: run `34064219332`, Database Validation #32, terminal `success`, on correction commit `ebb7b5fc3d80fa7e1b32b4922bf7a25e9ddb5498`.
- Current HEAD is a docs-only descendant of the CI-tested correction commit. No separate workflow run is exposed for current HEAD, so current-HEAD CI status remains `no run`; do not infer success for the current HEAD.
- Database Validation #26: run `34063566617`, terminal `success`, on HEAD `966ab5ab518c4d361e21e876023d2ec9a6788c02`.

## Completed
- PostgreSQL schema and migration foundation.
- Source Registry, Dataset Registry, Indicator Registry and provenance/ingestion contracts.
- Manufacturing pilot selection.
- Two preserved IIP release-state vintages and 41 canonical IIP observations.
- ASI 2023-24 provenance, vintage, snapshot, locators, manifest, validation report and two observations.
- NAS 2026 provenance, vintage, snapshot, locators, manifest, validation report and seven registered Manufacturing observations.
- ASI registered-organised-manufacturing coverage limitation preserved.
- Dataset-level acquisition status remains separate from vintage-level acquisition state.
- Dataset-specific ASI, IIP and NAS ingestion tests are now mandatory in Database Validation.
- Database Validation workflow path filters now include `data/raw/**` and `data/canonical/**`, so data-only changes trigger validation.
- Database Validation #32 executed registry/provenance tests plus `tests/test_asi_ingestion.py`, `tests/test_iip_ingestion.py` and `tests/test_nas_ingestion.py`, followed by database migration, seed and integration tests. All terminal steps succeeded.
- `source_registry_seeded` and `indicator_registry_seeded` semantics corrected to represent current authoritative registry seeding. Both are now `true`.
- Operational provenance documentation aligned with the current seeded-registry architecture.
- NAS ingestion manifest corrected to conform to the ingestion-manifest schema, with explicit source-reference lineage preserved.
- NAS binary artifact hash remains explicitly unavailable. `file_hash` remains `null`; no byte-level artifact preservation is claimed.

## Validation boundary
- CI success is recorded separately from registry validation, schema validation, database integration, dataset ingestion validation, source/vintage validation and observation validation.
- Database integration currently validates migrations, seed state and referential integrity. It does not load canonical observation CSVs because `scripts/db_seed.py` currently seeds the taxonomy foundation only. This is an architectural boundary, not evidence that canonical observations were loaded into PostgreSQL.
- Dataset-specific ingestion tests validate the acquired ASI, IIP and NAS canonical observation files and their associated vintage, manifest and validation metadata. CI #32 provides the terminal execution result for those tests.
- The ingestion tests do not establish causal validity, policy effectiveness, attribution or scoring.

## Historical CI audit
- #9: stale Source Registry version assertion. Attempt 2 also failed.
- #10: stale Source Registry version assertion.
- #11: stale Source Registry version assertion.
- #12: stale Source Registry assertion plus stale empty-Indicator-Registry assertion.
- #23: stale Indicator Registry version assertion.
- #24: same stale Indicator Registry assertion.
- #25: stale Source Registry version assertion.
- #26: corrected Indicator Registry version contract and passed.
- These historical failures are registry-test contract failures. They are not demonstrated ASI, IIP or NAS data failures.

## Integrity findings resolved
- Database Validation did not previously execute dataset-specific ingestion tests. Corrected.
- Workflow did not previously trigger on raw/canonical observation changes. Corrected.
- Provenance convention flags incorrectly remained false after authoritative registries were seeded. Corrected.
- Operational provenance documentation retained the obsolete unseeded-registry boundary. Corrected.
- NAS ingestion manifest did not conform to the ingestion-manifest schema. Corrected.
- NAS source-reference lineage was incomplete because the binary artifact was unavailable. A permitted source-reference object is now preserved; binary hash remains null.

## Remaining blockers
- Current HEAD `9fcfa29082e81fb82ff0dffb1e93bf1426e9ddfc` has no separate CI run. Do not describe current-HEAD CI as passed. The corrected workflow itself was terminal-successful on run `34064219332` at commit `ebb7b5fc3d80fa7e1b32b4922bf7a25e9ddb5498`.
- PLFS acquisition remains blocked until the ingestion-validation gate is formally closed.
- Direct binary artifact retrieval limitation remains open for IIP, ASI and NAS. Preserve `file_hash=null` where no binary artifact was retrieved.
- IIP 2022-23-base methodology break remains an explicit comparability control.
- NAS 2022-23-base methodology change remains an explicit comparability control.

## Methodological controls
- ASI remains registered organised manufacturing only.
- IIP current series remains separate from the superseded 2011-12-base series.
- NAS current series remains separate from the superseded 2011-12-base series.
- Revision and provisional status are preserved in canonical observations.
- No policy evaluation, attribution, counterfactual analysis or scoring has been introduced.

## Immediate next action
Verify the final current HEAD and continuity files after the integrity correction. Confirm that the corrected workflow and provenance contracts remain unchanged from the terminal-successful CI-tested correction commit, then resolve the current-HEAD CI status without manufacturing a run. Only after the CI/continuity gate is closed should the project select or acquire PLFS.
