select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        customer_id, date_month
    from `production-environment-306717`.`general_explorations`.`mrr`
    group by customer_id, date_month
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test