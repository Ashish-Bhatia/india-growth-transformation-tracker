# Next Chat

## Current position
Manufacturing (`MFG`) remains the first pilot sector. PLFS acquisition and validation is CLOSED at the dataset-ingestion boundary. The Manufacturing baseline indicator-gap review is complete. Formal registration review for the priority candidates is complete for RBI OBICUS seasonally adjusted capacity utilisation and ASI GVA per person engaged. Both indicators are registered. No observations have been acquired for these new indicators.

## Repository and CI verification rule
- Verify the actual `main` HEAD directly from GitHub at the start of the next chat.
- Do not treat a SHA written in a prior continuity document as the current branch tip.
- Verify CI against the exact current SHA.
- Latest verified dataset CI: Database Validation #35, run `34066759564`, terminal `success`, tested SHA `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`.
- The current descendants require their own exact-SHA CI verification. Do not inherit the ancestor CI result.

## Completed registration boundary
- `SRC-RBI-OBICUS` registered in Source Registry.
- `DS-RBI-OBICUS-001` registered in Dataset Registry. Latest observation/vintage remains unverified and is therefore null.
- `IND-MFG-OBICUS-CU-SA-001` registered as a contextual capacity indicator. Raw CU remains a companion diagnostic.
- `IND-MFG-ASI-GVA-PPE-001` registered as a nominal ASI registered-organised-manufacturing productivity diagnostic.
- Official ASI 2013-14 release availability was verified. It directly reports GVA per person engaged of ₹7,86,750 for the all-India ASI aggregate.
- No new observations were acquired from these registrations.

## PLFS boundary
- Dataset-ingestion validation boundary: CLOSED.
- Vintage: `VNT-MOSPI-PLFS-2025`.
- Snapshot: `SNP-MOSPI-PLFS-20260327-001`.
- Acquisition manifest: `ACQ-MOSPI-PLFS-2025`.
- Four canonical observations: 2022 11.2%, 2023 11.7%, 2024 11.6%, 2025 12.1%.
- `file_hash=null` remains explicit because the binary publication artifact is not preserved.
- PLFS 2025 methodology break remains explicitly flagged and unresolved for strict comparability.

## Continuity status
- `PROJECT_STATE.md`, `RESEARCH_LEDGER.md`, `DECISIONS_LOG.md`, `ISSUES_REGISTER.md` and `NEXT_CHAT.md` remain canonical continuity records.
- Current research/documentation HEAD CI is `NO RUN / NOT VERIFIED` unless a later exact-SHA check establishes otherwise.

## What not to repeat
Do not repeat the Codespace infrastructure audit, NAS acquisition, IIP acquisition, ASI acquisition, PLFS dataset registration, `IND-MFG-PLFS-SHARE-001` registration, PLFS source discovery, PLFS ingestion validation, Manufacturing baseline specification, prior continuity reconciliation, completed Manufacturing indicator-gap review, OBICUS source registration, OBICUS dataset registration, or the completed preliminary registration reviews.

## Exact next research action
1. Verify the actual current `main` HEAD and exact CI state.
2. Verify all five continuity records against the actual repository state.
3. Re-read the governing Project Sources relevant to acquisition and indicator validation.
4. Acquire the historical OBICUS observation vintage through the canonical source → dataset → vintage → snapshot → observation workflow, preserving CU and CU-SA separately and recording source-defined release state.
5. Acquire the historical ASI GVA per person engaged observations, including the preferred 2013-14 baseline and subsequent comparable years, preserving source-defined release/vintage status.
6. Validate both datasets and observations against schema, units, periods, geography, methodology, duplicates, anomalies and comparability controls.
7. Perform descriptive validation only. Do not infer policy effects, attribution, counterfactuals or scores.
8. Preserve ASI registered-organised coverage and nominal-price limitations, and preserve OBICUS survey-panel/CU-SA methodology notes.
9. Keep ISSUE-MFG-GAP-002 through ISSUE-MFG-GAP-005 open until their respective methodological questions are resolved.

## Required Project Sources
Research Charter; Research Methodology; Evidence & Source Standard; Attribution Framework; Scoring Framework; Data Governance & Versioning; Indicator Framework; Master Indicator Registry; Master Research Taxonomy and Data Model; Master Database Schema & Entity Relationship Model; Source & Data Acquisition Architecture; Research Execution Protocol & Sector Onboarding Framework; Sector Research Blueprint; Policy Evaluation Framework; External Conditions & Counterfactual Framework; GitHub Repository Specification.
