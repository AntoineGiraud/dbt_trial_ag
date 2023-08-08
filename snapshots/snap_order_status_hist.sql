{% snapshot order_status_hist %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='postgres',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='timestamp',
      updated_at='updated_at'
    )
}}

SELECT
    order_id,
    status,
    created_at,
    updated_at
FROM {{ ref('stg_mock_orders') }}

{% endsnapshot %}
