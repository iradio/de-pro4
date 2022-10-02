select distinct object_value::JSON ->> 'browser_name' as browser_name
FROM {{source('stg','events_log')}}