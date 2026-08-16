{{
  config( severity = 'warn' )
}}

select 
    1
from
    {{ source('stage', 'bookings') }}
where
    booking_amount < 200