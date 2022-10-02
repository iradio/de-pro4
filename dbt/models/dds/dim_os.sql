select distinct object_value::JSON ->> 'os_name' as os_name
FROM {{source('stg','events_log')}}