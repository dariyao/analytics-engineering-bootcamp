with source as (
    select * from {{ source('northwind', 'order_details_status') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source