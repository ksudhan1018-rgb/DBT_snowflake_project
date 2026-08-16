{{ config(
    materialized='incremental',
    unique_key='listing_id',
    on_schema_change='sync_all_columns'
) }}

{% set incremental_col = 'CREATED_AT' %}


select * from {{ source('stage', 'listings') }}
{% if is_incremental() %}
where {{ incremental_col }} >= (select coalesce(max({{ incremental_col }}), '1900-01-01') from {{ this }})
{% endif %}
