import duckdb, streamlit as st
from pathlib import Path

st.set_page_config(page_title="CommerceStack Analytics", layout="wide")
DB_PATH = Path(__file__).resolve().parents[1] / "data" / "commercestack.duckdb"
con = duckdb.connect(str(DB_PATH))

st.title("CommerceStack Analytics")

kpi = con.execute("""
  with base as (
    select * from main_marts.fct_orders where order_status='delivered'
  )
  select
    sum(revenue) as total_revenue,
    count(distinct customer_id) as customers,
    count(distinct order_id) as orders
  from base
""").df().iloc[0]

c1, c2, c3 = st.columns(3)
c1.metric("Total Revenue", f"${kpi['total_revenue']:,.0f}")
c2.metric("Unique Customers", int(kpi['customers']))
c3.metric("Orders", int(kpi['orders']))

weekly = con.execute("select order_week, revenue from main_marts.fct_orders where order_status='delivered' order by order_week").df()
st.subheader("Weekly Revenue")
st.line_chart(weekly, x="order_week", y="revenue")
