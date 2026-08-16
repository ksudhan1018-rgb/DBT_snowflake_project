{{ config(
    materialized='incremental',
    unique_key='booking_id',
    on_schema_change='sync_all_columns'
) }}

{% set incremental_col = 'created_at' %}

Select
    booking_id,
    listing_id,
    booking_date,
    {{ multiply('nights_booked', 'booking_amount', 2) }} as Total_amount,
    cleaning_fee,
    service_fee,
    booking_status,
    created_at
from 
    {{ ref('bronze_bookings') }}
