{{ config(
    materialized='ephemeral'
) }}

with listings as (
    select
        listing_id,
        property_type,
        city,
        country,
        accommodates,
        bathrooms,
        bedrooms,
        price_per_night_tag,
        LISTING_CREATED_AT as listing_created_at

    from {{ ref('obt') }}
)
select * from listings