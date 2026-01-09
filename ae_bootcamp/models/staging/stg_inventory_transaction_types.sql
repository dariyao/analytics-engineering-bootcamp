with source as (
    select * from {{ source('northwind', 'inventory_transaction_types') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source