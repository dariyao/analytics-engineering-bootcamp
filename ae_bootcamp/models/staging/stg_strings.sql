with source as (
    select * from {{ source('northwind', 'strings') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source