

with meet_condition as (
    select * from `production-environment-306717`.`general_explorations`.`subscription_periods` where 1=1
)

select
    *
from meet_condition

where not(date_trunc('month', end_date) = end_date)

