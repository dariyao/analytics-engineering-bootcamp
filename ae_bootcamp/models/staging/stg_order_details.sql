with source as (
    select * from {{ source('northwind', 'order_details') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source