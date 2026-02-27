# Canonical Metric Row (BigQuery)

Every metric query must output:

- metric_id STRING (required)
- metric_time TIMESTAMP (required)  -- time_basis in registry
- territory STRING (required)
- segment STRING (nullable)
- metric_value NUMERIC (required)

Rules:
- metric_id must match KPI registry `id`
- metric_time must be derived from the metric's time_basis field
- territory uses registry dimension mapping (territory.yaml)
- segment uses registry dimension mapping (segment.yaml)
- metric_value must be NUMERIC (cast if needed)
