with Year_2020 as (
    select *
    from DEMO_DB.FUENTES_DEMO.DIM_DATE
    where YEAR_NUMBER = 2000
),
Day_number as(
    select
        DAY_WEEK_NUMBER,
        count(1) as days_qty 
    from Year_2020
    group by DAY_WEEK_NUMBER
    order by DAY_WEEK_NUMBER asc
)
select * from Day_number