with source as (
    select * from {{ source('northwind', 'orders') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source