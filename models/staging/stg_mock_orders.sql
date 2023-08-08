{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
) }}

select *
from {{ source('jaffle_shop', 'mock_orders') }}
{% if is_incremental() %}
  where updated_at >= (
      select dateadd(day, -2, max(updated_at)::date) from {{this}}
    )
{% endif %}
