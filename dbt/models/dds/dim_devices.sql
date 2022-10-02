with t as (
    select distinct object_value::JSON ->> 'device_type' as device_type
    FROM {{source('stg','events_log')}}
)
select 
	{{dbt_utils.surrogate_key(['device_type'])}}::varchar(32) id
	,device_type
from t