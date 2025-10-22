with source as (
    select * from {{ source('northwind', 'suppliers') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source