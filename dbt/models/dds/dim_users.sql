with t as (
	select distinct object_value::JSON ->> 'user_domain_id' as user_domain_id,
			object_value::JSON ->> 'user_custom_id' as user_custom_id
	FROM {{source('stg','events_log')}}
)
select 
	{{dbt_utils.surrogate_key(['user_domain_id'])}}::varchar(32) id
	,*
from t