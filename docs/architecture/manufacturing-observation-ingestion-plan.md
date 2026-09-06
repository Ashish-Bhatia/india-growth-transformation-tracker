# Manufacturing Observation Ingestion Plan

Status: Initial pilot ingestion design
Scope: Manufacturing pilot only

## Objective

Establish the first reproducible observation-ingestion chain without loading observations before source acquisition and vintage validation are complete.

## Canonical chain

Source Registry
→ Dataset Registry
→ Source Vintage
→ Source Snapshot
→ Locator
→ Raw artifact
→ Validation
→ Clean observation
→ Observation record

## Initial ingestion order

1. MoSPI IIP Manufacturing
2. MoSPI National Accounts Statistics
3. MoSPI Annual Survey of Industries
4. MoSPI PLFS
5. Department of Commerce TRADESTAT
6. DPIIT FDI statistics
7. RBI DBIE
8. India Budget and Demands for Grants
9. UNIDO INDSTAT Revision 4

IIP is first because it provides the highest-frequency Manufacturing pilot indicator and has an explicitly controlled current 2022-23 base series.

## Required acquisition record

Every acquired vintage must record:

- source_id
- dataset_id
- vintage_id
- official release/version
- release date
- retrieval timestamp
- acquisition method
- source URL or endpoint
- query parameters where applicable
- raw artifact reference
- SHA-256 hash
- content type
- snapshot reference
- validation status
- anomaly flags
- reviewer status

## Processing rules

- Preserve the raw artifact unchanged.
- Create a source snapshot for each material acquisition.
- Do not create observations until the vintage and snapshot are registered.
- Do not silently replace an earlier vintage.
- Revisions create a new vintage and preserve the prior vintage.
- Keep financial-year and calendar-year periods explicit.
- Preserve source-defined units and methodology.
- Record every unit conversion or aggregation as transformation metadata.
- A validation flag triggers review. It does not prove an error.

## Pilot indicator mapping

- IND-MFG-IIP-001 ← DS-MOSPI-IIP-001
- IND-MFG-GVA-GROWTH-001 ← DS-MOSPI-NAS-001
- IND-MFG-GVA-SHARE-001 ← DS-MOSPI-NAS-001
- IND-MFG-ASI-GVA-001 ← DS-MOSPI-ASI-001
- IND-MFG-ASI-EMP-001 ← DS-MOSPI-ASI-001
- IND-MFG-PLFS-SHARE-001 ← DS-MOSPI-PLFS-001
- IND-MFG-UNIDO-MVA-001 ← DS-UNIDO-INDSTAT-R4-001

The remaining registered datasets support later Manufacturing policy, investment, trade and financial analysis but do not receive observations until an indicator mapping is established.

## First ingestion acceptance gate

A vintage is eligible for observation loading only when:

1. Dataset Registry mapping is valid.
2. Source Registry mapping is valid.
3. Official release/version is identified.
4. Raw artifact is preserved or a permitted source reference is recorded.
5. SHA-256 is recorded when an artifact is acquired.
6. Source snapshot is registered.
7. Locator is recorded where needed.
8. Structural validation passes.
9. Units and time basis are validated.
10. Methodology/revision status is recorded.

No observation is published directly from an unvalidated acquisition.

## Methodology controls

- IIP: current 2022-23 base series only. Do not silently splice the superseded 2011-12 series.
- ASI: registered organised manufacturing only. Do not interpret ASI as total manufacturing.
- PLFS: 2025 sampling-design change requires explicit comparability treatment.
- UNIDO: international comparison remains subject to the unresolved peer-basket methodology.
- No scoring or attribution is part of this ingestion stage.
