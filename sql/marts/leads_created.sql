-- AUTO-GENERATED: do not edit directly
-- metric_id: leads_created
-- name: Leads Created
-- owner: marketing
-- category: leads
-- time_basis: lead_created_at
-- grain_level: lead
-- source: ServiceTitan.Lead

-- TODO:
-- 1) Map source fields -> canonical fields
-- 2) Apply filters (include/exclude)
-- 3) Add territory/segment joins
-- 4) Implement attribution rule + exceptions if needed

select
  'leads_created' as metric_id,
  /* lead_created_at */ CAST(NULL AS TIMESTAMP) as metric_time,
  /* territory */ CAST(NULL AS STRING) as territory,
  /* segment */ CAST(NULL AS STRING) as segment,
  /* TODO: define expression */ as metric_value
from /* TODO: ServiceTitan_Lead */ (select 1) t
;
