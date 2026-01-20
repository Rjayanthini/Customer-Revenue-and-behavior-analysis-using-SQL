WITH customer_metrics AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.region,
        COUNT(DISTINCT o.order_id) AS order_count_12m,
        SUM(CASE WHEN p.payment_status = 'SUCCESS' THEN p.payment_amount ELSE 0 END) AS total_spend_12m,
        AVG(CASE WHEN p.payment_status = 'SUCCESS' THEN o.order_amount ELSE NULL END) AS avg_order_value,
        MAX(CASE WHEN p.payment_status = 'SUCCESS' THEN p.payment_date ELSE NULL END) AS last_payment_date
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
        AND o.order_date >= DATE '2024-01-01'
    LEFT JOIN payments p
        ON o.order_id = p.order_id
        AND p.payment_date >= DATE '2024-01-01'
    GROUP BY c.customer_id, c.customer_name, c.region
)

SELECT
    *,
    CASE
        WHEN order_count_12m >= 10
             AND total_spend_12m >= 120000
            THEN 'HIGH VALUE'

        WHEN order_count_12m BETWEEN 6 AND 9
             AND total_spend_12m >= 50000
            THEN 'MEDIUM VALUE'

        WHEN order_count_12m BETWEEN 1 AND 4
            THEN 'LOW VALUE'

        ELSE 'INACTIVE / NEW'
    END AS customer_segment
FROM customer_metrics;
