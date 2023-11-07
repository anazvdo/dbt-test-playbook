





with validation_errors as (

    select
        customer_id, date_month
    from `production-environment-306717`.`general_explorations`.`customer_revenue_by_month`
    group by customer_id, date_month
    having count(*) > 1

)

select *
from validation_errors


