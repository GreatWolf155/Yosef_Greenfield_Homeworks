--drop tables from end to beginning
DROP TABLE IF EXISTS order_pizza_toppings;

DROP TABLE IF EXISTS order_drinks;
DROP TABLE IF EXISTS order_pizzas;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS drinks;
DROP TABLE IF EXISTS toppings;
DROP TABLE IF EXISTS pizzas;
DROP TABLE IF EXISTS customers;

-- regular tables
-- no cascade
-- auto increment for long lists
CREATE TABLE customers (
	customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
	customer_name TEXT NOT NULL
);

CREATE TABLE pizzas (
	pizza_id INTEGER PRIMARY KEY AUTOINCREMENT,
	pizza_name TEXT NOT NULL,
	current_base_price REAL NOT NULL
);

CREATE TABLE toppings (
	topping_id INTEGER PRIMARY KEY AUTOINCREMENT,
	topping_name TEXT NOT NULL,
	current_topping_price REAL NOT NULL
);

CREATE TABLE drinks (
	drink_id INTEGER PRIMARY KEY AUTOINCREMENT,
	drink_name TEXT NOT NULL,
	current_drink_price REAL NOT NULL
);

-- no autoincrement
CREATE TABLE orders (
	order_id INTEGER PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- tier 2 tables
-- REMINDER
-- ON DELETE CASCADE should be used only for deleting parts of the order itself, do not delete static info
CREATE TABLE order_pizzas (
	order_id INTEGER,
	pizza_id INTEGER,
	qty INTEGER NOT NULL DEFAULT 1,
	order_base_price REAL NOT NULL,
	PRIMARY KEY (order_id, pizza_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
	FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);

CREATE TABLE order_drinks (
	order_id INTEGER,
	drink_id INTEGER,
	qty INTEGER NOT NULL DEFAULT 1,
	order_drink_price REAL NOT NULL,
	PRIMARY KEY (order_id, drink_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
	FOREIGN KEY (drink_id) REFERENCES drinks(drink_id)
);

-- tier 3 tables
CREATE TABLE order_pizza_toppings (
	order_id INTEGER,
	pizza_id INTEGER,
	topping_id INTEGER,
	order_topping_price REAL NOT NULL,
	PRIMARY KEY (order_id, pizza_id, topping_id),
	FOREIGN KEY (order_id, pizza_id) REFERENCES order_pizzas(order_id, pizza_id) ON DELETE CASCADE,
	FOREIGN KEY (topping_id) REFERENCES toppings(topping_id)
);

-- need to insert pizzas, toppings, and drinks
INSERT INTO pizzas (pizza_name, current_base_price)
VALUES
	('Margherita', 49.90),
	('Cream Sauce', 45.00),
	('Chicago Deep Dish', 60.00);
	
INSERT INTO toppings (topping_name, current_topping_price)
VALUES
	('Green Olives', 2.50),
	('Tuna', 4.00),
	('Extra Cheese', 4.50),
	('Bulgarit', 4.50),
	('Mushrooms', 3.50),
	('Onion', 2.50),
	('Corn', 3.0);
	
INSERT INTO drinks (drink_name, current_drink_price)
VALUES
	('Coca-Cola', 12.00),
	('Fanta', 10.00),
	('Fuze Tea', 10.00),
	('Milk?', 7.00);