{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
) }}

select *
from {{ source('jaffle_shop', 'mock_orders') }}
{% if is_incremental() %}
where updated_at >= (select max(updated_at) from {{ this }})
{% endif %}
