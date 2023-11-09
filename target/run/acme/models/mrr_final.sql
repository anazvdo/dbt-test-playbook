
  
    

    create or replace table `production-environment-306717`.`general_explorations`.`mrr_final`
      
    
    

    OPTIONS()
    as (
      

select * from `production-environment-306717`.`general_explorations`.`mrr`
limit 10
    );
  