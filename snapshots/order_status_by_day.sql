
{% snapshot order_status_by_day %}

    {{
        config(
          target_schema='order_events',
          strategy='timestamp',
          unique_key='order_id',
          updated_at='updated_date',
        )
    }}

    SELECT
       order_id
      ,created_date
      ,updated_date
      ,order_status
      ,customer_id
      ,revenue
    FROM {{ ref('orders') }}

{% endsnapshot %}
