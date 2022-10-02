--count_events

select 
	det.event_type
	, count(f.event_id)
	, date_trunc('hour',f.event_timestamp) as "hour"
from {{ref('facts')}}
left join {{ref('dim_event_type')}} det on f.event_id = det.id
group by det.event_type, "hour";