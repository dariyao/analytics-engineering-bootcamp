with source as (
    select * from {{ source('northwind', 'products') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source