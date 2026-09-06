# Next Chat

## Current position
Manufacturing (`MFG`) is selected as the first pilot sector. The Source Registry has 12 verified records, including MoSPI Annual Survey of Industries for State/industry manufacturing data and UNIDO Statistics for international manufacturing benchmarking. The database contains Dataset and Indicator structures, but no pilot Dataset Registry records, Indicator Registry records or observations have been seeded.

## Verified repository state
- Latest known main HEAD: 8ca8e6fb454f233305dea22be4fb77c989ada99d.
- Immediate source-registry implementation commit: 7184c501169ee3abfe6c4394ca7ae87359d09d14.
- Source-registry commit CI run: GitHub Actions `Database Validation`, run 34060700876, observed in progress. Do not claim success or failure until a terminal result is actually available.
- Earlier database validation run 34057565918 succeeded.
- Earlier registry-layer validation run 34058734002 succeeded.

## Completed
- PostgreSQL schema and migration foundation.
- Controlled vocabularies.
- Canonical taxonomy: 33 sectors and 354 sub-sectors.
- India plus 28 States and 8 Union Territories.
- Provenance structures and ingestion manifest contract.
- Source Registry and Master Indicator Registry contracts.
- Initial 10-record Source Registry seed.
- Verified MoSPI ASI Source Registry record.
- Verified UNIDO Statistics Source Registry record.
- Manufacturing pilot selection recorded as DECISION-PILOT-001.

## Current registry status
- Source Registry: 12 verified source records.
- Dataset Registry: no authoritative pilot dataset records yet.
- Indicator Registry: intentionally empty.
- Observation layer: empty.
- No substantive sector research, policy evaluation, attribution or score exists.

## Pilot rationale
The Research Execution Protocol requires a pilot with strong official data, clear policy interventions, measurable outcomes, international benchmarks and State variation. Manufacturing satisfies the currently evidenced criteria through the existing MoSPI, RBI, fiscal, trade, FDI and labour sources, MoSPI ASI State/industry manufacturing coverage, and UNIDO international manufacturing statistics. The recommended onboarding sequence also places Manufacturing immediately after Infrastructure. This selection is not based solely on ease of data access.

## Open controls
- ISSUE-INIT-001: materiality descriptions.
- ISSUE-INIT-002: analytical government-term boundary convention.
- ISSUE-INIT-004: attribution confidence mapping.
- ISSUE-INIT-005: final scoring weights and composite formulas.
- ISSUE-INIT-006: API and website implementation contracts.
- ISSUE-DB-001: authoritative domain registry.
- ISSUE-DB-002: international country registry.
- ISSUE-REG-001: indicator-side registry seed dependency.
- Final international peer basket methodology.
- Final public data/content licensing treatment per source.
- Current source-registry commit CI terminal result, if not yet resolved.

## Exact next executable task
1. Verify the terminal result of Database Validation run 34060700876 for commit 7184c501169ee3abfe6c4394ca7ae87359d09d14 if it has reached a terminal state. Do not rerun or manufacture CI.
2. Inspect the actual repository state after that validation.
3. Establish the minimum authoritative Dataset Registry records required for Manufacturing, using only verified dataset-level metadata from MoSPI ASI, MoSPI NAS/IIP, PLFS, India Budget, Commerce trade, DPIIT FDI, RBI DBIE and UNIDO where each dataset is directly verified.
4. Seed only the minimum Indicator Registry records whose definitions, units, frequency, directionality, geography, sector/sub-sector mapping, source/dataset mapping, methodology and provenance are independently verified.
5. Do not ingest observations until Dataset and Indicator registration is complete and provenance requirements are satisfied.
6. Do not begin full Manufacturing policy research, attribution or scoring yet.

## Research boundary
The first pilot must follow:
Source → Dataset → Indicator → Observation → Evidence → Policy → Attribution → Sector analysis → Score → Publication.
No layer should be skipped. Observed change and attributed change remain separate. Source tier remains separate from evidence grade and causal strength.

## What not to repeat
Do not repeat initialization audit, database design, migration framework design, taxonomy design, provenance architecture, registry contract design, the existing 12 Source Registry records, prior CI absence investigation for the old HEAD, or methodology-document creation.
