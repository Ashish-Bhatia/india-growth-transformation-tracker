# Manufacturing Trade Boundary and HS-to-Manufacturing Mapping

Version: MFG-TRADE-MAP-1.0
Status: Approved methodological boundary
Effective date: 2026-09-07
Sector: Manufacturing (`MFG`)
Issue: `ISSUE-MFG-GAP-003`

## 1. Purpose

Define a reproducible boundary for manufacturing merchandise-trade indicators before trade observations are acquired or registered.

The mapping measures manufactured products traded by India. It does not claim to observe the economic activity of the exporting or importing firm. Therefore trade indicators must be labelled as manufacturing-product trade measures, not as direct measures of manufacturing-sector activity.

## 2. Economic-activity boundary

The Manufacturing sector boundary remains National Industrial Classification 2008 (NIC 2008), Section C, Manufacturing, covering Divisions 10-33.

For merchandise-trade measurement, the operational product boundary is the set of traded goods whose official product classification maps to manufacturing production. NIC Division 33, Repair and installation of machinery and equipment, remains inside the sector's economic-activity taxonomy, but it is not treated as a merchandise-product trade category because repair and installation are primarily activity/service concepts and do not map cleanly to traded goods.

The project therefore maintains two distinct concepts:

1. Manufacturing economic activity: NIC 2008 Section C, Divisions 10-33.
2. Manufacturing-product trade: merchandise HS lines mapped to manufacturing product output, with ambiguous or mixed lines excluded from core aggregates.

This distinction prevents a product-trade series from being misrepresented as an activity-based manufacturing series.

## 3. Official classification stack

Primary Indian classifications:

- ITC (HS), the Indian Trade Classification (Harmonized System), at the national 8-digit level, maintained for Indian merchandise trade.
- NIC 2008, maintained by MoSPI, for economic activities.
- NPCMS 2011, revised for ASI use, as an Indian manufacturing-product reference where useful for validation of product concepts.

International correspondence support:

- HS at the 6-digit level is aligned to the WCO Harmonized System.
- UNSD CPC correspondence tables provide HS-to-CPC links and CPC-to-ISIC links. NIC 2008 is based on ISIC Rev. 4 and is comparable at the 4-digit level.

The mapping therefore uses the following hierarchy where an authoritative correspondence exists:

ITC (HS) 8-digit
→ HS 6-digit
→ CPC product class
→ ISIC Rev. 4 activity
→ NIC 2008 activity

NPCMS is used as a validation/reference layer, not as a substitute for the economic-activity boundary.

## 4. Mapping unit

The canonical mapping table will be maintained at the finest stable Indian HS level available for the observation vintage, normally 8 digits.

Each row must contain at least:

- HS edition/version
- HS code
- HS description
- parent HS 6-digit code
- CPC code(s), where available
- ISIC Rev. 4 code(s), where available
- NIC 2008 code(s), where available
- mapping status
- manufacturing flag
- inclusion reason
- exclusion reason where applicable
- source/correspondence reference
- methodology version.

## 5. Classification rules

### IN_SCOPE

Include a traded HS line when the official product description and correspondence establish that the product is a manufactured product associated with NIC 2008 manufacturing activity.

### OUT_OF_SCOPE

Exclude products whose principal classification maps to agriculture, forestry, fishing, mining/quarrying, electricity/gas/water utilities, construction, or services rather than manufacturing production.

### MIXED

Use MIXED when a single HS line contains products or portions mapping to both manufacturing and non-manufacturing activity and no defensible official split exists at the available code level.

MIXED lines are excluded from core manufacturing-product aggregates. No proportional allocation is invented.

### UNRESOLVED

Use UNRESOLVED where authoritative correspondence is absent and the product description is insufficient to determine the manufacturing boundary reproducibly.

UNRESOLVED lines are excluded from core aggregates and retained in the mapping audit for later review.

### SPECIAL_CASE

Use SPECIAL_CASE for codes affected by edition changes, national subdivisions, residual/n.e.c. descriptions, returned/repaired goods, waste/scrap, or other classifications requiring explicit treatment. Each special case requires a recorded rule.

