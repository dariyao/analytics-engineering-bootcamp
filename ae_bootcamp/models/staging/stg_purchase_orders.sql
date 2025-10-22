with source as (
    select * from {{ source('northwind', 'purchase_orders') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source