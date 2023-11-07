

with meet_condition as (
    select * from `production-environment-306717`.`general_explorations`.`mrr` where 1=1
)

select
    *
from meet_condition

where not(date_month <= date_trunc('month', current_date))

