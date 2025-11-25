{{ config(materialized='table') }}

    with source_data as (
    select 1 as id
    union all
    select null as id -- Zostawiamy wiersz z NULL
    union all
    select 3 as id   
    union all
    select 4 as id    
  )

  select *
  from source_data