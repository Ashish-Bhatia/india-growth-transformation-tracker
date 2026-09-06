# Project State

Version: 0.8.0-manufacturing-registry-seeded
State date: 2026-09-07

## Current phase
Manufacturing pilot-sector onboarding, minimum authoritative Dataset Registry and Indicator Registry establishment. Manufacturing (`MFG`) is selected as the first pilot sector. The Source Registry contains 12 verified records. The Dataset Registry now contains 9 authoritative dataset records and the Indicator Registry contains 7 minimum authoritative Manufacturing indicators. No observations have been loaded.

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
- Machine-readable Source Registry contract implemented.
- Machine-readable Master Indicator Registry contract implemented.
- Registry structural tests added and CI coverage expanded.
- Operational provenance and ingestion convention document implemented.
- Machine-readable ingestion manifest contract implemented.
- Initial controlled Source Registry seed of 10 verified Tier 1 official sources.
- MoSPI Annual Survey of Industries added as a verified Tier 1 manufacturing source.
- UNIDO Statistics Portal added as a verified Tier 2 international manufacturing source.
- Manufacturing (`MFG`) selected as the first pilot sector under DECISION-PILOT-001.
- Dataset Registry schema contract implemented in `schemas/dataset-registry.schema.json`.
- Nine authoritative Manufacturing pilot datasets registered in `data/metadata/dataset-registry.json`.
- Seven minimum authoritative Manufacturing indicators registered in `data/metadata/indicator-registry.json`.
- Registry tests updated to validate the current 12-source seed and the Dataset/Indicator Registry seeds.

## Registry layer status
- Source Registry: 12 verified records, 11 Tier 1 official Indian government/statutory sources and 1 Tier 2 international statistical source.
- Dataset Registry: 9 authoritative records, all mapped to verified Source Registry IDs.
- Indicator Registry: 7 authoritative Manufacturing records, all mapped to verified Dataset and Source Registry IDs.
- Indicator definitions include unit, frequency, directionality, geography, sector mapping, methodology, update class and version history.
- No observations are loaded.
- No evidence records are loaded.
- Source tier remains separate from data quality, evidence grade and causal strength.

## Pilot datasets
- MoSPI Annual Survey of Industries.
- MoSPI National Accounts Statistics.
- MoSPI Index of Industrial Production, current 2022-23 base series.
- MoSPI PLFS.
- India Budget and Demands for Grants.
- Department of Commerce TRADESTAT.
- DPIIT FDI statistics.
- RBI DBIE.
- UNIDO INDSTAT Revision 4.

## Pilot indicators
- Real manufacturing GVA growth.
- Manufacturing share of GVA.
- Manufacturing IIP.
- Registered manufacturing GVA from ASI.
- Registered manufacturing persons engaged from ASI.
- Manufacturing share of workers from PLFS.
- UNIDO manufacturing value added for international comparison.

## Important methodological controls
- IIP uses the current 2022-23 base series. The superseded 2011-12 series must not be silently spliced into the current indicator.
- ASI measures registered organised manufacturing and must not be presented as total manufacturing employment or GVA without qualification.
- PLFS 2025 changed sampling design. Cross-vintage comparability requires explicit treatment.
- UNIDO peer comparison remains constrained by the unresolved final international peer-basket methodology.
- No score methodology has been applied.

## CI validation record
- Database foundation workflow: `Database Validation`, run 34057565918, success.
- Registry layer workflow: `Database Validation`, run 34058734002, success.
- Source Registry update commit: 7184c501169ee3abfe6c4394ca7ae87359d09d14.
- Source Registry update CI: run 34060700876, terminal `failure`. Failure was confined to a stale test expecting Source Registry version 1.1.0 and 10 records, while the verified registry is version 1.2.0 with 12 records. Migration and integration tests were skipped because the test step failed.
- No CI rerun was performed for run 34060700876.
- New registry implementation CI result remains unresolved until GitHub exposes the new workflow run and its terminal result.

## In progress
- Verify the new registry implementation CI result.
- Confirm Dataset Registry and Indicator Registry schema/test validation.
- Prepare source-vintage and observation-ingestion design after registry validation.

## Pending
- Observation ingestion.
- Manufacturing policy inventory and evaluation.
- State manufacturing analysis.
- International peer methodology and comparison.
- External-condition and counterfactual analysis.
- Attribution and scoring.
- API and website implementation.
- Automated source monitoring and publication workflow.

## Open decisions
- ISSUE-INIT-001: canonical descriptive labels for P1-P5 policy materiality.
- ISSUE-INIT-002: analytical government-term boundary convention.
- ISSUE-INIT-004: attribution confidence mapping.
- ISSUE-INIT-005: final sector score weights, normalization and composite formulas.
- ISSUE-INIT-006: API and website implementation contracts.
- ISSUE-DB-001: authoritative domain registry.
- ISSUE-DB-002: international country registry expansion.
- ISSUE-REG-001: indicator-side registry seed dependency should now be reviewed against the seeded records.
- Final public data/content licensing treatment per source.
- Final approved international peer basket methodology.

## Research gaps
- No verified observations have been loaded.
- No substantive Manufacturing research has been loaded.
- No policy evaluation records have been completed.
- No attribution records have been completed.
- No public score has been calculated.

## Immediate next action
Verify the new `Database Validation` workflow result for the registry implementation without rerunning or manufacturing CI. If terminal, correct only any evidenced failure. After registry validation, begin observation-ingestion planning and source-vintage registration. Do not begin full policy research, attribution or scoring yet.
