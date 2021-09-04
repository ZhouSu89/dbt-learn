with payments as (
    select
        orderid as order_id,
        id as customer_id,
        paymentmethod as payment_method,
        status,
        {{cents_to_dollars('amount')}} as amount,
        created as order_date  
    from {{source('stripe','payment')}}
)

select * from payments
