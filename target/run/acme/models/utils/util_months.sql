

  create or replace view `production-environment-306717`.`general_explorations`.`util_months`
  OPTIONS()
  as 

/*
call as follows:

date_spine(
    "day",
    "to_date('01/01/2016', 'mm/dd/yyyy')",
    "dateadd(week, 1, current_date)"
)

*/

with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
    
    

    )

    select *
    from unioned
    where generated_number <= 70
    order by generated_number



),

all_periods as (

    select (
        

        datetime_add(
            cast( '2018-01-01' as datetime),
        interval row_number() over (order by 1) - 1 month
        )


    ) as date_month
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_month <= date_trunc(current_date, month)

)

select * from filtered

;

