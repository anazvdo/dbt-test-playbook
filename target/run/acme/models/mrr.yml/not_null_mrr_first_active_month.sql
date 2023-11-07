select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select first_active_month
from `production-environment-306717`.`general_explorations`.`mrr`
where first_active_month is null



      
    ) dbt_internal_test