WITH CTE AS (
  SELECT 
    orders.order_id, customers.full_name, 
    products. product_name, 
    categories.category_name, 
    order_items.quantity, order_items.subtotal, 
    orders.status, orders.order_date
  FROM order_items
  JOIN orders ON order_items.order_id= orders.order_id
  JOIN products ON order_items.product_id= products.product_id
  JOIN categories ON products.category_id=categories.category_id
  JOIN customers ON orders.customer_id=customers.customer_id
  ORDER BY orders.order_date
  ) 
  
  /**Total product sold per category**/
  SELECT 
     category_name, sum(quantity) total
  FROM 
     CTE 
  GROUP BY category_name;


/**Total revenue per category**/
SELECT 
  categories.category_name,
  SUM(order_items.subtotal) AS total_revenue
FROM order_items
JOIN products  ON order_items.product_id = products.product_id
JOIN categories  ON products.category_id = categories.category_id
GROUP BY categories.category_name
ORDER BY total_revenue DESC;



/**TOP 5 MOST SELLING PRODUCT**/

SELECT 
  products.product_name,
  SUM(order_items.quantity) AS total_sold
FROM order_items 
JOIN products ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_sold DESC
LIMIT 5;
