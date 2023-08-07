{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with
    payments as (
        select
            order_id,

            {% for payment_method in payment_methods -%}
                sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount,
            {% endfor -%}

            sum(amount) as total_amount
        from {{ ref('stg_payments') }}
        group by order_id
    )
select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,

    {% for payment_method in payment_methods -%}
        p.{{ payment_method }}_amount,
    {% endfor -%}

    p.total_amount as amount
from {{ ref('stg_orders') }} o
    left join payments p using(order_id)
