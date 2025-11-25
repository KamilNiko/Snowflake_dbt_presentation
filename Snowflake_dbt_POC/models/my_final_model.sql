-- CONFIG
{{ config(materialized='table') }}

with third_model as (
    select * from {{ ref('my_third_dbt_model') }}
),

new_table_data as (
    select * from {{ source('my_new_source', 'extra_details') }}
)

select
    t.id,
    n.description
from third_model t
left join new_table_data n
    on t.id = n.id
    