## 6. HS edition and historical consistency

The mapping is versioned by HS edition. Historical observations must use the HS nomenclature applicable to the observation vintage rather than silently applying the current 8-digit directory to earlier years.

Where a later HS edition changes, drops, reallocates or splits codes, the project will preserve the historical code and map it using the corresponding edition-specific concordance. Cross-edition aggregation requires an explicit correlation table or documented bridge.

No code-level splice is permitted solely because descriptions appear similar.

## 7. HS 8-digit versus HS 6-digit treatment

HS 6-digit correspondence is the international anchor because the Indian ITC (HS) classification is aligned internationally at 6 digits.

The Indian 8-digit level is retained because Indian trade data are disseminated at that level and national subdivisions can contain additional detail.

A 6-digit manufacturing classification may be inherited by its 8-digit children only when all relevant 8-digit children remain substantively within the same mapped product concept. If an 8-digit national subdivision creates a materially different or mixed product boundary, it must be classified separately.

## 8. Re-exports and re-imports

Department of Commerce TradeStat states that India's imports/exports include re-imports and re-exports.

The core indicators therefore measure recorded merchandise trade in manufacturing products, including re-exports/re-imports unless the underlying dataset provides a reproducible exclusion field.

The project must not describe these totals as domestic-manufacturing-origin exports.

A future domestic-origin manufacturing-export indicator requires a separate source/methodology capable of identifying domestic production origin and must not be derived by assumption from aggregate trade values.

## 9. Imports and import dependence

Mapped manufacturing-product imports are an approved descriptive trade measure.

A manufacturing import-dependence ratio requires a compatible product universe, valuation basis and period. Manufacturing imports divided by manufacturing GVA is not treated as a valid import-dependence ratio because imports are gross product values while GVA is value added.

The project therefore registers `IND-MFG-TRADE-IMPORT-DEPENDENCE-001` as PROVISIONAL so the intended construct is fixed before data acquisition, but no observations or score contribution are permitted until a compatible domestic product-output denominator is established and validated.

## 10. Export and import indicator concepts

The initial trade indicator family will distinguish:

- Manufacturing-product merchandise exports: value of in-scope HS merchandise exports.
- Manufacturing-product merchandise imports: value of in-scope HS merchandise imports.
- Manufacturing-product trade balance: exports minus imports for the same mapped product universe.
- Manufacturing-product export share: mapped manufacturing-product exports divided by total merchandise exports, subject to the same trade vintage and valuation basis.

These are product-based trade indicators. They do not measure manufacturing-sector GVA, manufacturing-firm exports, or domestic-origin manufacturing exports without additional evidence.

## 11. Validation and audit controls

Before trade observations are registered:

1. Confirm the HS edition and source vintage.
2. Preserve the official HS code directory/source reference.
3. Apply the versioned mapping table.
4. Validate code uniqueness and parent-child relationships.
5. Check that every included code has an inclusion rationale.
6. Check that every excluded/mixed/unresolved code has a documented reason.
7. Reconcile mapped totals against the source's all-commodity total plus documented exclusions.
8. Inspect high-value unmapped and mixed lines for materiality.
9. Preserve the mapping version in every derived observation.
10. Do not infer missing mappings from trade values.

## 12. Evidence status

This methodology establishes the classification boundary and mapping procedure. It does not constitute trade observations and does not establish any outcome, attribution, policy effectiveness or score.

## 13. Primary references

- MoSPI NIC 2008 Code Finder and NIC classification material.
- MoSPI Annual Survey of Industries metadata and manuals for NIC 2008 and NPCMS use.
- Department of Commerce/DGFT ITC (HS) documentation.
- Department of Commerce TradeStat metadata for 8-digit trade dissemination and re-export/re-import treatment.
- UNSD CPC/HS and CPC/ISIC correspondence tables and methodology.

## 14. Change control

Any change to the economic boundary, classification stack, mixed-category rule, re-export treatment or indicator concepts requires a new methodology version and an impact assessment before observations are recalculated.
