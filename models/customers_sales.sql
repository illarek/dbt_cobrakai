{{
  config(
    materialized='table'
  )
}}

with customers as (
    select * from {{ ref('stg_customers') }}
),
sales as (
    select * from {{ ref('stg_sales') }}
),
customer_sales as (
    select *
    from customers c
    inner join sales s on c.C_CUSTOMER_SK=s.SS_CUSTOMER_SK
    limit 1000
)
select
    C_FIRST_NAME,
    C_LAST_NAME,
    C_EMAIL_ADDRESS,
    count(SS_EXT_SALES_PRICE) as QTY,
    sum(SS_EXT_SALES_PRICE) AS AMOUNT
from customer_sales
group by C_FIRST_NAME,C_LAST_NAME,C_EMAIL_ADDRESS