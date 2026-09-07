# Next Chat

## Current position
Manufacturing (`MFG`) remains the first pilot sector. PLFS acquisition and validation is CLOSED at the dataset-ingestion boundary. Historical ASI GVA/person-engaged and OBICUS descriptive acquisition are complete for their documented tranches. NAS 2026 Manufacturing GFCF acquisition is the current evidence task. The official eSankhyiki NAS route, indicator code `9`, 2022-23 current-series boundary, and required GFCF institutional/industry dimensions are verified, but live metadata/data retrieval is not yet available through an exposed permitted callable MoSPI execution route. A new official route was identified during this continuation: MoSPI's official `nso-india/esankhyiki-mcp` repository documents the hosted remote MCP server at `https://mcp.mospi.gov.in/`, including the required sequential `list_datasets → get_indicators → get_metadata → get_data` workflow. The official PIB release also confirms that NSO launched the eSankhyiki MCP server for direct AI access to official datasets. However, this project runtime has no exposed callable MCP connector for that server, and direct container execution cannot resolve the host. Therefore no live NAS metadata/data response was acquired through the new route. No NAS GFCF observations have been created. Manufacturing trade boundary methodology remains approved as `MFG-TRADE-MAP-1.0`; trade indicators are registered but have no observations.

## Repository and CI verification
- Actual `main` HEAD at this continuation boundary: `4abafedd9657d82a089e9cec3654efdcee75c79c4`.
- HEAD commit: `docs: record official eSankhyiki MCP acquisition route`.
- Exact-SHA workflow-run lookup for `4abafedd9657d82a089e9cec3654efdcee75c79c4` returned zero workflow runs.
- Exact-SHA combined-status lookup did not resolve the newly created SHA and returned `Ref not found`; therefore no terminal status is claimed. CI state remains `NO RUN / NOT VERIFIED`.
- Prior verified dataset CI remains Database Validation #35, run `34066759564`, terminal `success`, tested SHA `8a79fc7bcc3693d95d20ff8f51849685a7e1fe78`. This is an ancestor and is not inherited by current descendants.
- At this continuation boundary, `PROJECT_STATE.md`, `RESEARCH_LEDGER.md`, `DECISIONS_LOG.md`, `ISSUES_REGISTER.md` and `NEXT_CHAT.md` were checked against the repository. The prior `NEXT_CHAT.md` text incorrectly named `5c5a8afe52f193c0c069e19daa52c6122ce18134` as actual `main` HEAD; the Git ref independently verified the sequence through `4e28d56e930c2f61e79e2d5629318fea076181af` and then `4abafedd9657d82a089e9cec3654efdcee75c79c4`. This file now records the latest verified `main` state.

## NAS acquisition boundary
- NAS 2026 publication availability and the 2022-23-base Current-series route are verified.
- Official eSankhyiki NAS endpoint and parameter structure are verified.
- `indicator_code=9` is verified as Gross Fixed Capital Formation.
- Manufacturing `industry_code` and Public Sector, Private Corporations and Household `institutional_code` values must be obtained from the live eSankhyiki metadata response. Do not infer them from publication ordering, repository definitions, or legacy tables.
- No NAS GFCF metadata response was acquired.
- No NAS GFCF observation was acquired.
- No raw API response, source snapshot or SHA-256 artifact was created for the GFCF acquisition.
- No canonical NAS GFCF observation was loaded.
- `ISSUE-MFG-GAP-002` remains open for Manufacturing private/public investment classification.
- `ISSUE-DATA-NAS-002` remains open for the 2022-23-base methodology boundary.
- `ISSUE-DATA-NAS-003` remains open for revision/provisional status handling.

## Current acquisition-access finding
- The official eSankhyiki portal is reachable through the available web research route and states that its Macro Indicators and Data Catalogue provide downloadable official data without registration.
- MoSPI's official `nso-india/esankhyiki-mcp` repository documents a hosted remote MCP server at `https://mcp.mospi.gov.in/` and a four-step workflow: `list_datasets`, `get_indicators`, `get_metadata`, `get_data`.
- The official PIB release dated 6 February 2026 confirms the NSO launch of the eSankhyiki MCP server as a direct AI access mechanism for official statistics.
- The current project tool namespace does not expose that remote MCP server as a callable connector. Direct container HTTP execution against `mcp.mospi.gov.in` also failed at DNS resolution. The web research route cannot execute the MCP JSON-RPC POST required by the documented server workflow.
- This is a new official access route discovery, not a successful acquisition. Do not claim live metadata, codes or observations from the MCP source code or documentation.
- Do not infer hidden NAS routes, industry codes, institutional codes or API response values from unrelated eSankhyiki products.
- Do not substitute secondary data while the required official NAS GFCF response remains unavailable.

