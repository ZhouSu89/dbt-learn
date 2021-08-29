with orders as (
    select * from {{ref('stg_orders')}}
),

payments as (
    select * from {{ref('stg_payments')}}
),

order_payments as (
    select 
        order_id, 
        sum(if(status='success',amount,0)) as amount
    from payments
    group by order_id
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        order_payments.amount
        from orders 
        left join order_payments using (order_id)
)

select * from final