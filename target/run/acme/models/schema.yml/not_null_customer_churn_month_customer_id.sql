select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_id
from `production-environment-306717`.`general_explorations`.`customer_churn_month`
where customer_id is null



      
    ) dbt_internal_test