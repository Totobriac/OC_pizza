CREATE TABLE adress (
	id INT AUTO_INCREMENT NOT NULL,
	street_number INT NOT NULL,
	street_name VARCHAR(50) NOT NULL,
	zip_code INT NOT NULL,
	city VARCHAR(50) NOT NULL,
	additional_adress_details VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE franchise (
	id INT AUTO_INCREMENT NOT NULL,
	adress_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (adress_id) REFERENCES adress (id)	
);

CREATE TABLE user (
	id INT NOT NULL,
	user_gender VARCHAR(10) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	password VARCHAR(15) NOT NULL,
	phone_number INT NOT NULL,
	email VARCHAR(25) NOT NULL,
	role VARCHAR(25) NOT NULL,
	adress_id INT NOT NULL,
	franchise_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (adress_id) REFERENCES adress (id),
	FOREIGN KEY (franchise_id) REFERENCES franchise (id)  
);

CREATE TABLE status (
	id INT AUTO_INCREMENT NOT NULL,
	descr VARCHAR(25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE product (
	id INT AUTO_INCREMENT NOT NULL,
	category VARCHAR(50) NOT NULL,
	time_preparation SMALLINT NOT NULL,
	size SMALLINT NOT NULL,
	name VARCHAR(100) NOT NULL,
	picture VARCHAR(70) NOT NULL,
	price DECIMAL NOT NULL,
	PRIMARY KEY (id)	
);

CREATE TABLE ingredient(
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(50) NOT NULL,
	price DECIMAL (5,2) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE receipe (
	product_id INT NOT NULL,
	ingredient_id INT NOT NULL,  
	weight_by_ingredient INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES product (id),
	FOREIGN KEY (ingredient_id) REFERENCES ingredient (id)  
);

CREATE TABLE stock(
	id INT AUTO_INCREMENT NOT NULL,
	ingredient_id INT NOT NULL,
	franchise_id INT NOT NULL,
	product_stock INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (ingredient_id) REFERENCES ingredient (id),
	FOREIGN KEY (franchise_id) REFERENCES franchise (id)
);

CREATE TABLE cook (
	user_id INT AUTO_INCREMENT NOT NULL,
	franchise_id INT NOT NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (user_id) REFERENCES user (id),
	FOREIGN KEY (franchise_id) REFERENCES franchise (id)		
);

CREATE TABLE delivery_man (
	user_id INT AUTO_INCREMENT NOT NULL,
	franchise_id INT NOT NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (user_id) REFERENCES user (id),
	FOREIGN KEY (franchise_id) REFERENCES franchise (id)		
);

CREATE TABLE manager (
	user_id INT AUTO_INCREMENT NOT NULL,
	franchise_id INT NOT NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (user_id) REFERENCES user (id),
	FOREIGN KEY (franchise_id) REFERENCES franchise (id)		
);


CREATE TABLE review (
	id INT AUTO_INCREMENT NOT NULL,
	text TEXT NOT NULL,
	user_id INT NOT NULL,
	date DATETIME NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE customer (
	user_id INT AUTO_INCREMENT NOT NULL,
	franchise_id INT NOT NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (user_id) REFERENCES user (id),
	FOREIGN KEY (franchise_id) REFERENCES franchise (id)		
);
	
	
CREATE TABLE customer_order(
	id INT AUTO_INCREMENT NOT NULL,
	user_id INT NOT NULL,
	total_price DECIMAL (5,2),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE order_status(
	id INT AUTO_INCREMENT NOT NULL,
	customer_order_id INT NOT NULL,
	status_id INT NOT NULL,
	status_change DATETIME NOT NULL,
	user_id INT NOT NULL,
	franchise_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (customer_order_id) REFERENCES customer_order (id),
	FOREIGN KEY (user_id) REFERENCES user (id),
	FOREIGN KEY (franchise_id) REFERENCES franchise (id),
	FOREIGN KEY (status_id) REFERENCES status (id)
);

CREATE TABLE shopping_cart(
	customer_order_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity TINYINT NOT NULL,
	FOREIGN KEY (customer_order_id) REFERENCES customer_order (id),
	FOREIGN KEY (product_id) REFERENCES product (id)
);

CREATE TABLE how_to(
    product_id INT NOT NULL,
    how_to TEXT NOT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_id) REFERENCES product (id)
);
    
	