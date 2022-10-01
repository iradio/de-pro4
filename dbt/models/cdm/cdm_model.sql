-- Common Data Marts

select *
from {{ ref('dds_model') }}