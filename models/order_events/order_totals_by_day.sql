select DATE(date_trunc('day',DATE_CREATED)) as created_date,
        count(distinct order_id) as total_orders,
        count(order_item_id) as total_order_items,
        sum(quantity) as total_items_sold,
        count(distinct vendor_id) as total_vendors,
        count(distinct partner_id) as unique_partners,
        sum(revenue) as daily_revenue
        from {{ ref('orders') }}
        group by 1
        order by 1 desc
