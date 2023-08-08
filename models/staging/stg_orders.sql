select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
-- from {{ ref('raw_orders') }}
from {{ source('jaffle_shop', 'raw_orders') }}
