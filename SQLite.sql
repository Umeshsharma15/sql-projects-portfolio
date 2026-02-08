--SELECT * FROM Books;
--SELECT * from Customers;
--SELECT * from orders;

-- 1) Retrieve all books in the "Fiction" genre:
SELECT * from Books
where genre='Fiction';

-- 2) Find books published after the year 1950:
SELECT * from Books
WHERE published_year > 1950;

-- 3) List all customers from the Canada:
SELECT * from Customers
WHERE country='Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders
where order_date BETWEEN '2023-11-01' and '2023-11-31';

-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) as total_stock from Books;

-- 6) Find the details of the most expensive book:
SELECT * FROM Books
order by price desc limit 1 ;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * from Orders
Order by quantity desc limit 1 ;

SELECT * from Orders
where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders
where total_amount > 20 ;

-- 9) List all genres available in the Books table:
SELECT DISTINCT genre FROM Books;

-- 10) Find the book with the lowest stock:
SELECT * FROM Books
order by stock ASC limit 1;

-- 11) Calculate the total revenue generated from all orders:
 SELECT sum(total_amount) as total_revenue from Orders;
 
 
 
-- Advance Questions : 
--SELECT * FROM Books;
--SELECT * from Customers;
--SELECT * from orders;

-- 1) Retrieve the total number of books sold for each genre:
SELECT sum(o.quantity),b.genre as total_books_sold
from Orders o
join Books b
on b.book_id = o.book_id
GROUP by b. genre;


-- 2) Find the average price of books in the "Fantasy" genre:
SELECT avg(price) as avg_price FROM Books
where genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders:
SELECT COUNT(Order_id),customer_id as order_count
 from Orders
 group by customer_id
 having count(order_id) >=2;
 
-- 4) Find the most frequently ordered book:
SELECT book_id, COUNT(order_id) as order_count 
FROM Orders
GROUP by book_id
order by order_count DESC limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * from Books
where genre='Fantasy'
order by price DESC limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT author, sum(quantity) as total_books_sold
from orders
join Books 
on Orders.book_id=Books.book_id
group by author ;

-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT city,total_amount from Customers
join Orders on Customers.customer_id=Orders.customer_id
WHERE total_amount> 30 ;

-- 8) Find the customer who spent the most on orders:

SELECT name, Customers.customer_id, SUM(total_amount) AS total_spend_amount
FROM Customers
JOIN Orders 
ON Customers.customer_id = Orders.customer_id
GROUP BY name, Customers.customer_id 
ORDER BY total_spend_amount DESC;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id,b.title,b.stock-ifnull(sum(o.quantity),0) as remaining_stock 
from books b
left join Orders O
on b.book_id=o.book_id
GROUP BY b.book_id;


