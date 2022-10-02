with t as (
select distinct object_value::JSON ->> 'os_name' as os_name
FROM {{source('stg','events_log')}}
)
select 
	{{dbt_utils.surrogate_key(['os_name'])}}::varchar(32) id
	,os_name
from t