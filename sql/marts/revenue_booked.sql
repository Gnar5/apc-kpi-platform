-- AUTO-GENERATED: do not edit directly
-- metric_id: revenue_booked
-- name: Revenue Booked
-- owner: finance
-- category: revenue
-- time_basis: sold_at
-- grain_level: job
-- source: ServiceTitan.Job

-- TODO:
-- 1) Map source fields -> canonical fields
-- 2) Apply filters (include/exclude)
-- 3) Add territory/segment joins
-- 4) Implement attribution rule + exceptions if needed

select
  'revenue_booked' as metric_id,
  /* sold_at */ null::timestamp as metric_time,
  /* territory */ null::text as territory,
  /* segment */ null::text as segment,
  sum(booked_revenue) as metric_value
from /* TODO: ServiceTitan_Job */ (select 1) t
;
