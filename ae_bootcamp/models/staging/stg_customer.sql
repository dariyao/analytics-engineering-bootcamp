with source as (
    select * from {{ source('northwind', 'customer') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source