
  
    
    

    create  table
      "commercestack"."main_marts"."fct_orders__dbt_tmp"
  
    as (
      with oi as (
  select order_id, sum(price) as items_value, sum(freight_value) as freight_value
  from "commercestack"."main_raw"."olist_order_items"
  group by 1
),
o as (
  select
    order_id,
    customer_id,
    lower(order_status) as order_status,
    date_trunc('week', order_purchase_timestamp) as order_week
  from "commercestack"."main_raw"."olist_orders"
)
select
  o.order_id,
  o.customer_id,
  o.order_status,
  o.order_week,
  coalesce(oi.items_value,0) + coalesce(oi.freight_value,0) as revenue
from o
left join oi using(order_id)
where o.order_status='delivered'
    );
  
  