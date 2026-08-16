{% set configs = [
    {
        "table": "airbnb.gold.obt",
        "columns": "obt_gold.booking_id, obt_gold.listing_id, obt_gold.total_amount, obt_gold.cleaning_fee, obt_gold.service_fee, obt_gold.host_id, obt_gold.accommodates, obt_gold.bedrooms, obt_gold.bathrooms, obt_gold.price_per_night, obt_gold.response_rate",
        "alias": "obt_gold"
    },
    {
        "table": "airbnb.gold.dim_listings",
        "columns": "",
        "alias": "dim_listings",
        "join_condition": "obt_gold.listing_id = dim_listings.listing_id"
    },
    {
        "table": "airbnb.gold.dim_hosts",
        "columns": "",
        "alias": "dim_hosts",
        "join_condition": "obt_gold.host_id = dim_hosts.host_id"
    }
] %}

select
    {{ configs[0].columns }}

from
    {% for config in configs %}
    {% if loop.first %}
    {{ config.table }} as {{ config.alias }}
    {% else %}
    left join {{ config.table }} as {{ config.alias }}
        on {{ config.join_condition }}
    {% endif %}
    {% endfor %}