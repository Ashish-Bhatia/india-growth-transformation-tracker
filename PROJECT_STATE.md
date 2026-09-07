# India Growth & Transformation Tracker

## Current verified position

- Repository: `Ashish-Bhatia/india-growth-transformation-tracker`
- Actual `main` HEAD verified directly from GitHub: `71acf8cf93795fb335fbbfc2162ed0a61fe3a95a`.
- Exact current-HEAD CI: `NO RUN / NOT VERIFIED`.
- Latest verified dataset CI remains Database Validation #35, run `34066759564`, terminal `success`, tested SHA `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`. This is an ancestor and is not inherited by current descendants.

## Project phase

Manufacturing (`MFG`) remains the first pilot sector. PLFS acquisition and dataset-ingestion validation are closed. The baseline indicator-gap review and formal registration review for RBI OBICUS seasonally adjusted capacity utilisation and ASI GVA per person engaged are complete. Historical descriptive acquisition for both newly registered indicators has now been added.

## Completed acquisition work

- `IND-MFG-ASI-GVA-PPE-001`: 11 All-India annual observations acquired for 2013-14 through 2023-24 from official ASI release states.
- Preferred 2013-14 baseline: ₹786,750 per person engaged, directly published by ASI.
- ASI release-state lineage preserved across `VNT-MOSPI-ASI-2017-18`, `VNT-MOSPI-ASI-2019-20` and `VNT-MOSPI-ASI-2023-24`.
- `IND-MFG-OBICUS-CU-SA-001`: five quarterly All-India observations acquired for Q1:2023-24 through Q1:2024-25 from RBI OBICUS Table 1.
- Raw OBICUS CU is preserved separately in staged data. CU-SA is the only canonical registered indicator loaded.
- OBICUS CU-SA methodology note preserved: X13-ARIMA-SEATS with Q1:2020-21 treated as an additive outlier in the source release.
- Binary source artifacts remain unpreserved for these acquisitions; `file_hash=null` is explicit.
- Descriptive validation report added. No attribution, counterfactual, policy-effectiveness or scoring conclusion introduced.

## Verified dataset boundaries

- IIP: two preserved 2022-23-base release-state vintages. The methodology/base-year break from the superseded 2011-12 series remains an open comparability control.
- ASI 2023-24: acquired vintage with registered organised-manufacturing coverage limitation. ASI measures must not be presented as total manufacturing measures.
- ASI GVA/person engaged: nominal, current-price, registered organised manufacturing only. It is a productivity diagnostic, not a real total-manufacturing productivity measure.
- NAS 2026: acquired 2022-23-base vintage. The methodology boundary from the superseded 2011-12 series remains an open comparability control. Revised/provisional status is preserved.
- PLFS 2025: acquired vintage `VNT-MOSPI-PLFS-2025`; binary artifact not preserved, `file_hash=null`; sampling methodology and survey-cycle break remains an explicit comparability control.
- OBICUS: source and dataset registered; five historical CU-SA observations acquired. Complete historical OBICUS backfill remains open.

## Current analytical boundary

Existing observations remain descriptive research only. ASI GVA/person engaged is nominal and registered-organised. OBICUS CU-SA is contextual rather than automatically score-eligible. No causal, attribution, policy-effectiveness, counterfactual or scoring conclusion has been introduced.

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
- Trade candidates require an approved HS-to-Manufacturing mapping before registration.
- ASI, ASUSE and PLFS population/methodology boundaries must remain explicit.
- Candidate sources do not imply indicator approval; registered indicators require validated observations before analytical use.

## Open dependencies

- Complete historical OBICUS backfill, including earlier release states and the full available CU/CU-SA series.
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
- Manufacturing trade classification mapping.
- Manufacturing investment private/public classification.
- Manufacturing technology/R&D construct.
- Manufacturing quality construct.
- Broader total-manufacturing real productivity indicator remains unresolved.

## Required analytical sequence

Evidence → Data validation → Descriptive analysis → Attribution → Counterfactual analysis → Evaluation → Scoring.

## Continuity rule

Repository HEAD and exact CI state are verification facts, not inherited documentation claims. At each continuation boundary, read the actual Git ref and verify the exact SHA and workflow state before relying on this record.
