select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with meet_condition as (
    select * from `production-environment-306717`.`general_explorations`.`mrr` where 1=1
)

select
    *
from meet_condition

where not(date_month <= date_trunc('month', current_date))


      
    ) dbt_internal_test