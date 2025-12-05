SELECT 

    s.orders_id,
    s.product_id,
    s.revenue as turnover,
    s.date_date,
    purchase_price,
    s.quantity,
    (s.quantity * purchase_price) AS purchase_cost,
    ROUND ((s.revenue - (s.quantity * p.purchase_price)),2) AS margin

FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} as s
    JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} as p
    ON s.product_id = p.product_id