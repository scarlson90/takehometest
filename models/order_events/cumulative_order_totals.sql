select date_trunc('month',created_date) as created_month,
        count(distinct order_id) as total_monthly_orders,
        count(distinct customer_id) as unique_customers,
        sum(revenue) OVER (ORDER BY date_trunc('month',created_date)) as cumulative_monthly_revenue
        from {{ ref('orders') }}
        group by 1
        order by 1 asc