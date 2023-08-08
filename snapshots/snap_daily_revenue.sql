{% snapshot daily_revenue %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='postgres',
      target_schema=new_schema,
      unique_key='order_date',

      strategy='check',
      check_cols=['nb_order', 'total_amount']
    )
}}
-- strategy='timestamp',
-- updated_at='updated_at'

SELECT order_date,
	count(1) nb_order,
	sum(amount) total_amount
FROM {{ ref('fct_order') }}
group by 1

{% endsnapshot %}

