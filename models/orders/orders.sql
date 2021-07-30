select order_id
      ,created_date
      ,updated_date
      ,order_status
      ,customer_id
      ,(case when order_id = 3902364 then 12 else revenue end) as revenue
FROM {{ ref('orders_raw') }}