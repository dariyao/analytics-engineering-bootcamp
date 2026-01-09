with source as (
    select * from {{ source('northwind', 'inventory_transactions') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source