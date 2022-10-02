with t as (select distinct object_value::JSON ->> 'utm_medium' as utm_medium,
				object_value::JSON ->> 'utm_source' as utm_source,
				object_value::JSON ->> 'utm_content' as utm_content,
				object_value::JSON ->> 'utm_campaign' as utm_campaign,
				object_value::JSON ->> 'referer_url' as referer_url
FROM {{source('stg','events_log')}}
)
select 
	{{dbt_utils.surrogate_key(['utm_medium','utm_source','utm_content','utm_campaign','referer_url'])}}::varchar(32) id
	,*
from t