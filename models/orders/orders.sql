select ORDER_ID
      ,ORDER_ITEM_ID
      ,DATE_CREATED
      ,IN_PRODUCTION_DATE
      ,SHIP_DATE
      ,DELIVERED_DATE
      ,PARTNER_ID
      ,VENDOR_ID
      ,ORDER_STATUS
      ,(case when order_id = 3902364 then 12.00 else revenue end) as revenue
FROM {{ ref('orders_raw') }}