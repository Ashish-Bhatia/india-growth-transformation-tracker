# India Growth & Transformation Tracker

## Current verified position

- Repository: `Ashish-Bhatia/india-growth-transformation-tracker`
- Current main HEAD after the latest methodology/registry commits must be rechecked at the next continuation boundary.
- Exact current-HEAD CI: `NO RUN / NOT VERIFIED` unless a later exact-SHA check establishes otherwise.
- Latest verified dataset CI remains Database Validation #35, run `34066759564`, terminal `success`, tested SHA `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`. This is an ancestor and is not inherited by current descendants.

## Project phase

Manufacturing (`MFG`) remains the first pilot sector. PLFS acquisition and dataset-ingestion validation are closed. Baseline indicator-gap review and formal registration reviews for RBI OBICUS seasonally adjusted capacity utilisation and ASI GVA per person engaged are complete. Historical descriptive acquisition has progressed for both indicators. NAS binary acquisition is parked after three primary-source attempts. Manufacturing trade classification methodology is now approved and the initial manufacturing-product trade indicators are registered without observations.

## Completed acquisition work

- `IND-MFG-ASI-GVA-PPE-001`: 11 All-India annual observations acquired for 2013-14 through 2023-24 from official ASI release states.
- Preferred 2013-14 baseline: ₹786,750 per person engaged, directly published by ASI.
- ASI release-state lineage preserved across `VNT-MOSPI-ASI-2017-18`, `VNT-MOSPI-ASI-2019-20` and `VNT-MOSPI-ASI-2023-24`.
- `IND-MFG-OBICUS-CU-SA-001`: five quarterly All-India observations acquired for Q1:2023-24 through Q1:2024-25 from RBI OBICUS Table 1.
- Raw OBICUS CU remains separately preserved in staged data. CU-SA is the only canonical registered indicator loaded.
- Historical OBICUS CU tranche acquired for Q1:2015-16 through Q1:2018-19 from an official Lok Sabha Annexure-II compilation. Thirteen CU observations and respondent counts are preserved in staged data under `VNT-RBI-OBICUS-2018-12-14`.
- Descriptive validation remains the only analytical use. No attribution, counterfactual, policy-effectiveness or scoring conclusion introduced.

## NAS acquisition boundary

- NAS 2026 publication and Statements 27-34 were verified.
- Three materially distinct primary-source binary-acquisition routes were exhausted without acquiring the original XLS/XLSX binary.
- No NAS investment observations were created from unavailable binary content.
- `ISSUE-DATA-NAS-001` remains parked after the three-attempt limit. Do not perform a fourth attempt unless a genuinely new official source mechanism or materially different accessibility condition becomes available.
- `ISSUE-DATA-NAS-002` and `ISSUE-DATA-NAS-003` remain open controls for methodology and final/revised/provisional status.

## OBICUS retrieval boundary

- Q1:2014-15 through Q4:2014-15 RBI primary release Table 1 evidence was not acquired after the documented retry.
- `ISSUE-DATA-OBICUS-001` remains parked. Do not retry during the next action.
- No 2014-15 CU or CU-SA observation was added, inferred or substituted.

## Manufacturing trade methodology

- `MFG-TRADE-MAP-1.0` is the approved versioned methodology in `docs/methodology/manufacturing-trade-boundary-v1.md`.
- Economic-activity boundary: NIC 2008 Section C, Divisions 10-33.
- Merchandise operational subset: HS product lines demonstrably representing manufacturing products. NIC Division 33 remains in the activity taxonomy but is not forced into merchandise mapping because repair/installation is an activity/service concept.
- Classification stack: ITC (HS) 8-digit, HS 6-digit international anchor, CPC/UNSD correspondence, ISIC Rev. 4, NIC 2008. NPCMS is a validation/reference layer.
- Mapping statuses: `IN_SCOPE`, `OUT_OF_SCOPE`, `MIXED`, `UNRESOLVED`, `SPECIAL_CASE`.
- MIXED and UNRESOLVED lines are excluded from core aggregates. No proportional allocation is invented.
- Mapping is versioned by HS edition. Historical observations must use the applicable HS nomenclature.
- Recorded re-exports/re-imports remain included unless a reproducible source-level exclusion exists. The indicators are manufacturing-product trade measures, not domestic-origin manufacturing exports.
- Manufacturing-product export and import indicators are registered. Manufacturing-product import dependence is registered as `PROVISIONAL` and has no observations until compatible domestic product-output evidence is established.
- No trade observations have been acquired or loaded yet.

## Current analytical boundary

All current Manufacturing observations remain descriptive evidence. Trade indicators are definitions only until source acquisition and code-level mapping validation are completed. No causal, attribution, policy-effectiveness, counterfactual or scoring conclusion has been introduced.

## Methodological controls

- Preserve indicator definitions, units, frequency, geography, methodology, directionality and source mappings.
- Preserve source vintages and revisions.
- Do not splice incompatible IIP, NAS or PLFS methodologies.
- Preserve ASI registered-organised manufacturing coverage and nominal-price limitation for GVA/person engaged.
- Preserve OBICUS raw CU and seasonally adjusted CU as distinct source measures.
- Observed change must precede attribution.
- Attribution, counterfactual analysis, policy evaluation and scoring remain downstream.
- Final scoring weights, normalization and composite formulas remain unresolved.
- Domain seed and international peer-basket methodology remain unresolved.
- Trade code-level mapping must be versioned and validated before observations are loaded.
- ASI, ASUSE and PLFS population/methodology boundaries must remain explicit.
- Registered indicators do not imply acquired observations.

## Open dependencies

- Complete historical OBICUS backfill, within the parked retrieval control.
- PLFS 2025 comparability treatment.
- IIP methodology/base-year break.
- NAS methodology boundary.
- Binary artifact preservation limitations.
- Policy materiality terminology.
- Government-term analytical boundaries.
- Attribution-confidence taxonomy.
- Final scoring methodology.
- Domain seed.
- International peer-basket methodology.
- Manufacturing trade code-level mapping and acquisition.
- Manufacturing-product domestic-output dataset required for import dependence.
- Manufacturing investment private/public classification.
- Manufacturing technology/R&D construct.
- Manufacturing quality construct.
- Broader total-manufacturing real productivity indicator remains unresolved.

## Required analytical sequence

Evidence → Data validation → Descriptive analysis → Attribution → Counterfactual analysis → Evaluation → Scoring.

## Continuity rule

Repository HEAD and exact CI state are verification facts, not inherited documentation claims. At each continuation boundary, read the actual Git ref and verify the exact SHA and workflow state before relying on this record.
