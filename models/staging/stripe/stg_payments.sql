with payments as (
    select
        orderid as order_id,
        id as customer_id,
        paymentmethod as payment_method,
        status,
        amount/100 as amount,
        created as order_date
    -- from  `dbt-tutorial.stripe.payment`   
    from {{source('stripe','payment')}}
)

select * from payments