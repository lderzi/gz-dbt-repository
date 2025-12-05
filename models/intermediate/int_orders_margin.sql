SELECT
    orders_id,
    date_date,
    ROUND(SUM (turnover),2) AS turnover,
    SUM (quantity) AS quantity,
    ROUND(SUM (purchase_cost),2) AS purchase_cost,
    ROUND(SUM (margin),2) as margin
FROM {{ ref('int_sales_margin') }}
    GROUP BY 
    orders_id, date_date