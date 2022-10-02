select distinct case 
	when object_value::JSON ->> 'page_url_path' = '/confirmation' then 'transaction'
	when object_value::JSON ->> 'page_url_path' = '/cart' then 'pageview_cart'
	when object_value::JSON ->> 'page_url_path' = '/payment' then 'pageview_payment'
	when object_value::JSON ->> 'page_url_path' = '/home' then 'pageview_payment'
	else 'other'
end as event_type
FROM {{source('stg','events_log')}}