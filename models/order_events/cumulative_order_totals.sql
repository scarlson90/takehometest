with monthly_revenue as (
        select date(date_trunc('month',DATE_CREATED)) as created_month,
        count(distinct order_id) as total_monthly_orders,
        sum(quantity) as total_items_sold,
        count(distinct vendor_id) as unique_vendors,
        count(distinct partner_id) as unique_partners,
        sum(revenue) as monthly_revenue
        from {{ ref('orders') }}
        group by 1
        order by 1 
)
select m.created_month
,m.total_monthly_orders
,m.total_items_sold
,m.unique_vendors
,m.unique_partners
,m.monthly_revenue
,sum(monthly_revenue) OVER (ORDER BY created_month) as cumulative_revenue
FROM monthly_revenue m