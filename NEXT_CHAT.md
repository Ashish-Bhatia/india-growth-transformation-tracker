# Next Chat

## Current position
Manufacturing (`MFG`) remains the first pilot sector. PLFS acquisition and validation is CLOSED at the dataset-ingestion boundary. Historical ASI GVA/person-engaged and OBICUS descriptive acquisition are complete for their documented tranches. NAS binary acquisition is PARKED after three primary-source attempts. Manufacturing trade boundary methodology is APPROVED as `MFG-TRADE-MAP-1.0`; manufacturing-product export/import indicators are registered, and manufacturing-product import dependence is registered as PROVISIONAL. No trade observations have been acquired.

## Repository and CI verification
- Actual `main` HEAD must be verified directly from GitHub at the start of the next chat.
- Exact current-HEAD CI is `NO RUN / NOT VERIFIED` unless a later exact-SHA check establishes otherwise.
- Latest verified dataset CI: Database Validation #35, run `34066759564`, terminal `success`, tested SHA `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`. Do not inherit this result to descendants.
- Recent methodology and registry commits must be verified from the actual branch tip.

## NAS and OBICUS controls
- Do not retry NAS Statements 27-34 unless a genuinely new official source mechanism or materially different accessibility condition becomes available. Do not perform attempt 4.
- Do not retry OBICUS 2014-15 during the next action. `ISSUE-DATA-OBICUS-001` remains parked.

## Manufacturing trade methodology
- Read and use `docs/methodology/manufacturing-trade-boundary-v1.md`, version `MFG-TRADE-MAP-1.0`.
- Economic activity boundary: NIC 2008 Section C, Divisions 10-33.
- Merchandise operational subset: in-scope manufacturing products mapped from the applicable ITC (HS) edition.
- Classification stack: ITC (HS) 8-digit → HS 6-digit → CPC/UNSD correspondence → ISIC Rev. 4 → NIC 2008. NPCMS is a validation/reference layer.
- Mapping statuses: `IN_SCOPE`, `OUT_OF_SCOPE`, `MIXED`, `UNRESOLVED`, `SPECIAL_CASE`.
- MIXED and UNRESOLVED lines are excluded from core aggregates. No proportional allocation.
- Mapping is HS-edition specific. Preserve historical nomenclature and correlation tables.
- Recorded re-exports/re-imports remain included unless a reproducible exclusion field exists. Do not describe mapped trade as domestic-origin manufacturing exports.
- `IND-MFG-TRADE-EXPORTS-001` and `IND-MFG-TRADE-IMPORTS-001` are registered but have no observations.
- `IND-MFG-TRADE-IMPORT-DEPENDENCE-001` is PROVISIONAL. It requires compatible domestic manufacturing-product output for the same mapped universe and valuation basis. Do not use manufacturing GVA as its denominator.

## Exact next research action
1. Verify actual `main` HEAD and exact CI state.
2. Verify `PROJECT_STATE.md`, `RESEARCH_LEDGER.md`, `DECISIONS_LOG.md`, `ISSUES_REGISTER.md` and `NEXT_CHAT.md` against repository state.
3. Re-read the governing Project Sources relevant to trade classification, indicator registration, source acquisition, evidence and data versioning.
4. Acquire the authoritative Department of Commerce/DGCI&S trade source for the required historical and current periods.
5. Preserve the applicable HS code directory/vintage and source snapshot before extracting observations.
6. Build the edition-specific HS code mapping table under `MFG-TRADE-MAP-1.0`, with code-level inclusion/exclusion/mixed/unresolved status and provenance.
7. Validate mapping coverage and materiality before loading trade observations.
8. Extract manufacturing-product exports and imports only after mapping validation.
9. Do not calculate manufacturing import dependence until a compatible domestic product-output dataset and denominator methodology are verified.
10. Perform descriptive validation only. Do not perform attribution, counterfactual analysis, policy evaluation or scoring.

## Required Project Sources
Research Charter; Research Methodology; Evidence & Source Standard; Attribution Framework; Scoring Framework; Data Governance & Versioning; Indicator Framework; Master Indicator Registry; Master Research Taxonomy and Data Model; Master Database Schema & Entity Relationship Model; Source & Data Acquisition Architecture; Research Execution Protocol & Sector Onboarding Framework; Sector Research Blueprint; Policy Evaluation Framework; External Conditions & Counterfactual Framework; GitHub Repository Specification.

## What not to repeat
Do not repeat database foundation work, Manufacturing baseline resolution, NAS acquisition attempts, OBICUS 2014-15 retrieval attempts, IIP acquisition, ASI 2023-24 acquisition, PLFS acquisition/validation, ASI GVA/person-engaged historical acquisition, or the completed Manufacturing trade-boundary methodology decision.

## Verification requirements
- Never inherit CI from an ancestor SHA.
- Verify every acquired observation through source → dataset → vintage → snapshot → observation lineage.
- Preserve HS edition and mapping version with every derived trade observation.
- Do not infer mixed or unresolved HS lines.
- Do not treat mapped trade as direct manufacturing-sector activity or domestic-origin manufacturing exports.
- No causal conclusion before descriptive validation and the required attribution chain.
