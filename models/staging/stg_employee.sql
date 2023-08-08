select
    employee_id,
    customer_id,
    email
from {{ ref('raw_employee') }}
