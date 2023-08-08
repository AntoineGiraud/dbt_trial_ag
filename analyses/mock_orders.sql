drop table if exists raw.mock_orders;
create table raw.mock_orders (
    order_id integer,
    status varchar (100),
    created_at date,
    updated_at date
);

insert into raw.mock_orders (order_id, status, created_at, updated_at)
values (1, 'delivered', '2020-01-01', '2020-01-04'),
       (2, 'shipped', '2020-01-02', '2020-01-04'),
       (3, 'shipped', '2020-01-03', '2020-01-04'),
       (4, 'processed', '2020-01-04', '2020-01-04');
commit;

-- later, after a dbt build
update raw.mock_orders
set status='delivered', updated_at='2020-01-05'
where order_id =2;

insert into raw.mock_orders (order_id, status, created_at, updated_at)
values (5, 'delivered', '2020-01-01', '2020-01-05'),
       (6, 'shipped', '2020-01-02', '2020-01-06'),
       (7, 'shipped', '2020-01-03', '2020-01-05'),
       (8, 'processed', '2020-01-04', '2020-01-06');
commit;

-- juste pour essayer voir comment vont les timestamp now
select date_trunc('seconds', NOW()::timestamp);
select localtimestamp(0);
