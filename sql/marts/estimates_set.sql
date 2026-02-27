-- AUTO-GENERATED: do not edit directly
-- metric_id: estimates_set
-- name: Estimates Set
-- owner: sales
-- category: estimates
-- time_basis: estimate_set_at
-- grain_level: lead
-- source: ServiceTitan.Appointment

-- TODO:
-- 1) Map source fields -> canonical fields
-- 2) Apply filters (include/exclude)
-- 3) Add territory/segment joins
-- 4) Implement attribution rule + exceptions if needed

select
  'estimates_set' as metric_id,
  /* estimate_set_at */ CAST(NULL AS TIMESTAMP) as metric_time,
  /* territory */ CAST(NULL AS STRING) as territory,
  /* segment */ CAST(NULL AS STRING) as segment,
  /* TODO: define expression */ as metric_value
from /* TODO: ServiceTitan_Appointment */ (select 1) t
;
