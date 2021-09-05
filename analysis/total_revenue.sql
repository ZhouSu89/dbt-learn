with payments as (
    select * from {{ref('stg_payments')}}
),

payments_agg as (
    select sum(amount) as total_revenue
    from payments
    where status='success'

)

select * from payments_agg