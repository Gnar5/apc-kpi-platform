-- AUTO-GENERATED: do not edit directly
-- metric_id: speed_to_lead_minutes
-- name: Speed To Lead (Minutes)
-- owner: marketing
-- category: responsiveness
-- time_basis: lead_created_at
-- grain_level: lead
-- source: ServiceTitan.Lead

-- TODO:
-- 1) Map source fields -> canonical fields
-- 2) Apply filters (include/exclude)
-- 3) Add territory/segment joins
-- 4) Implement attribution rule + exceptions if needed

select
  'speed_to_lead_minutes' as metric_id,
  /* lead_created_at */ CAST(NULL AS TIMESTAMP) as metric_time,
  /* territory */ CAST(NULL AS STRING) as territory,
  /* segment */ CAST(NULL AS STRING) as segment,
  minutes_diff(first_contact_attempt_at, lead_created_at) as metric_value
from /* TODO: ServiceTitan_Lead */ (select 1) t
;
