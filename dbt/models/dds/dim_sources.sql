select distinct object_value::JSON ->> 'utm_medium' as utm_medium,
				object_value::JSON ->> 'utm_source' as utm_source,
				object_value::JSON ->> 'utm_content' as utm_content,
				object_value::JSON ->> 'utm_campaign' as utm_campaign,
				object_value::JSON ->> 'referer_url' as referer_url
FROM {{source('stg','events_log')}}