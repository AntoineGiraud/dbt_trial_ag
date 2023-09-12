{% snapshot dim_customer_hist %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_schema=new_schema,
      unique_key='customer_id',

      strategy='check',
      check_cols=['first_name', 'last_name']
    )
}}
-- target_database='postgres',
-- strategy='timestamp',
-- updated_at='updated_at'

SELECT customer_id,
	first_name,
	last_name
FROM {{ ref('dim_customer') }}

{% endsnapshot %}
