with f as (
select distinct object_value::JSON ->> 'event_timestamp' as event_timestamp,
				object_value::JSON ->> 'page_url_path' as page_url_path,
				object_value::JSON ->> 'user_domain_id' as user_domain_id,
				object_value::JSON ->> 'user_custom_id' as user_custom_id,
				case 
					when object_value::JSON ->> 'page_url_path' = '/confirmation' then 'transaction'
					when object_value::JSON ->> 'page_url_path' = '/cart' then 'pageview_cart'
					when object_value::JSON ->> 'page_url_path' = '/payment' then 'pageview_payment'
					when object_value::JSON ->> 'page_url_path' = '/home' then 'pageview_payment'
					else 'other'
				end  as event_type_id,
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
select  f.event_id as event_id
		,u.id as user_id
		,det.id as event_type_id
		,du.id as url_id
		,db.id as browser_is
		,dos.id as os_id			
		,dd.id as device_id
		,s.id as source_id		
from f
inner join {{ref('dim_urls')}} du on f.page_url_path = du.page_url_path 
inner join {{ref('dim_users')}} u on f.user_domain_id = u.user_domain_id 
inner join {{ref('dim_event_type')}} det on f.event_type_id = det.event_type
inner join {{ref('dim_browsers')}} db on f.browser_name = db.browser_name
inner join {{ref('dim_os')}} dos on f.os_name = dos.os_name
inner join {{ref('dim_devices')}} dd on f.device_type = dd.device_type
inner join {{ref('dim_sources')}} s on 
						f.utm_medium = s.utm_medium 
						and f.utm_source = s.utm_source 
						and f.utm_content = s.utm_content
						and f.utm_campaign = s.utm_campaign
						and f.referer_url = s.referer_url