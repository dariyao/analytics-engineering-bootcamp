with source as (
    select * from {{ source('northwind', 'employees') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source