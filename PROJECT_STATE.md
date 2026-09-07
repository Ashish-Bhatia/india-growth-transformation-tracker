# India Growth & Transformation Tracker

## Current verified position

- Repository: `Ashish-Bhatia/india-growth-transformation-tracker`
- The repository's actual `main` HEAD is verified directly from GitHub at each continuation boundary.
- Exact current-HEAD CI must be verified against the SHA returned by GitHub. A successful run on an ancestor does not establish CI for a descendant.
- Latest verified dataset CI: Database Validation #35, run `34066759564`, terminal `success`, tested SHA `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`.
- Current HEAD `663b14a0bbb4a35c49838fd3734dee0eb4b58d80` has no exact-SHA workflow run; CI status is `NO RUN / NOT VERIFIED`.

## Project phase

Manufacturing (`MFG`) remains the first pilot sector. PLFS acquisition and dataset-ingestion validation are closed. The baseline indicator-gap review is complete. Formal registration review for priority candidates is now completed for RBI OBICUS seasonally adjusted capacity utilisation and ASI GVA per person engaged, and both indicators are registered. No observations have yet been acquired for these newly registered indicators.

## Completed registration work

- Registered authoritative RBI OBICUS source `SRC-RBI-OBICUS`.
- Registered OBICUS dataset `DS-RBI-OBICUS-001` with quarterly frequency, source-defined capacity-utilisation methodology, CU/CU-SA treatment and provenance controls.
- Registered `IND-MFG-OBICUS-CU-SA-001` as a contextual Manufacturing capacity indicator. Raw CU remains a companion diagnostic and is not silently replaced by CU-SA.
- Registered `IND-MFG-ASI-GVA-PPE-001` as a Manufacturing productivity diagnostic. It is explicitly nominal and limited to ASI registered organised manufacturing coverage.
- Verified official ASI historical availability for the preferred 2013-14 baseline. The official ASI 2013-14 release publishes GVA per person engaged directly.
- No new observations were acquired from these registrations.

## Verified dataset boundaries

- IIP: two preserved 2022-23-base release-state vintages. The methodology/base-year break from the superseded 2011-12 series remains an open comparability control.
- ASI 2023-24: acquired vintage with registered organised-manufacturing coverage limitation. ASI measures must not be presented as total manufacturing measures.
- NAS 2026: acquired 2022-23-base vintage. The methodology boundary from the superseded 2011-12 series remains an open comparability control. Revised/provisional status is preserved.
- PLFS 2025: acquired vintage `VNT-MOSPI-PLFS-2025`; binary artifact not preserved, `file_hash=null`; sampling methodology and survey-cycle break remains an explicit comparability control.
- OBICUS: source and dataset registered; no OBICUS observation vintage acquired yet.

## Current analytical boundary

Existing observations and registered indicators remain descriptive research only. No causal, attribution, policy-effectiveness, counterfactual or scoring conclusion has been introduced.

ASI GVA per person engaged is a nominal registered-organised-manufacturing productivity diagnostic, not a total-manufacturing or real productivity measure. OBICUS CU-SA is a capacity diagnostic and is contextual rather than automatically score-eligible.

## Baseline scope

The governing frameworks require examination of output, growth, productivity, investment, employment, wages where available, exports, imports, market size, capacity, fiscal support, infrastructure, financial access, competitiveness, quality, inclusion, international position and resilience where material. The preferred immediate pre-policy benchmark is 2013-14, with longer historical context where reliable comparable data exists.

## Methodological controls

- Preserve indicator definitions, units, frequency, geography, methodology, directionality and source mappings.
- Preserve source vintages and revisions.
- Do not splice incompatible IIP, NAS or PLFS methodologies.
- Preserve ASI registered-organised-manufacturing coverage and nominal-price limitation for GVA/person engaged.
- Preserve OBICUS raw CU and seasonally adjusted CU as distinct source measures.
- Observed change must precede attribution.
- Attribution, counterfactual analysis, policy evaluation and scoring remain downstream.
- Final scoring weights, normalization and composite formulas remain unresolved.
- Domain seed and international peer-basket methodology remain unresolved.
- Trade candidates require an approved HS-to-Manufacturing mapping before registration.
- ASI, ASUSE and PLFS population/methodology boundaries must remain explicit.
- Candidate sources do not imply indicator approval; registered indicators require validated observations before analytical use.

## Open dependencies

- Acquisition and validation of OBICUS historical observations.
- Acquisition and validation of ASI GVA/person engaged historical observations.
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
