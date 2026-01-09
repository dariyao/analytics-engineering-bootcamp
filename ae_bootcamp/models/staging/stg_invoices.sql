with source as (
    select * from {{ source('northwind', 'invoices') }}
)

select
    *,
    current_timestamp() AS ingestion_timestamp
from source