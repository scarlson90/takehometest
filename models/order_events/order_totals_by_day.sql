select date_trunc('day',created_date) as created_date,
        count(distinct order_id) as total_orders,
        count(distinct customer_id) as unique_customers,
        sum(revenue) as daily_revenue
        from {{ ref('orders') }}
        group by 1
        order by 1 desc
