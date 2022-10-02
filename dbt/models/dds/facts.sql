with f as (
select distinct object_value::JSON ->> 'event_timestamp' as event_timestamp,
				object_value::JSON ->> 'page_url_path' as page_url_path,
				object_value::JSON ->> 'user_domain_id' as user_domain_id,
				object_value::JSON ->> 'user_custom_id' as user_custom_id,
				object_value::JSON ->> 'event_type' as event_type_id,
				object_value::JSON ->> 'event_id' as event_id,
				object_value::JSON ->> 'browser_name' as browser_name,
				object_value::JSON ->> 'os_name' as os_name,
				object_value::JSON ->> 'device_type' as device_type,
				object_value::JSON ->> 'utm_medium' as utm_medium,
				object_value::JSON ->> 'utm_source' as utm_source,
				object_value::JSON ->> 'utm_content' as utm_content,
				object_value::JSON ->> 'utm_campaign' as utm_campaign,
				object_value::JSON ->> 'referer_url' as referer_url
FROM {{source('stg','events_log')}}
)
select  *	
from f