## OBICUS and trade controls
- Do not retry OBICUS 2014-15 during the next action. `ISSUE-DATA-OBICUS-001` remains an operational limitation.
- Do not retry NAS binary publication acquisition unless a genuinely new official source mechanism or materially different accessibility condition becomes available. The current task is API/metadata acquisition, not another binary attempt.
- Manufacturing trade methodology `MFG-TRADE-MAP-1.0` remains approved. `IND-MFG-TRADE-EXPORTS-001` and `IND-MFG-TRADE-IMPORTS-001` remain registered without observations. `IND-MFG-TRADE-IMPORT-DEPENDENCE-001` remains provisional and requires compatible domestic manufacturing-product output.

## Exact next research action
1. Use the exposed official MoSPI/eSankhyiki remote MCP execution route if a permitted callable connector becomes available, using the documented hosted endpoint `https://mcp.mospi.gov.in/`.
2. Discover NAS indicators through `list_datasets` and `get_indicators` in the documented workflow.
3. Retrieve metadata/filter values for `indicator_code=9`, `base_year=2022-23`, `series=Current`, annual frequency through `get_metadata`.
4. Preserve the complete metadata response before transformation.
5. Identify the exact Manufacturing `industry_code` from returned metadata.
6. Identify the exact Public Sector, Private Corporations and Household `institutional_code` values from returned metadata.
7. Retrieve annual GFCF observations for the required 2026-vintage years using only metadata-derived codes.
8. Preserve the complete raw API response.
9. Record source locator, endpoint, exact parameters, retrieval date and response SHA-256 where technically feasible.
10. Register Source, Dataset, Vintage and Snapshot.
11. Validate units, years, revision/finality status, dimensions, duplicates and completeness.
12. Load canonical observations only after validation.
13. Perform descriptive validation only.
14. Do not perform attribution, counterfactual analysis, policy evaluation or scoring.

## Required Project Sources
Research Charter; Research Methodology; Evidence & Source Standard; Attribution Framework; Scoring Framework; Data Governance & Versioning; Indicator Framework; Master Indicator Registry; Master Research Taxonomy and Data Model; Master Database Schema & Entity Relationship Model; Source & Data Acquisition Architecture; Research Execution Protocol & Sector Onboarding Framework; Sector Research Blueprint; Policy Evaluation Framework; External Conditions & Counterfactual Framework; GitHub Repository Specification.

## What not to repeat
Do not repeat database foundation work, Manufacturing baseline resolution, completed NAS Manufacturing GVA ingestion, NAS binary acquisition attempts already exhausted, OBICUS 2014-15 retrieval attempts, IIP acquisition, ASI acquisition, PLFS acquisition/validation, ASI GVA/person-engaged historical acquisition, or the completed Manufacturing trade-boundary methodology decision. Do not treat the official MCP repository source code or README as a substitute for the live NAS metadata/data response.

## Verification requirements
- Verify actual `main` HEAD and exact-SHA CI independently at the start of the next continuation boundary.
- Never inherit CI from an ancestor SHA.
- Verify continuity files against the repository state.
- Do not infer NAS industry or institutional codes.
- Preserve the raw metadata response and raw observation response before transformation.
- Preserve Source → Dataset → Vintage → Snapshot → Observation lineage.
- Do not create an observation unless the official eSankhyiki response is acquired and validated.
- Do not use secondary data as a substitute for the unavailable official NAS GFCF response.
- No causal or policy conclusion before the descriptive evidence chain is complete.

## Completion criteria
Authoritative eSankhyiki NAS Manufacturing GFCF observations acquired for the required 2026 vintage; exact Manufacturing and institutional-sector codes validated from metadata; raw metadata and data responses preserved; source locator, endpoint, parameters and retrieval date recorded; snapshot and vintage registered; observations validated; canonical observations loaded; and indicator-registration review ready.
