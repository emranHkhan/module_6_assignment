---------------------------------------- 1 ----------------------------------------

SELECT
    Customers.*,
    COUNT(Customers.customer_id) AS total_orders
FROM Customers
    JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY
    Customers.customer_id
ORDER BY total_orders DESC;

---------------------------------- 2 --------------------------------

SELECT
    Products.name,
    Order_Items.quantity, (
        Order_Items.quantity * Order_Items.unit_price
    ) AS total
FROM Products
    JOIN Order_Items ON Products.product_id = Order_Items.product_id
ORDER BY
    Order_Items.order_id ASC;

---------------------------------- 3 --------------------------------

SELECT
    Categories.name,
    SUM(
        Order_Items.quantity * Order_Items.unit_price
    ) AS revenue
FROM Categories
    JOIN Products ON Products.category_id = Categories.category_id
    JOIN Order_Items ON Order_Items.product_id = Products.product_id
GROUP BY Products.category_id
ORDER BY revenue DESC;

---------------------------------------- 4 --------------------------------------

SELECT
    Customers.name,
    Orders.total_amount
FROM Customers
    JOIN Orders ON Customers.customer_id = Orders.customer_id
ORDER BY total_amount DESC
LIMIT 5;