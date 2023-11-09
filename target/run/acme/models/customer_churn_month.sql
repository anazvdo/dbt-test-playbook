

  create or replace view `production-environment-306717`.`general_explorations`.`customer_churn_month`
  OPTIONS()
  as 
with mrr as (

    select * from `production-environment-306717`.`general_explorations`.`customer_revenue_by_month`

),

-- row for month *after* last month of activity
joined as (

    select
        date_add(date_month, interval 1 month) as date_month,
        customer_id,
        0 as mrr,
        false as is_active,
        first_active_month,
        last_active_month,
        false as is_first_month,
        false as is_last_month

    from mrr

    where is_last_month = true

)

select * from joined;

