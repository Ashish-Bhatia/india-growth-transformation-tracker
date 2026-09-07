# Manufacturing Baseline Research Specification

Status: Draft research specification
Sector: Manufacturing (`MFG`)
Date: 2026-09-07

## 1. Purpose

Establish the descriptive baseline required before substantive policy attribution, counterfactual analysis, policy evaluation or scoring for Manufacturing.

The specification follows the governing research sequence:

Evidence → Data validation → Descriptive analysis → Attribution → Counterfactual analysis → Evaluation → Scoring.

The baseline describes India's starting position and subsequent observed change. It does not assign government contribution.

## 2. Analytical baseline

Primary immediate pre-policy benchmark:
- 2013-14 or the closest comparable pre-May-2014 observation.

Long-run context:
- 2004-05 onward where reliable comparable data exists.
- 2009-10 onward where structural context is useful.

Term views:
- Modi I: explicit term window under the approved methodology.
- Modi II: explicit term window under the approved methodology, with separate treatment of COVID.
- Modi III: June 2024-present, with outcome maturity classified appropriately.
- Overall: 2014-present.

Exact term-boundary treatment remains an open methodological dependency and must not be silently resolved here.

## 3. Required baseline dimensions

The combined governing frameworks require examination of:

- scale/output
- growth
- productivity
- investment
- employment
- wages where available
- exports
- imports
- market size
- capacity
- fiscal support
- infrastructure
- financial access
- competitiveness
- quality
- inclusion
- international position
- relevant social outcomes
- resilience where material.

## 4. Current registered indicator coverage

| Baseline dimension | Registered indicator | Current state | Baseline suitability |
|---|---|---|---|
| Manufacturing growth | `IND-MFG-GVA-GROWTH-001` | Active, annual, India, current NAS 2022-23-base series | Preferred growth measure, subject to current-series back-series availability and methodology controls |
| Manufacturing share of GVA | `IND-MFG-GVA-SHARE-001` | Active, annual, India, current NAS series | Useful structural scale/share measure, subject to current-series availability |
| Industrial output | `IND-MFG-IIP-001` | Active, monthly, India, 2022-23=100 | Useful current output trend, but not a 2013-14 baseline because the current registered series begins with the 2022-23-base methodology boundary |
| Registered manufacturing GVA | `IND-MFG-ASI-GVA-001` | Active, annual, India/State, ASI coverage | Potential scale and State diagnostic, but ASI covers registered organised manufacturing and is not total manufacturing GVA. Historical observations are not yet established in the current canonical layer |
| Registered manufacturing employment | `IND-MFG-ASI-EMP-001` | Active, annual, India/State, ASI coverage | Potential factory-employment diagnostic, but not total manufacturing employment. Historical observations are not yet established in the current canonical layer |
| Manufacturing worker share | `IND-MFG-PLFS-SHARE-001` | Active, annual, India/State, PLFS | Employment structural measure. Registered baseline is 2017-18, not 2013-14. PLFS 2025 has a sampling-methodology and survey-cycle break requiring separate treatment |
| International manufacturing value added | `IND-MFG-UNIDO-MVA-001` | Active, country, UNIDO INDSTAT Rev. 4 | Potential international position measure. Registered baseline is 2013 where country coverage permits; peer-basket methodology remains unresolved and observations are not yet established in the current canonical layer |

## 5. Baseline gaps requiring research before acquisition

The current registry does not yet provide registered Manufacturing indicators for the following required dimensions:

- productivity
- private investment
- public investment relevant to Manufacturing
- FDI relevant to Manufacturing
- exports
- imports/import dependence
- manufacturing market size where distinct from GVA
- capacity utilisation
- manufacturing infrastructure/cost conditions
- financial access relevant to manufacturing firms
- competitiveness measures beyond registered international MVA
- quality/product standards where material
- technology/innovation where material
- MSME manufacturing conditions
- wages/earnings relevant to manufacturing employment
- inclusion/distributional outcomes
- resilience/shock recovery where material
- fiscal support and manufacturing-relevant public expenditure

These are research gaps, not approved new indicators. No indicator should be added until it passes the registry workflow.

## 6. Existing indicator limitations

1. The current IIP indicator is a 2022-23-base series. It must not be silently spliced with the superseded 2011-12-base series.
2. NAS indicators use the current 2022-23-base series and must preserve the methodology boundary from the superseded series.
3. ASI indicators describe registered organised manufacturing and must not be presented as total manufacturing measures.
4. PLFS 2025 is not seamlessly comparable with earlier PLFS methodology because of the sampling and survey-cycle changes.
5. The UNIDO indicator is intended for international comparison. The approved dynamic peer-basket methodology remains unresolved.
6. Missing observations must remain missing. No zero-filling or unsupported imputation is permitted for critical baseline values.

## 7. Descriptive calculations

For eligible comparable series, the baseline analysis should calculate:

- level
- annual growth
- CAGR
- trend
- volatility
- structural breaks
- percentage-point changes for shares/rates where appropriate.

Calculations must preserve source-defined fiscal/calendar periods, units, price basis, revisions and methodology versions.

## 8. Comparability rules

Before combining observations across periods, verify:

- definition
- numerator and denominator where applicable
- unit
- geography
- frequency
- reference period
- price basis
- methodology
- classification
- revision status
- vintage.

Where a methodology break prevents valid comparison, preserve separate series and describe the limitation. Do not manufacture a bridge.

## 9. Baseline research package

The baseline package should ultimately contain:

1. Sector definition and scope.
2. Baseline indicator map.
3. Historical observations and vintages.
4. Data-quality assessments.
5. Methodology and comparability notes.
6. Descriptive calculations.
7. Structural-break review.
8. State-level baseline where reliable registered indicators exist.
9. International baseline after peer methodology is approved.
10. Data gaps and unavailable dimensions.
11. Contradictory evidence section.
12. Reproducible source-to-result lineage.

## 10. Research gate

The baseline is not complete until every required dimension is either:

- supported by an approved registered indicator and validated observations, or
- explicitly marked unavailable, incompatible, or deferred with a documented reason.

No policy-effectiveness, attribution, counterfactual or score conclusion should be derived from an incomplete baseline.

## 11. Next controlled research step

Conduct an indicator-gap review against the registered baseline dimensions and identify candidate authoritative datasets for the unresolved dimensions. Do not create new indicators or acquire data until each candidate passes definition, source, methodology, coverage, historical-availability and provenance review.
