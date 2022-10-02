select distinct object_value::JSON ->> 'device_type' as device_type
FROM {{source('stg','events_log')}}