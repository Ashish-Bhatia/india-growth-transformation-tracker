# Machine-readable registries

This directory contains the version-controlled machine-readable registry layer.

## Source Registry

`source-registry.json` is the canonical machine-readable contract for source metadata. It separates source authority/tier from evidence grade and is designed to link sources to datasets, snapshots, provenance, licensing/access information and reliability metadata.

The registry is intentionally empty at this milestone. The Project Sources define the required Source Registry fields and source hierarchy, but do not provide a complete authoritative machine-readable catalogue of tracker data sources. Records must be added only after authoritative source discovery and registration.

## Master Indicator Registry

`indicator-registry.json` is the canonical machine-readable catalogue for tracker indicators. It reserves stable Indicator IDs and captures definitions, units, frequency, directionality, measurement type, taxonomy mapping, geography, baseline/benchmark/target metadata, calculation method, methodology version, update class, health status, source mappings and version history.

The registry is intentionally empty at this milestone. The Master Indicator Registry defines indicator families and metadata requirements, but it does not provide a complete authoritative record-level registry with source mappings and definitions for individual indicators. No fabricated indicator records are permitted.

## Authority

The registry structures implement the requirements in the Source & Data Acquisition Architecture, Master Indicator Registry, Indicator Framework, Master Database Schema and GitHub Repository Specification.
