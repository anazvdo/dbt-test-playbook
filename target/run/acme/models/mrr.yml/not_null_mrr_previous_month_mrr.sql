select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select previous_month_mrr
from `production-environment-306717`.`general_explorations`.`mrr`
where previous_month_mrr is null



      
    ) dbt_internal_test