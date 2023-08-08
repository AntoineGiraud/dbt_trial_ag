
{{ audit_helper.compare_relations(
    a_relation=source('jaffle_shop', 'raw_customers'),
    b_relation=ref('raw_customers'),
    primary_key="id",
    summarize=false
) }}

