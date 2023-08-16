{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
) }}

-- https://discourse.getdbt.com/t/on-the-limits-of-incrementality/303 -- article sympa :)

select *
from {{ source('jaffle_shop', 'mock_orders') }}
{% if is_incremental() %}
  where updated_at >= (
      select date(max(updated_at) -interval '2 day') from {{this}}
    )
{% endif %}
