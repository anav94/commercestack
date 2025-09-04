
  
  create view "commercestack"."main_staging"."stg_orders__dbt_tmp" as (
    with src as (
  select * from "commercestack"."main_raw"."olist_orders"
)
select
  order_id,
  customer_id,
  cast(order_purchase_timestamp as timestamp) as order_purchase_timestamp,
  lower(order_status) as order_status
from src
  );
