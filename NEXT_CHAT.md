# Next Chat

## Current position
Manufacturing (`MFG`) remains the first pilot sector. PLFS acquisition and validation is CLOSED at the dataset-ingestion boundary. The Manufacturing baseline indicator-gap review and formal registration review are complete. Historical descriptive acquisition is complete for the registered ASI GVA per person engaged diagnostic for 2013-14 through 2023-24 and for five historical RBI OBICUS CU-SA quarters from Q1:2023-24 through Q1:2024-25. An additional CU-only historical tranche now covers Q1:2015-16 through Q1:2018-19. Complete OBICUS historical CU/CU-SA backfill remains open.

## Repository and CI verification
- Actual `main` HEAD must be verified directly from GitHub at the start of the next chat.
- Exact current-HEAD CI is `NO RUN / NOT VERIFIED` unless a later exact-SHA check establishes otherwise.
- Latest verified dataset CI: Database Validation #35, run `34066759564`, terminal `success`, tested SHA `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`. Do not inherit this result to descendants.
- Latest acquisition/documentation commits after the previous handoff are `77eab72ccf87a77f7c1d646474f69ad284bdf459`, `d18bff896b6655e5f7625b219997eac259a4bda3`, `ce3de8030152502c189946f6d7645a6042c17454`, `39a6a099857869cb72cdf087754ed42f9a95a505` and `de3eb58383a3aa74b42b5ed8d29684fc1df6c6fe`. The next chat must verify the actual branch tip rather than assume the final SHA from this document.

## Completed acquisition boundary
- `IND-MFG-ASI-GVA-PPE-001`: 11 All-India annual observations, 2013-14 through 2023-24.
- Preferred ASI baseline: 2013-14 = ₹786,750 per person engaged.
- ASI vintages preserved: `VNT-MOSPI-ASI-2017-18`, `VNT-MOSPI-ASI-2019-20`, `VNT-MOSPI-ASI-2023-24`.
- `IND-MFG-OBICUS-CU-SA-001`: five All-India quarterly observations, Q1:2023-24 through Q1:2024-25.
- Raw OBICUS CU remains separately preserved in staged data. Canonical observation layer contains CU-SA only.
- Historical CU tranche: 13 All-India CU observations plus respondent counts, Q1:2015-16 through Q1:2018-19, under `VNT-RBI-OBICUS-2018-12-14`.
- Historical CU source: official Lok Sabha Annexure-II compilation of RBI OBICUS, published 2018-12-14. It explicitly states the estimates are based on RBI OBICUS, aggregate-level, indicative, and subject to varying survey coverage. It reports CU only.
- CU-SA was not present in the historical parliamentary artifact and was not inferred.
- Source-reference lineage and acquisition manifest are preserved. `file_hash=null` remains explicit because the binary artifact is not preserved.
- Descriptive validation only. No attribution, counterfactual, policy-effectiveness or scoring conclusion introduced.

## What not to repeat
Do not repeat the Codespace infrastructure audit, database foundation audit, NAS acquisition, IIP acquisition, ASI 2023-24 acquisition, PLFS dataset registration, PLFS source discovery, PLFS ingestion validation, Manufacturing baseline specification, prior continuity reconciliation, completed Manufacturing indicator-gap review, OBICUS source registration, OBICUS dataset registration, completed formal registration reviews, or completed ASI GVA/person-engaged historical acquisition.
Do not repeat the already acquired Q1:2023-24 through Q1:2024-25 OBICUS CU-SA tranche or the Q1:2015-16 through Q1:2018-19 CU-only tranche unless a source revision requires reconciliation.

## Exact next research action
1. Verify the actual current `main` HEAD and exact CI state.
2. Verify `PROJECT_STATE.md`, `RESEARCH_LEDGER.md`, `DECISIONS_LOG.md`, `ISSUES_REGISTER.md` and `NEXT_CHAT.md` against repository state.
3. Re-read the governing Project Sources relevant to historical acquisition, source evidence, versioning, indicator validation and descriptive analysis.
4. Continue historical OBICUS backfill from authoritative RBI release states, prioritising the quarters not yet represented and preserving CU and CU-SA separately.
5. Prefer direct RBI release Table 1 evidence for CU-SA. Where only an official compilation reports CU, preserve it as a CU-only staged companion and do not infer CU-SA.
6. Create a separate vintage for each material release state where revisions or methodology changes require it. Do not silently replace earlier release-state observations.
7. Preserve source references, snapshots/locators and acquisition manifests. Keep `file_hash=null` where the binary artifact is not preserved.
8. Validate units, periods, geography, duplicates, anomalies, respondent-panel coverage and methodology. Keep survey coverage limitations explicit.
9. Keep CU-SA contextual and do not score it. Keep CU as a separate diagnostic series.
10. Perform descriptive validation only. Do not perform attribution, counterfactual analysis, policy evaluation or scoring.

## Required Project Sources
Research Charter; Research Methodology; Evidence & Source Standard; Attribution Framework; Scoring Framework; Data Governance & Versioning; Indicator Framework; Master Indicator Registry; Master Research Taxonomy and Data Model; Master Database Schema & Entity Relationship Model; Source & Data Acquisition Architecture; Research Execution Protocol & Sector Onboarding Framework; Sector Research Blueprint; Policy Evaluation Framework; External Conditions & Counterfactual Framework; GitHub Repository Specification.

## Open issues
- `ISSUE-MFG-GAP-001` remains partially resolved. ASI GVA/person engaged is registered, but broader total-manufacturing real productivity remains unresolved.
- `ISSUE-MFG-GAP-002` through `ISSUE-MFG-GAP-005` remain open.
- IIP and NAS methodology boundaries remain open controls.
- PLFS 2025 methodology break remains an open comparability control.
- Binary source-artifact preservation limitations remain explicit.

## Verification requirements
- Never inherit CI from an ancestor SHA.
- Verify every acquired observation through source → dataset → vintage → snapshot → observation lineage.
- Do not claim CU-SA acquisition from a CU-only source.
- Preserve OBICUS CU and CU-SA separately.
- Preserve source-defined methodology and survey-coverage limitations.
- No causal conclusion before descriptive validation and the required attribution chain.
