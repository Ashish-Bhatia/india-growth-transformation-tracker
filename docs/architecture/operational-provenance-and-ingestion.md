# Operational Provenance and Ingestion Conventions

Status: Implemented convention layer
Version: 1.0
Scope: Source, dataset, acquisition, snapshot, locator, vintage and observation ingestion

## 1. Purpose

This document defines the executable conventions for moving external evidence into the existing PostgreSQL provenance model without inventing source or indicator records.

Lineage:

Source → Dataset → Snapshot → Locator → Acquisition → Vintage → Observation → Transformation/Calculation → Publication

The existing database remains the system of record. JSON/YAML manifests describe ingestion intent and execution metadata. They do not replace canonical PostgreSQL records.

## 2. Registry boundary

Source Registry and Master Indicator Registry records remain unseeded until authoritative record-level discovery is completed. An ingestion run may discover candidate sources, but discovery does not silently create authoritative registry records.

A candidate source becomes a canonical Source Registry record only after source metadata is verified. An indicator becomes active only after its definition, source mapping, methodology and required metadata are verified.

## 3. Source acquisition convention

Every acquisition attempt receives a deterministic `acquisition_ref` in the ingestion manifest. The reference is operational history and is not a replacement for `source_id`.

Required acquisition metadata:

- acquisition reference
- source code or candidate source reference
- acquisition mode: automated, semi_automated, manual, research_extraction
- retrieval timestamp
- requested URL or endpoint
- query parameters when applicable
- response/content type
- HTTP status when applicable
- success/failure state
- failure reason when unsuccessful
- raw artifact reference
- checksum when an artifact exists
- operator or execution identity
- code version when automated

Acquisition attempts are append-only. A failed attempt is retained as operational history and does not overwrite a prior successful snapshot.

## 4. Raw, clean and derived lineage

RAW contains the source representation as acquired. It is immutable.

CLEAN contains parsed, typed, standardised and validated records. It remains traceable to RAW.

DERIVED contains calculations, transformations, benchmarks and scores. It references canonical inputs and methodology version.

No layer silently overwrites another. Reprocessing creates a new staged/clean result and a new lineage record.

## 5. Dataset registration

A Dataset ID is created only after the source record is established.

Minimum dataset registration:

- dataset code
- source ID
- name
- publisher
- coverage
- frequency
- units
- definitions
- dimensions
- methodology
- revision policy
- access location
- licence
- update schedule
- current version
- ingestion status
- validation status
- latest observation date

The dataset record describes the upstream product. It does not describe an individual release.

## 6. Snapshot convention

Each material retrieval produces a Source Snapshot when technically and legally feasible.

Snapshot metadata:

- source ID
- retrieval timestamp
- file/reference
- content type
- SHA-256 hash where applicable
- archive flag
- source version where available
- query parameters where applicable

A changed upstream artifact receives a new snapshot. A same-content retrieval may retain a new retrieval event while referencing the same content hash.

A hash identifies content. It does not establish source authority, evidence grade or causal strength.

## 7. Locator convention

Locators identify the precise support location inside a source.

Use the most specific available combination:

- page
- section
- table
- figure
- paragraph
- URL fragment
- locator text

For structured datasets, the locator should identify the relevant sheet, table, field, query/filter or row key through `locator_text` or the applicable source metadata.

The ingestion manifest records the applicable `locator_ids` when locators exist. A source without a precise locator remains usable for discovery, but material evidence should receive a precise locator before publication.

## 8. Vintage convention

A vintage represents the upstream release state of a dataset, not the date the tracker retrieved it.

Store:

- dataset ID
- release/publication date
- retrieval date
- version identifier when supplied
- file/content hash where applicable

The observation stores the vintage ID. Revisions create a new vintage and new observation version where the value changes.

Initial estimate, revised estimate, provisional value and final value remain distinguishable through observation status and vintage metadata.

## 9. Observation convention

An observation must not enter the analytical layer without:

- indicator ID
- reference period/date
- period type
- geography where applicable
- value or explicit null
- unit
- dataset ID
- vintage ID
- observation status
- retrieval date
- revision information where applicable

Publication date, reference period and retrieval date are distinct concepts. Financial-year and calendar-year periods must never be silently mixed.

Missing is not zero. An unavailable observation is represented explicitly.

## 10. Transformation and calculation provenance

Every derived value must identify:

- calculation ID or equivalent calculation reference
- input observation IDs or canonical input references
- transformation steps
- formula
- unit conversion, if any
- aggregation method, if any
- methodology version
- code version
- calculation timestamp

Examples include YoY, CAGR, annualisation, per-capita conversion, inflation adjustment and currency conversion.

Until a dedicated calculation registry is implemented, calculation metadata must be carried in the ingestion/derivation manifest and linked to the affected database record through the release or audit trail. No calculation is publication-ready without this lineage.

## 11. Release calendar and freshness

For scheduled datasets, maintain:

- dataset ID
- expected frequency/update class
- expected release date or rule
- actual release date
- next expected release where known
- last successful retrieval
- latest observation date
- freshness status

Freshness statuses are:

- Current
- Recent
- Stale
- Awaiting release

Source failure must never silently produce a current-looking value. Retain the last valid observation and expose its observation date.

## 12. Source and methodology changes

A source URL change does not automatically mean a new source entity. Determine whether publisher, document/dataset identity and semantic content remain the same.

Create a new Source or Dataset record when identity or scope materially changes. Create a new Snapshot for a changed retrieval artifact. Create a new Vintage for a new upstream release state.

A methodology change requires an Indicator Version where the definition or comparability changes. Preserve the old series/vintage and record the effective date and comparability status. Do not silently splice incompatible series.

## 13. Validation states

Ingestion separates acquisition state from data-quality state.

Acquisition states:

- discovered
- requested
- retrieved
- failed
- blocked
- superseded

Validation states:

- pending
- passed
- passed_with_flags
- failed
- not_applicable

Anomaly flags include:

- missing_period
- duplicate_observation
- unit_mismatch
- type_mismatch
- range_flag
- discontinuity
- schema_drift
- revision_detected
- methodology_change
- source_conflict

A flag triggers review. It does not automatically invalidate the observation.

## 14. Reconciliation

When sources disagree, preserve both observations or source records when they represent different definitions, coverage, methods or vintages.

Resolution must consider:

1. definition
2. reference period
3. methodology
4. revision status
5. coverage
6. unit
7. source authority

Do not select the more convenient value.

## 15. Ingestion contract

A valid ingestion manifest must be sufficient for another researcher to determine:

- which acquisition attempt is being described
- what was requested
- what was retrieved
- when it was retrieved
- from which source
- which dataset/version was used
- which artifact was preserved
- which hash identifies the artifact
- how the source location was identified
- which observations were loaded
- which validation state was assigned
- which transformations were applied
- which methodology/code version produced derived values

## 16. Publication boundary

Automatic ingestion may update low-risk descriptive data only after validation. Material analytical changes remain subject to human review.

Human approval is mandatory for:

- attribution changes
- policy verdicts
- methodology changes
- sector score methodology changes
- major public findings

## 17. Explicit non-goals

This phase does not:

- seed Source Registry records
- seed Indicator Registry records
- create substantive sector observations
- resolve policy materiality labels
- resolve analytical government-term windows
- resolve attribution confidence mapping
- finalize scoring weights or composite formulas
- seed the Domain registry
- expand the international country registry
- implement the API or website
