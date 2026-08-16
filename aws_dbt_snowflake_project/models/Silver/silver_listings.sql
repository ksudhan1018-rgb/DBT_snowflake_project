{{ config(
    materialized='incremental',
    unique_key='listing_id'
) }}

Select
    listing_id,
    host_id,
    property_type,
    room_type,
    city,
    country,
    Accommodates,
    Bedrooms,
    Bathrooms,
    price_per_night,
    {{ tag('CAST(price_per_night AS INTEGER)') }} as price_per_night_tag,
    created_at
from 
    {{ ref('bronze_listings') }}