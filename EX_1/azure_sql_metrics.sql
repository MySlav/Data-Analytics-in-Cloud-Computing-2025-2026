-- Basic metrics
SELECT
  COUNT(*) AS total_orders,
  SUM(revenue_usd) AS total_revenue_usd,
  AVG(revenue_usd) AS avg_order_value_usd
FROM dbo.cloud_orders;

-- Top product by revenue
SELECT TOP 1
  product,
  SUM(revenue_usd) AS revenue_usd
FROM dbo.cloud_orders
GROUP BY product
ORDER BY revenue_usd DESC;
