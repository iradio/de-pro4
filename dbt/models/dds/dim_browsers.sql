with t as (
	select distinct object_value::JSON ->> 'browser_name' as browser_name
	FROM {{source('stg','events_log')}}
)
select 
	{{dbt_utils.surrogate_key(['browser_name'])}}::varchar(32) id
	,browser_name
from t