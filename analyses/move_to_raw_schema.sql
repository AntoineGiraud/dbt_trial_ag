
drop table if exists `raw.raw_employee`;
create table `raw.raw_employee` as
select * from {{ ref('raw_employee') }};

drop table if exists `raw.raw_customers`;
create table `raw.raw_customers` as
select * from {{ ref('raw_customers') }};

drop table if exists `raw.raw_orders`;
create table `raw.raw_orders` as
select * from {{ ref('raw_orders') }};

drop table if exists `raw.raw_payments`;
create table `raw.raw_payments` as
select * from {{ ref('raw_payments') }};

-- {% set raw_tables = ['raw_employee', 'raw_customers', 'raw_orders', 'raw_payments'] %}
-- {% for raw_tables in tbl -%}
--     drop table if exists `raw.tbl`;
--     create table `raw.tbl` as
--     select * from {{ ref(tbl) }};
-- {% endfor -%}