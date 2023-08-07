select
    id as customer_id,
    first_name,
    last_name
-- from {{ ref('raw_customers') }}
from {{ source('jaffle_shop', 'raw_customers') }}
