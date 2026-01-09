with source as (
    select * from {{ source('northwind', 'privileges') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source