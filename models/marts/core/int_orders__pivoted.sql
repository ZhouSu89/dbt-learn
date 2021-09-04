{%- set payment_methods=['credit_card', 'bank_transfer', 'coupon', 'gift_card']-%}
with payment as (
    select * from {{ref('stg_payments')}}
),

pivoted as (
    select order_id,
    {%for payment_method in payment_methods-%}
        sum(case when payment_method= '{{payment_method}}' then amount else 0 end) as {{payment_method}}_amount
    {%-if not loop.last -%}
         ,
    {%-endif %}
    {% endfor-%}
    from payment
    where status='success'
    group by order_id
)

select * from pivoted