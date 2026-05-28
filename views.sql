-- =========================================
-- CREATE DATABASE
-- =========================================

CREATE DATABASE restaurant_db;
USE restaurant_db;

-- =========================================
-- CREATE CATEGORY TABLE
-- =========================================

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'South Indian'),
(2, 'North Indian'),
(3, 'Chinese'),
(4, 'Desserts'),
(5, 'Beverages');

-- =========================================
-- CREATE FOOD ITEMS TABLE
-- 6 COLUMNS
-- =========================================

CREATE TABLE food_items (
    food_id INT PRIMARY KEY,
    food_name VARCHAR(100),
    category_id INT,
    price DECIMAL(8,2),
    quantity INT,
    rating DECIMAL(2,1),
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);

-- =========================================
-- INSERT 30 RECORDS
-- =========================================

INSERT INTO food_items VALUES
(1, 'Idli', 1, 40, 50, 4.5),
(2, 'Dosa', 1, 80, 35, 4.7),
(3, 'Pongal', 1, 70, 25, 4.3),
(4, 'Vada', 1, 30, 60, 4.4),
(5, 'Upma', 1, 50, 20, 4.1),

(6, 'Butter Naan', 2, 45, 40, 4.6),
(7, 'Paneer Butter Masala', 2, 220, 18, 4.8),
(8, 'Veg Biryani', 2, 180, 22, 4.5),
(9, 'Dal Tadka', 2, 150, 15, 4.2),
(10, 'Jeera Rice', 2, 120, 17, 4.0),

(11, 'Fried Rice', 3, 160, 28, 4.3),
(12, 'Noodles', 3, 140, 26, 4.2),
(13, 'Manchurian', 3, 170, 19, 4.4),
(14, 'Spring Roll', 3, 130, 24, 4.1),
(15, 'Schezwan Rice', 3, 190, 16, 4.5),

(16, 'Ice Cream', 4, 90, 45, 4.7),
(17, 'Gulab Jamun', 4, 60, 50, 4.6),
(18, 'Brownie', 4, 110, 21, 4.8),
(19, 'Rasgulla', 4, 70, 30, 4.4),
(20, 'Cheese Cake', 4, 150, 14, 4.9),

(21, 'Coffee', 5, 60, 55, 4.5),
(22, 'Tea', 5, 30, 70, 4.3),
(23, 'Mango Juice', 5, 90, 25, 4.6),
(24, 'Lassi', 5, 80, 27, 4.5),
(25, 'Milkshake', 5, 120, 20, 4.7),

(26, 'Pizza', 2, 300, 12, 4.9),
(27, 'Burger', 2, 150, 29, 4.4),
(28, 'Sandwich', 2, 100, 33, 4.2),
(29, 'Momos', 3, 130, 31, 4.5),
(30, 'Falooda', 4, 140, 18, 4.8);

-- =========================================
-- SIMPLE VIEW QUESTIONS
-- =========================================

-- 1. Create a view to display all food items with price greater than 100
create view view_name as select * from food_items where price>100;
select*from view_name;

-- 2. Create a view to display only beverages items
create view vc as select*from food_items f inner join categories c using(category_id) where category_name="beverages";
select*from vc; 
desc food_items;
select*from food_items;
-- 3. Create a view to show food items with rating above 4.5
create view n as select*from food_items where rating>4.5;
select*from n;

-- =========================================
-- COMPLEX VIEW QUESTIONS
-- =========================================
desc food_items;
-- 4. Create a view using JOIN to display food name and category name
create view v as select f.food_name,c.category_name from food_items f inner join categories c using(category_id);
select*from v;

-- 5. Create a view to display category-wise average price
create view v1 as select f.food_name,c.category_id from food_items f inner join categories c using(category_id) group by category_id;
select*from v1;
CREATE VIEW v3 AS SELECT c.category_id,AVG(f.price) AS avg_price FROM food_items f INNER JOIN categories c USING(category_id) GROUP BY c.category_id;
-- 6. Create a view to show total quantity available in each category
desc food_items;
desc categories;
create view v4 as select count(*),category_id from food_items group by category_id;
select*from v4;
-- 7. Create a view to display highest priced food item in each category

create view v8 as select max(price),category_id from food_items group by category_id;
select*from v8;
-- 8. Create a view using subquery to show foods priced above average price

create view v9 as select food_name from food_items where price>(select avg(price) from food_items);
select*from v9; 
-- 9. Create a view to display category names having more than 5 food items

CREATE VIEW v10 AS SELECT c.category_name,COUNT(f.food_id) AS total_food_items FROM categories c INNER JOIN food_items f ON c.category_id = f.category_id GROUP BY c.category_id, c.category_name HAVING COUNT(f.food_id) > 5;
-- 10. Create a view to display top rated item from each category

create view v12 as select f1.food_name from food_items f1 where rating=(select max(f1.rating) from food_items f2 where f1.category_id=f2.category_id);
select*from v12; 

