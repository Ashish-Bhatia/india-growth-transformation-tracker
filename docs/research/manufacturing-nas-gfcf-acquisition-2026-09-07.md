# Manufacturing NAS GFCF Acquisition Record

Date: 2026-09-07
Status: Metadata and official-route verification complete; live observation acquisition blocked by unavailable MoSPI connector/API access in the current execution environment.

## Research scope

- Sector: Manufacturing (`MFG`)
- Target measure: Gross Fixed Capital Formation (GFCF)
- Dataset: MoSPI National Accounts Statistics (NAS), eSankhyiki
- Required vintage: 2026
- Base year: 2022-23
- Series: Current
- Frequency: Annual
- Target year: 2022-23 and onward where exposed by the 2026-vintage series
- Required institutional views: Public Sector, Private Corporations, Household
- Required industry view: Manufacturing

## Official API workflow verified

The official NSO India `esankhyiki-mcp` source documents the eSankhyiki workflow as indicator discovery, metadata/filter discovery, then data retrieval. Its NAS Swagger specification identifies the official endpoint as `https://api.mospi.gov.in/api/nas/getNASData` and defines `base_year`, `series`, `frequency_code`, `indicator_code`, `institutional_code`, `industry_code`, `year`, `revision_code`, `account_code`, `Format`, pagination and related parameters. The same specification records 2022-23 as the current base year and Current as the only supported series for that base year.

## Indicator verification

`indicator_code=9` is Gross Fixed Capital Formation in the official NAS indicator definitions bundled with the official NSO India eSankhyiki MCP implementation.

## Official publication cross-check

MoSPI's National Accounts Statistics 2026 publication is explicitly based on 2022-23 and was released on 31 August 2026. The official publication list includes:

- Statement 12: GFCF by asset & institutional sector at current and constant prices.
- Statement 27: GCF, GFCF, CIS, CFC by industry at current and constant prices.
- Statement 28: the same by industry for Public Sector.
- Statement 29: the same by industry for Private Corporations.
- Statement 30: the same by industry for Households.
- Statement 31: GFCF by type of asset and industry at current prices.
- Statement 32: GFCF by type of asset and industry for Public Sector.
- Statement 33: GFCF by type of asset and industry for Private Corporations.
- Statement 34: GFCF by type of asset and industry for Households.

These statements establish the intended analytical dimensions, but they are not substituted for the requested eSankhyiki API observations.

## Important classification control

The 2026 publication uses Public Sector, Private Corporations and Households as presentation dimensions in the relevant statements. Separately, the new-series methodology describes institutional sectors using SNA 2008 concepts, including non-financial private corporations, financial corporations, general government and household sector. Therefore institutional codes must be taken from the eSankhyiki metadata response and must not be inferred from publication ordering or legacy tables.

Likewise, the Manufacturing industry code must be taken from the eSankhyiki NAS metadata/filter response. No code is inferred from the position of Manufacturing in a publication table.

## Acquisition result

The official eSankhyiki API route and exact parameter structure were verified from the official NSO India implementation. The current tool namespace does not expose the connected MoSPI callable actions. Direct execution against `api.mospi.gov.in` was also unavailable from the execution environment because the host could not be resolved. Therefore:

- no NAS metadata response was acquired;
- no Manufacturing industry code was asserted;
- no institutional-sector codes were asserted;
- no 2022-23 Current GFCF observation was acquired;
- no raw API response or source snapshot was created;
- no canonical observation was loaded.

This is an access/execution blocker, not an evidence gap in the official source architecture.

## Verification references

- Official eSankhyiki NAS Swagger: `https://api.mospi.gov.in/api/nas/getNASData`
- Official NAS indicator code definition: `indicator_code=9`, Gross Fixed Capital Formation.
- Official MoSPI National Accounts Statistics 2026 publication, base year 2022-23.

## Next executable action

When an exposed MoSPI connector or permitted execution route is available, run:

1. NAS indicator discovery.
2. NAS metadata/filter discovery for `indicator_code=9`, `base_year=2022-23`, `series=Current`, annual frequency.
3. Capture and preserve the metadata response.
4. Identify the exact Manufacturing `industry_code` from metadata.
5. Identify exact Public Sector, Private Corporations and Household `institutional_code` values from metadata.
6. Retrieve annual observations for the required years.
7. Preserve the raw response and SHA-256 hash.
8. Register source, dataset, vintage and snapshot.
9. Validate units, years, revisions, dimensions and duplicate rows.
10. Load canonical observations only after validation.

No observation should be created from the publication cross-check alone.
