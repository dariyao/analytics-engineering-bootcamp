with source as (
    select * from {{ source('northwind', 'purchase_order_details') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source