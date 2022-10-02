select distinct object_value::JSON ->> 'user_domain_id' as user_domain_id,
		object_value::JSON ->> 'user_custom_id' as user_custom_id
FROM {{source('stg','events_log')}}