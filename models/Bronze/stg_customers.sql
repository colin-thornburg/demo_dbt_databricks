Select
    id As customer_id,
    first_name,
    last_name
From {{ source('jaffle_shop', 'jaffle_shop_customers') }}
