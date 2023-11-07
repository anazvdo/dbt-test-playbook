select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    
    


    
    




with window_functions as (

    select
        
        customer_id as partition_by_col,
        
        start_date as lower_bound,
        end_date as upper_bound,

        lead(start_date) over (
            partition by customer_id
            order by start_date
        ) as next_lower_bound,

        row_number() over (
            partition by customer_id
            order by start_date desc
        ) = 1 as is_last_record

    from `production-environment-306717`.`general_explorations`.`subscription_periods`

),

calc as (
    -- We want to return records where one of our assumptions fails, so we'll use
    -- the `not` function with `and` statements so we can write our assumptions nore cleanly
    select
        *,

        -- For each record: lower_bound should be < upper_bound.
        -- Coalesce it to return an error on the null case (implicit assumption
        -- these columns are not_null)
        coalesce(
            lower_bound < upper_bound,
            false
        ) as lower_bound_less_than_upper_bound,

        -- For each record: upper_bound <= the next lower_bound.
        -- Coalesce it to handle null cases for the last record.
        coalesce(
            upper_bound <= next_lower_bound,
            is_last_record,
            false
        ) as upper_bound_less_than_or_equal_to_next_lower_bound

    from window_functions

),

validation_errors as (

    select
        *
    from calc

    where not(
        -- THE FOLLOWING SHOULD BE TRUE --
        lower_bound_less_than_upper_bound
        and upper_bound_less_than_or_equal_to_next_lower_bound
    )
)

select * from validation_errors

      
    ) dbt_internal_test