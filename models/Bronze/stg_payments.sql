select
    id as payment_id,
    orderid,
    paymentmethod,
    status,
    -- amount is stored in cents, convert it to dollars
    created as created_at,
    amount / 100 as amount,
    case
    when paymentmethod = 'coupon' then CAST(0.05 AS DECIMAL(10, 2))
    else CAST(0.00 AS DECIMAL(10, 2))
end as discount_percent

from {{ source('stripe', 'stripe_payments') }}