with
orders as (
    select
        customer_id,
        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from {{ ref('stg_orders') }}
    group by 1
),
payments as (
    select
        o.customer_id,
        sum(amount) as total_amount
    from {{ ref('stg_payments') }} p
        left join {{ ref('stg_orders') }} o using(order_id)
    group by 1
)
select
    c.customer_id,
    c.first_name,
    c.last_name,
    o.first_order,
    o.most_recent_order,
    o.number_of_orders,
    p.total_amount as customer_lifetime_value
from {{ ref('stg_customers') }} c
    left join orders o using(customer_id)
    left join payments p using(customer_id)
