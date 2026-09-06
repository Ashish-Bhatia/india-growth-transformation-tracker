# India Growth & Transformation Tracker

Authoritative open-source implementation layer for the India Growth & Transformation Tracker.

Project status: Operational provenance and ingestion conventions implemented
Methodology: Version 1.0
Data cutoff: Not yet established

The tracker measures India's transformation first, evaluates government policy second, and assigns attribution only to the extent supported by evidence.

## Architecture

Official Sources → Ingestion → Raw Data → Validation → Canonical Database → Derived Metrics → Research/Evidence → Attribution → Scoring → API → Interactive Website

GitHub provides version control and reproducibility. The research database remains the structured analytical layer. The website is a presentation layer.

## Research periods

- Pre-2014 baseline
- Modi I, 2014-2019
- Modi II, 2019-2024
- Modi III, 2024-present
- Overall, 2014-present

Exact dates and native fiscal/calendar periods are preserved in the underlying data model.

## Status

Database foundation and registry layer are execution-validated. Source Registry and Master Indicator Registry structures exist as machine-readable contracts but remain intentionally unseeded pending authoritative record-level source discovery. Operational provenance and ingestion conventions are now defined and tested. No substantive sector research is represented yet.
