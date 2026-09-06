BEGIN;

CREATE SCHEMA IF NOT EXISTS tracker;

CREATE TABLE tracker.taxonomy_versions (
    taxonomy_version_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    version_code VARCHAR(32) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    effective_date DATE NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('draft','active','superseded','archived')),
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tracker.governments (
    government_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(64) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    leader TEXT,
    start_date DATE NOT NULL,
    end_date DATE,
    status TEXT NOT NULL CHECK (status IN ('active','historical','planned')),
    CONSTRAINT governments_valid_dates CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.government_terms (
    government_term_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    term_code VARCHAR(64) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    government_id BIGINT REFERENCES tracker.governments(government_id),
    start_date DATE NOT NULL,
    end_date DATE,
    status TEXT NOT NULL CHECK (status IN ('active','historical','open')),
    display_order INTEGER NOT NULL UNIQUE,
    CONSTRAINT government_terms_valid_dates CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.institutions (
    institution_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(96) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    institution_type TEXT NOT NULL CHECK (institution_type IN ('ministry','department','agency','regulator','other')),
    parent_institution_id BIGINT REFERENCES tracker.institutions(institution_id),
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned')),
    CONSTRAINT institutions_valid_dates CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.countries (
    country_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(3) NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE,
    region TEXT,
    income_group TEXT,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned')),
    CONSTRAINT countries_valid_dates CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.states (
    state_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(32) NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE,
    state_type TEXT NOT NULL CHECK (state_type IN ('state','union_territory')),
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned')),
    CONSTRAINT states_valid_dates CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.districts (
    district_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    state_id BIGINT NOT NULL REFERENCES tracker.states(state_id),
    code VARCHAR(64) NOT NULL,
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned')),
    UNIQUE (state_id, code),
    CONSTRAINT districts_valid_dates CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.geographies (
    geography_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    geography_code VARCHAR(96) NOT NULL UNIQUE,
    geography_type TEXT NOT NULL CHECK (geography_type IN ('country','india','state','union_territory','district','sub_district')),
    country_id BIGINT REFERENCES tracker.countries(country_id),
    state_id BIGINT REFERENCES tracker.states(state_id),
    district_id BIGINT REFERENCES tracker.districts(district_id),
    parent_geography_id BIGINT REFERENCES tracker.geographies(geography_id),
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned')),
    CONSTRAINT geographies_valid_dates CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.sectors (
    sector_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(96) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT,
    taxonomy_version_id BIGINT NOT NULL REFERENCES tracker.taxonomy_versions(taxonomy_version_id),
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned','superseded')),
    UNIQUE (taxonomy_version_id, name)
);

CREATE TABLE tracker.sub_sectors (
    sub_sector_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sector_id BIGINT NOT NULL REFERENCES tracker.sectors(sector_id),
    code VARCHAR(128) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT,
    taxonomy_version_id BIGINT NOT NULL REFERENCES tracker.taxonomy_versions(taxonomy_version_id),
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned','superseded')),
    UNIQUE (sector_id, name, taxonomy_version_id)
);

CREATE TABLE tracker.domains (
    domain_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sub_sector_id BIGINT NOT NULL REFERENCES tracker.sub_sectors(sub_sector_id),
    code VARCHAR(160) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT,
    taxonomy_version_id BIGINT NOT NULL REFERENCES tracker.taxonomy_versions(taxonomy_version_id),
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','historical','planned','superseded')),
    UNIQUE (sub_sector_id, name, taxonomy_version_id)
);

CREATE TABLE tracker.peer_baskets (
    peer_basket_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(96) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    methodology_version TEXT NOT NULL,
    effective_date DATE NOT NULL,
    rationale TEXT,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('draft','active','superseded','archived'))
);

CREATE TABLE tracker.peer_memberships (
    peer_basket_id BIGINT NOT NULL REFERENCES tracker.peer_baskets(peer_basket_id),
    country_id BIGINT NOT NULL REFERENCES tracker.countries(country_id),
    inclusion_score NUMERIC,
    inclusion_reason TEXT,
    effective_date DATE NOT NULL,
    end_date DATE,
    PRIMARY KEY (peer_basket_id, country_id, effective_date),
    CHECK (end_date IS NULL OR end_date >= effective_date)
);

CREATE TABLE tracker.policies (
    policy_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    canonical_name TEXT NOT NULL,
    policy_type TEXT NOT NULL,
    government_term_id BIGINT REFERENCES tracker.government_terms(government_term_id),
    primary_institution_id BIGINT REFERENCES tracker.institutions(institution_id),
    primary_sector_id BIGINT REFERENCES tracker.sectors(sector_id),
    announcement_date DATE,
    legislation_date DATE,
    implementation_date DATE,
    status TEXT NOT NULL CHECK (status IN ('proposed','announced','legislated','notified','funded','launched','implementing','operational','target_achieved','target_missed','revised','expanded','suspended','discontinued','replaced','completed','too_early')),
    materiality_code CHAR(2) CHECK (materiality_code IN ('P1','P2','P3','P4','P5')),
    stated_objective TEXT,
    measured_objective TEXT,
    CONSTRAINT policies_date_order CHECK (
        (legislation_date IS NULL OR announcement_date IS NULL OR legislation_date >= announcement_date)
        AND (implementation_date IS NULL OR announcement_date IS NULL OR implementation_date >= announcement_date)
    )
);

CREATE TABLE tracker.policy_versions (
    policy_version_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    version_number INTEGER NOT NULL,
    effective_date DATE NOT NULL,
    change_description TEXT,
    objective_change TEXT,
    design_change TEXT,
    funding_change TEXT,
    scope_change TEXT,
    source_id BIGINT,
    UNIQUE (policy_id, version_number)
);

CREATE TABLE tracker.policy_sector_links (
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    sector_id BIGINT NOT NULL REFERENCES tracker.sectors(sector_id),
    relevance TEXT,
    primary_flag BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (policy_id, sector_id)
);

CREATE TABLE tracker.policy_institution_links (
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    institution_id BIGINT NOT NULL REFERENCES tracker.institutions(institution_id),
    role TEXT,
    primary_flag BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (policy_id, institution_id)
);

CREATE TABLE tracker.policy_geography_links (
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    geography_id BIGINT NOT NULL REFERENCES tracker.geographies(geography_id),
    role TEXT,
    coverage TEXT,
    PRIMARY KEY (policy_id, geography_id)
);

CREATE TABLE tracker.policy_relationships (
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    related_policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    relationship_type TEXT NOT NULL CHECK (relationship_type IN ('predecessor','successor','continuation','redesign','replacement','merged','split')),
    PRIMARY KEY (policy_id, related_policy_id, relationship_type),
    CHECK (policy_id <> related_policy_id)
);

CREATE TABLE tracker.programmes (
    programme_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL,
    objective TEXT,
    CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.schemes (
    scheme_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    programme_id BIGINT REFERENCES tracker.programmes(programme_id),
    policy_id BIGINT REFERENCES tracker.policies(policy_id),
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL,
    objective TEXT,
    CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date),
    CHECK (programme_id IS NOT NULL OR policy_id IS NOT NULL)
);

CREATE TABLE tracker.interventions (
    intervention_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    programme_id BIGINT REFERENCES tracker.programmes(programme_id),
    scheme_id BIGINT REFERENCES tracker.schemes(scheme_id),
    name TEXT NOT NULL,
    mechanism TEXT,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL,
    CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.policy_lifecycle_events (
    event_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    event_date DATE NOT NULL,
    event_type TEXT NOT NULL CHECK (event_type IN ('announcement','legislation','notification','launch','funding','implementation','expansion','modification','review','extension','termination')),
    description TEXT,
    source_id BIGINT
);

CREATE TABLE tracker.budget_allocations (
    budget_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    policy_id BIGINT NOT NULL REFERENCES tracker.policies(policy_id),
    fiscal_year VARCHAR(16) NOT NULL,
    estimate NUMERIC,
    revised_estimate NUMERIC,
    actual NUMERIC,
    unit TEXT NOT NULL,
    source_id BIGINT
);

CREATE TABLE tracker.sources (
    source_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    organisation TEXT NOT NULL,
    title TEXT NOT NULL,
    source_type TEXT NOT NULL,
    source_tier SMALLINT NOT NULL CHECK (source_tier BETWEEN 1 AND 7),
    url TEXT,
    publication_date DATE,
    access_date DATE,
    reliability TEXT,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','unavailable','superseded','archived')),
    dataset_document_reference TEXT,
    language TEXT,
    geographic_scope TEXT,
    sector_id BIGINT REFERENCES tracker.sectors(sector_id),
    accessibility TEXT,
    archival_location TEXT,
    checksum_sha256 CHAR(64)
);

ALTER TABLE tracker.policy_versions ADD CONSTRAINT policy_versions_source_fk FOREIGN KEY (source_id) REFERENCES tracker.sources(source_id);
ALTER TABLE tracker.policy_lifecycle_events ADD CONSTRAINT policy_events_source_fk FOREIGN KEY (source_id) REFERENCES tracker.sources(source_id);
ALTER TABLE tracker.budget_allocations ADD CONSTRAINT budget_source_fk FOREIGN KEY (source_id) REFERENCES tracker.sources(source_id);

CREATE TABLE tracker.datasets (
    dataset_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    source_id BIGINT NOT NULL REFERENCES tracker.sources(source_id),
    name TEXT NOT NULL,
    description TEXT,
    publisher TEXT,
    coverage TEXT,
    frequency TEXT,
    units TEXT,
    definitions TEXT,
    dimensions JSONB,
    methodology TEXT,
    revision_policy TEXT,
    access_location TEXT,
    licence TEXT,
    update_schedule TEXT,
    current_version TEXT,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','superseded','retired','pending')),
    latest_observation_date DATE,
    ingestion_status TEXT,
    validation_status TEXT
);

CREATE TABLE tracker.source_snapshots (
    snapshot_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    source_id BIGINT NOT NULL REFERENCES tracker.sources(source_id),
    retrieval_date TIMESTAMPTZ NOT NULL,
    file_reference TEXT,
    content_type TEXT,
    hash_sha256 CHAR(64),
    archived_flag BOOLEAN NOT NULL DEFAULT FALSE,
    source_version TEXT,
    query_parameters JSONB
);

CREATE TABLE tracker.source_locators (
    locator_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    source_id BIGINT NOT NULL REFERENCES tracker.sources(source_id),
    page TEXT,
    section TEXT,
    table_ref TEXT,
    figure_ref TEXT,
    paragraph TEXT,
    url_fragment TEXT,
    locator_text TEXT
);

CREATE TABLE tracker.indicators (
    indicator_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(160) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    definition TEXT NOT NULL,
    unit TEXT NOT NULL,
    frequency TEXT NOT NULL,
    direction TEXT,
    indicator_type TEXT NOT NULL,
    measurement_type TEXT,
    sector_id BIGINT REFERENCES tracker.sectors(sector_id),
    sub_sector_id BIGINT REFERENCES tracker.sub_sectors(sub_sector_id),
    domain_id BIGINT REFERENCES tracker.domains(domain_id),
    geography_scope TEXT,
    baseline TEXT,
    benchmark TEXT,
    target TEXT,
    calculation_method TEXT,
    status TEXT NOT NULL CHECK (status IN ('draft','active','retired','superseded','experimental')),
    methodology_version TEXT,
    update_frequency_class TEXT CHECK (update_frequency_class IN ('U1','U2','U3','U4','U5','U6')),
    health_status TEXT CHECK (health_status IN ('Healthy','Watch','Stale','Data conflict','Methodology change','Missing','Retired'))
);

CREATE TABLE tracker.indicator_versions (
    indicator_version_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    indicator_id BIGINT NOT NULL REFERENCES tracker.indicators(indicator_id),
    version VARCHAR(64) NOT NULL,
    definition TEXT NOT NULL,
    numerator TEXT,
    denominator TEXT,
    methodology TEXT,
    base_year TEXT,
    effective_date DATE NOT NULL,
    source_id BIGINT REFERENCES tracker.sources(source_id),
    comparability_status TEXT,
    UNIQUE (indicator_id, version)
);

CREATE TABLE tracker.indicator_classes (
    indicator_id BIGINT NOT NULL REFERENCES tracker.indicators(indicator_id),
    class_code TEXT NOT NULL CHECK (class_code IN ('Context','Input','Fiscal','Implementation','Output','Outcome','Impact','Structural','Distributional','Efficiency','Productivity','Resilience','Sustainability','Competitiveness','Transformation','External-condition','Leading','Lagging')),
    PRIMARY KEY (indicator_id, class_code)
);

CREATE TABLE tracker.indicator_hierarchy (
    indicator_id BIGINT NOT NULL REFERENCES tracker.indicators(indicator_id),
    hierarchy_code TEXT NOT NULL CHECK (hierarchy_code IN ('primary','secondary','diagnostic','contextual')),
    PRIMARY KEY (indicator_id, hierarchy_code)
);

CREATE TABLE tracker.indicator_geographies (
    indicator_id BIGINT NOT NULL REFERENCES tracker.indicators(indicator_id),
    geography_id BIGINT NOT NULL REFERENCES tracker.geographies(geography_id),
    availability_start DATE,
    availability_end DATE,
    PRIMARY KEY (indicator_id, geography_id),
    CHECK (availability_end IS NULL OR availability_start IS NULL OR availability_end >= availability_start)
);

CREATE TABLE tracker.indicator_sources (
    indicator_id BIGINT NOT NULL REFERENCES tracker.indicators(indicator_id),
    dataset_id BIGINT NOT NULL REFERENCES tracker.datasets(dataset_id),
    priority INTEGER NOT NULL,
    relationship TEXT,
    effective_date DATE NOT NULL,
    end_date DATE,
    PRIMARY KEY (indicator_id, dataset_id, effective_date),
    CHECK (end_date IS NULL OR end_date >= effective_date)
);

CREATE TABLE tracker.observation_vintages (
    vintage_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dataset_id BIGINT NOT NULL REFERENCES tracker.datasets(dataset_id),
    release_date DATE,
    retrieval_date TIMESTAMPTZ NOT NULL,
    version TEXT,
    file_hash CHAR(64),
    supersedes_vintage_id BIGINT REFERENCES tracker.observation_vintages(vintage_id),
    revision_status TEXT NOT NULL DEFAULT 'current' CHECK (revision_status IN ('current','superseded','archived'))
);

CREATE TABLE tracker.observations (
    observation_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    indicator_id BIGINT NOT NULL REFERENCES tracker.indicators(indicator_id),
    measurement_date DATE NOT NULL,
    period_label TEXT NOT NULL,
    period_start DATE,
    period_end DATE,
    geography_id BIGINT REFERENCES tracker.geographies(geography_id),
    value NUMERIC,
    unit TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('raw','extracted','validated','reconciled','verified','estimated','proxy','revised','superseded','disputed','unavailable','observed','provisional','forecast','missing')),
    dataset_id BIGINT NOT NULL REFERENCES tracker.datasets(dataset_id),
    vintage_id BIGINT REFERENCES tracker.observation_vintages(vintage_id),
    observation_version INTEGER NOT NULL DEFAULT 1,
    quality_grade CHAR(1) CHECK (quality_grade IN ('A','B','C','D')),
    event_date DATE,
    announcement_date DATE,
    implementation_date DATE,
    publication_date DATE,
    verification_date DATE,
    last_update_date DATE,
    previous_observation_id BIGINT REFERENCES tracker.observations(observation_id),
    revision_reason TEXT,
    CHECK (period_end IS NULL OR period_start IS NULL OR period_end >= period_start),
    CHECK (status <> 'verified' OR value IS NOT NULL)
);

CREATE TABLE tracker.data_revisions (
    revision_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    observation_id BIGINT NOT NULL REFERENCES tracker.observations(observation_id),
    previous_value NUMERIC,
    new_value NUMERIC,
    revision_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    source_id BIGINT REFERENCES tracker.sources(source_id),
    reason TEXT NOT NULL,
    affected_analysis TEXT
);

CREATE TABLE tracker.calculations (
    calculation_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    formula TEXT NOT NULL,
    inputs JSONB NOT NULL,
    output TEXT NOT NULL,
    unit TEXT,
    methodology_version TEXT NOT NULL,
    code_version TEXT,
    effective_date DATE NOT NULL,
    status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','active','superseded','retired'))
);

CREATE TABLE tracker.outcomes (
    outcome_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(160) NOT NULL UNIQUE,
    policy_id BIGINT REFERENCES tracker.policies(policy_id),
    indicator_id BIGINT REFERENCES tracker.indicators(indicator_id),
    sector_id BIGINT REFERENCES tracker.sectors(sector_id),
    name TEXT NOT NULL,
    description TEXT,
    outcome_type TEXT,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'draft',
    CHECK (end_date IS NULL OR start_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.external_events (
    external_event_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    event_type TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    description TEXT,
    CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE tracker.external_event_sectors (
    external_event_id BIGINT NOT NULL REFERENCES tracker.external_events(external_event_id),
    sector_id BIGINT NOT NULL REFERENCES tracker.sectors(sector_id),
    relevance TEXT,
    PRIMARY KEY (external_event_id, sector_id)
);

CREATE TABLE tracker.external_event_indicators (
    external_event_id BIGINT NOT NULL REFERENCES tracker.external_events(external_event_id),
    indicator_id BIGINT NOT NULL REFERENCES tracker.indicators(indicator_id),
    relevance TEXT,
    PRIMARY KEY (external_event_id, indicator_id)
);

CREATE TABLE tracker.counterfactuals (
    counterfactual_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    outcome_id BIGINT REFERENCES tracker.outcomes(outcome_id),
    method_code TEXT NOT NULL CHECK (method_code IN ('CF1','CF2','CF3','CF4','CF5','CF6','CF7','CF8','CF9','CF10','CF11')),
    description TEXT,
    result TEXT,
    confidence TEXT CHECK (confidence IN ('High','Moderate','Low','Indeterminate')),
    methodology_version TEXT,
    status TEXT NOT NULL DEFAULT 'draft'
);

CREATE TABLE tracker.attribution_records (
    attribution_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    outcome_id BIGINT REFERENCES tracker.outcomes(outcome_id),
    policy_id BIGINT REFERENCES tracker.policies(policy_id),
    attribution_code TEXT NOT NULL CHECK (attribution_code IN ('A1','A2','A3','A4','A5','A6','A7','A8','A9','A10','A11','A12')),
    confidence TEXT NOT NULL CHECK (confidence IN ('High','Moderate','Low','Indeterminate')),
    attribution_grade CHAR(1) CHECK (attribution_grade IN ('A','B','C','D')),
    narrative TEXT,
    counterfactual_id BIGINT REFERENCES tracker.counterfactuals(counterfactual_id),
    methodology_version TEXT,
    status TEXT NOT NULL DEFAULT 'draft'
);

CREATE TABLE tracker.claims (
    claim_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    statement TEXT NOT NULL,
    claim_type TEXT,
    sector_id BIGINT REFERENCES tracker.sectors(sector_id),
    policy_id BIGINT REFERENCES tracker.policies(policy_id),
    indicator_id BIGINT REFERENCES tracker.indicators(indicator_id),
    status TEXT NOT NULL DEFAULT 'draft',
    confidence TEXT CHECK (confidence IN ('High','Moderate','Low','Indeterminate'))
);

CREATE TABLE tracker.evidence (
    evidence_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    claim_id BIGINT NOT NULL REFERENCES tracker.claims(claim_id),
    source_id BIGINT NOT NULL REFERENCES tracker.sources(source_id),
    locator_id BIGINT REFERENCES tracker.source_locators(locator_id),
    evidence_type TEXT,
    evidence_grade CHAR(1) NOT NULL CHECK (evidence_grade IN ('A','B','C','D')),
    directness TEXT,
    relevance TEXT,
    reliability TEXT,
    recency TEXT,
    methodological_quality TEXT,
    supports_claim BOOLEAN NOT NULL,
    contradiction_flag BOOLEAN NOT NULL DEFAULT FALSE,
    researcher_notes TEXT
);

CREATE TABLE tracker.research_findings (
    finding_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(160) NOT NULL UNIQUE,
    research_question TEXT,
    sector_id BIGINT REFERENCES tracker.sectors(sector_id),
    policy_id BIGINT REFERENCES tracker.policies(policy_id),
    period_label TEXT,
    baseline TEXT,
    interpretation TEXT,
    alternative_explanations TEXT,
    counterfactual_id BIGINT REFERENCES tracker.counterfactuals(counterfactual_id),
    attribution_id BIGINT REFERENCES tracker.attribution_records(attribution_id),
    confidence TEXT CHECK (confidence IN ('High','Moderate','Low','Indeterminate')),
    conclusion TEXT,
    limitations TEXT,
    open_questions TEXT,
    verification_date DATE,
    status TEXT NOT NULL CHECK (status IN ('draft','research','review','approved','published','superseded','archived'))
);

CREATE TABLE tracker.finding_evidence (
    finding_id BIGINT NOT NULL REFERENCES tracker.research_findings(finding_id),
    evidence_id BIGINT NOT NULL REFERENCES tracker.evidence(evidence_id),
    PRIMARY KEY (finding_id, evidence_id)
);

CREATE TABLE tracker.finding_observations (
    finding_id BIGINT NOT NULL REFERENCES tracker.research_findings(finding_id),
    observation_id BIGINT NOT NULL REFERENCES tracker.observations(observation_id),
    PRIMARY KEY (finding_id, observation_id)
);

CREATE TABLE tracker.score_methodologies (
    score_methodology_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(128) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    version TEXT NOT NULL,
    normalization_method TEXT,
    missing_data_treatment TEXT,
    description TEXT,
    status TEXT NOT NULL CHECK (status IN ('draft','active','superseded','retired'))
);

CREATE TABLE tracker.score_dimensions (
    score_dimension_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    score_methodology_id BIGINT NOT NULL REFERENCES tracker.score_methodologies(score_methodology_id),
    code VARCHAR(128) NOT NULL,
    name TEXT NOT NULL,
    weight NUMERIC,
    UNIQUE (score_methodology_id, code)
);

CREATE TABLE tracker.score_weights (
    score_weight_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    score_methodology_id BIGINT NOT NULL REFERENCES tracker.score_methodologies(score_methodology_id),
    object_type TEXT NOT NULL,
    object_code TEXT NOT NULL,
    weight NUMERIC,
    effective_date DATE NOT NULL,
    status TEXT NOT NULL DEFAULT 'draft',
    CHECK (weight IS NULL OR weight >= 0)
);

CREATE TABLE tracker.scores (
    score_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(160) NOT NULL UNIQUE,
    score_methodology_id BIGINT NOT NULL REFERENCES tracker.score_methodologies(score_methodology_id),
    object_type TEXT NOT NULL,
    object_id BIGINT,
    period_label TEXT NOT NULL,
    raw_value NUMERIC,
    normalized_value NUMERIC,
    weight NUMERIC,
    contribution NUMERIC,
    final_score NUMERIC,
    confidence TEXT CHECK (confidence IN ('High','Moderate','Low','Indeterminate')),
    status TEXT NOT NULL DEFAULT 'draft'
);

CREATE TABLE tracker.research_versions (
    research_version_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    version TEXT NOT NULL UNIQUE,
    release_date DATE NOT NULL,
    methodology_version TEXT NOT NULL,
    data_cutoff DATE NOT NULL,
    description TEXT
);

CREATE TABLE tracker.methodology_versions (
    methodology_version_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    version TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    effective_date DATE NOT NULL,
    change_description TEXT
);

CREATE TABLE tracker.research_runs (
    research_run_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    run_type TEXT NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ,
    status TEXT NOT NULL,
    code_version TEXT,
    methodology_version TEXT,
    records_processed INTEGER NOT NULL DEFAULT 0,
    errors JSONB,
    CHECK (end_time IS NULL OR end_time >= start_time)
);

CREATE TABLE tracker.data_releases (
    release_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    release_version TEXT NOT NULL UNIQUE,
    release_date DATE NOT NULL,
    data_cutoff DATE NOT NULL,
    description TEXT,
    methodology_version TEXT NOT NULL
);

CREATE TABLE tracker.audit_events (
    audit_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    entity_type TEXT NOT NULL,
    entity_id BIGINT NOT NULL,
    action TEXT NOT NULL,
    old_value JSONB,
    new_value JSONB,
    actor TEXT NOT NULL,
    event_timestamp TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reason TEXT
);

CREATE TABLE tracker.reviews (
    review_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    entity_type TEXT NOT NULL,
    entity_id BIGINT NOT NULL,
    reviewer TEXT NOT NULL,
    review_type TEXT NOT NULL CHECK (review_type IN ('data','evidence','methodology','attribution','publication')),
    decision TEXT NOT NULL,
    comments TEXT,
    review_date DATE NOT NULL
);

CREATE TABLE tracker.publications (
    publication_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    entity_type TEXT NOT NULL,
    entity_id BIGINT NOT NULL,
    publication_status TEXT NOT NULL CHECK (publication_status IN ('Draft','Internal Review','Verified','Published','Corrected','Superseded')),
    published_at TIMESTAMPTZ,
    publication_version TEXT
);

CREATE TABLE tracker.dashboard_metrics (
    dashboard_metric_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dashboard TEXT NOT NULL,
    indicator_id BIGINT REFERENCES tracker.indicators(indicator_id),
    score_id BIGINT REFERENCES tracker.scores(score_id),
    display_rule TEXT,
    refresh_rule TEXT,
    CHECK (indicator_id IS NOT NULL OR score_id IS NOT NULL)
);

CREATE INDEX idx_sub_sectors_sector ON tracker.sub_sectors(sector_id);
CREATE INDEX idx_domains_sub_sector ON tracker.domains(sub_sector_id);
CREATE INDEX idx_geographies_parent ON tracker.geographies(parent_geography_id);
CREATE INDEX idx_policies_term ON tracker.policies(government_term_id);
CREATE INDEX idx_policies_sector ON tracker.policies(primary_sector_id);
CREATE INDEX idx_policy_versions_policy_date ON tracker.policy_versions(policy_id, effective_date);
CREATE INDEX idx_policy_events_policy_date ON tracker.policy_lifecycle_events(policy_id, event_date);
CREATE INDEX idx_sources_tier ON tracker.sources(source_tier);
CREATE INDEX idx_datasets_source ON tracker.datasets(source_id);
CREATE INDEX idx_snapshots_source_date ON tracker.source_snapshots(source_id, retrieval_date);
CREATE INDEX idx_indicators_sector ON tracker.indicators(sector_id);
CREATE INDEX idx_indicator_versions_indicator_date ON tracker.indicator_versions(indicator_id, effective_date);
CREATE INDEX idx_indicator_sources_dataset ON tracker.indicator_sources(dataset_id);
CREATE INDEX idx_vintages_dataset_release ON tracker.observation_vintages(dataset_id, release_date);
CREATE INDEX idx_observations_indicator_period ON tracker.observations(indicator_id, measurement_date);
CREATE INDEX idx_observations_geo_period ON tracker.observations(geography_id, measurement_date);
CREATE INDEX idx_observations_vintage ON tracker.observations(vintage_id);
CREATE INDEX idx_revisions_observation ON tracker.data_revisions(observation_id, revision_date);
CREATE INDEX idx_outcomes_indicator ON tracker.outcomes(indicator_id);
CREATE INDEX idx_external_events_dates ON tracker.external_events(start_date, end_date);
CREATE INDEX idx_claims_policy_indicator ON tracker.claims(policy_id, indicator_id);
CREATE INDEX idx_evidence_claim ON tracker.evidence(claim_id);
CREATE INDEX idx_evidence_source ON tracker.evidence(source_id);
CREATE INDEX idx_findings_sector_policy ON tracker.research_findings(sector_id, policy_id);
CREATE INDEX idx_scores_methodology_object ON tracker.scores(score_methodology_id, object_type, object_id);
CREATE INDEX idx_audit_entity ON tracker.audit_events(entity_type, entity_id, event_timestamp);

CREATE VIEW tracker.v_verified_observations AS
SELECT o.*
FROM tracker.observations o
WHERE o.status = 'verified';

CREATE VIEW tracker.v_public_provenance AS
SELECT
    o.observation_id,
    o.indicator_id,
    i.code AS indicator_code,
    o.measurement_date,
    o.period_label,
    o.geography_id,
    o.value,
    o.unit,
    o.vintage_id,
    v.version AS vintage_version,
    v.release_date AS vintage_release_date,
    d.dataset_id,
    d.code AS dataset_code,
    s.source_id,
    s.code AS source_code,
    s.organisation,
    s.title AS source_title,
    s.url,
    s.source_tier
FROM tracker.observations o
JOIN tracker.indicators i ON i.indicator_id = o.indicator_id
JOIN tracker.datasets d ON d.dataset_id = o.dataset_id
JOIN tracker.sources s ON s.source_id = d.source_id
LEFT JOIN tracker.observation_vintages v ON v.vintage_id = o.vintage_id
WHERE o.status = 'verified';

COMMIT;
