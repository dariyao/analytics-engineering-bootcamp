with source as (
    select * from {{ source('northwind', 'purchase_order_status') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source