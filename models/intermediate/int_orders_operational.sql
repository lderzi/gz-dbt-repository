SELECT
o.orders_id,
date_date,
margin,
shipping_fee,ship_cost, logcost,
ROUND(margin - shipping_fee - logcost - ship_cost,2) as Operational_margin,
quantity
FROM {{ ref('int_orders_margin') }} as o
    JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }} as s
    ON o.orders_id = s.orders_id