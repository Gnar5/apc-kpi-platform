-- AUTO-GENERATED: do not edit directly
-- metric_id: estimates_completed
-- name: Estimates Completed
-- owner: sales
-- category: estimates
-- time_basis: estimate_completed_at
-- grain_level: lead
-- source: ServiceTitan.Appointment

-- TODO:
-- 1) Map source fields -> canonical fields
-- 2) Apply filters (include/exclude)
-- 3) Add territory/segment joins
-- 4) Implement attribution rule + exceptions if needed

select
  'estimates_completed' as metric_id,
  /* estimate_completed_at */ null::timestamp as metric_time,
  /* territory */ null::text as territory,
  /* segment */ null::text as segment,
  /* TODO: define expression */ as metric_value
from /* TODO: ServiceTitan_Appointment */ (select 1) t
;
