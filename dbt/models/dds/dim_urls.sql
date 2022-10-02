select distinct object_value::JSON ->> 'page_url' as page_url
		,(object_value::JSON ->> 'page_url_path') as page_url_path
FROM {{source('stg','events_log')}}