{{ config(
    materialized = 'table'
) }}

with
    order_all as (

        select
            o.date_date,
            o.orders_id,
            m.turnover,
            m.quantity,
            m.purchase_cost,
            o.ship_cost,
            o.logcost,
            o.shipping_fee,
            o.operational_margin

        from {{ ref("int_orders_operational") }} o
        join {{ ref("int_orders_margin") }} m on o.orders_id = m.orders_id

    )

select
    date_date,
    count(distinct orders_id) as nb_transaction,
    round(sum(turnover),2) as total_turnover,
    round(sum(turnover) / count(distinct orders_id),2) as svg_basket,
    round(sum(operational_margin),2) as total_oper_margin,
    round(sum(purchase_cost),2) as total_purchase_cost,
    round(sum(shipping_fee),2) as total_shipping_fee,
    round(sum(logcost + ship_cost),2) as total_log_cost,
    sum(quantity) as quantity

from order_all

group by date_date
