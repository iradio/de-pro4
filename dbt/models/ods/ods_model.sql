-- Operational Data Storage
select *
from {{ source('stg','logs') }}