{{ config(materialized='table') }}

select * from {{ ref('mrr') }}
limit 10