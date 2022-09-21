

CREATE DATABASE IF NOT EXISTS WAREHOUSE;

USE WAREHOUSE;


-- cities table
CREATE TABLE IF NOT EXISTS CITIES(
    CITY_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CITY CHAR(20) NOT NULL,
    STATE CHAR(20) NOT NULL
);

-- DESCRIBE CITIES;
-- +---------+----------+------+-----+---------+----------------+
-- | Field   | Type     | Null | Key | Default | Extra          |
-- +---------+----------+------+-----+---------+----------------+
-- | CITY_ID | int(11)  | NO   | PRI | NULL    | auto_increment |
-- | CITY    | char(20) | NO   |     | NULL    |                |
-- | STATE   | char(20) | NO   |     | NULL    |                |
-- +---------+----------+------+-----+---------+----------------+

-- Warehouses table
CREATE TABLE IF NOT EXISTS WAREHOUSES(
    WAREHOUSE_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    WAREHOUSE_NAME CHAR(30) NOT NULL,
    LOCATION CHAR(20) NOT NULL,
    EXTRA_CONTEXT JSON,
    CITY_ID INTEGER NOT NULL,
    FOREIGN KEY (CITY_ID) REFERENCES CITIES(CITY_ID)
);

-- DESCRIBE WARSTORESEHOUSES;
-- +----------------+----------+------+-----+---------+----------------+
-- | Field          | Type     | Null | Key | Default | Extra          |
-- +----------------+----------+------+-----+---------+----------------+
-- | WAREHOUSE_ID   | int(11)  | NO   | PRI | NULL    | auto_increment |
-- | WAREHOUSE_NAME | char(30) | NO   |     | NULL    |                |
-- | LOCATION       | char(20) | NO   |     | NULL    |                |
-- | EXTRA_CONTEXT  | json     | YES  |     | NULL    |                |
-- | CITY_ID        | int(11)  | NO   | MUL | NULL    |                |
-- +----------------+----------+------+-----+---------+----------------+

-- STORES table
CREATE TABLE IF NOT EXISTS STORES(
    STORE_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    STORE_NAME CHAR(20) NOT NULL,
    LOCATION_CITY CHAR(20) NOT NULL,
    WAREHOUSE_ID INTEGER NOT NULL,
    FOREIGN KEY (WAREHOUSE_ID) REFERENCES WAREHOUSES(WAREHOUSE_ID)
);

-- DESCRIBE STORES;
-- +---------------+----------+------+-----+---------+----------------+
-- | Field         | Type     | Null | Key | Default | Extra          |
-- +---------------+----------+------+-----+---------+----------------+
-- | STORE_ID      | int(11)  | NO   | PRI | NULL    | auto_increment |
-- | STORE_NAME    | char(20) | NO   |     | NULL    |                |
-- | LOCATION_CITY | char(20) | NO   |     | NULL    |                |
-- | WAREHOUSE_ID  | int(11)  | NO   | MUL | NULL    |                |
-- +---------------+----------+------+-----+---------+----------------+


-- CUSTOMERS table
CREATE TABLE IF NOT EXISTS CUSTOMERS(
    CUSTOMER_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_NAME CHAR(50) NOT NULL,
    ADDR VARCHAR(50) NOT NULL,
    CUSTOMER_CITY CHAR(20) NOT NULL
);

-- DESCRIBE CUSTOMERS;
-- +---------------+-------------+------+-----+---------+----------------+
-- | Field         | Type        | Null | Key | Default | Extra          |
-- +---------------+-------------+------+-----+---------+----------------+
-- | CUSTOMER_ID   | int(11)     | NO   | PRI | NULL    | auto_increment |
-- | CUSTOMER_NAME | char(50)    | NO   |     | NULL    |                |
-- | ADDR          | varchar(50) | NO   |     | NULL    |                |
-- | CUSTOMER_CITY | char(20)    | NO   |     | NULL    |                |
-- +---------------+-------------+------+-----+---------+----------------+


-- ORDERS table
CREATE TABLE IF NOT EXISTS ORDERS(
    ORDER_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ORDER_DATE DATETIME NOT NULL,
    CUSTOMER_ID INTEGER NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);
-- DESCRIBE ORDERS;
-- +-------------+----------+------+-----+---------+----------------+
-- | Field       | Type     | Null | Key | Default | Extra          |
-- +-------------+----------+------+-----+---------+----------------+
-- | ORDER_ID    | int(11)  | NO   | PRI | NULL    | auto_increment |
-- | ORDER_DATE  | datetime | NO   |     | NULL    |                |
-- | CUSTOMER_ID | int(11)  | NO   | MUL | NULL    |                |
-- +-------------+----------+------+-----+---------+----------------+


-- ITEMS table
CREATE TABLE IF NOT EXISTS ITEMS(
    ITEM_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    DESCRIPTION TEXT NOT NULL,
    WEIGHT DECIMAL(5, 2) NOT NULL,
    COST DECIMAL(5, 2) NOT NULL
);

--DESCRIBE ITEMS
-- +-------------+--------------+------+-----+---------+----------------+
-- | Field       | Type         | Null | Key | Default | Extra          |
-- +-------------+--------------+------+-----+---------+----------------+
-- | ITEM_ID     | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | DESCRIPTION | text         | NO   |     | NULL    |                |
-- | WEIGHT      | decimal(5,2) | NO   |     | NULL    |                |
-- | COST        | decimal(5,2) | NO   |     | NULL    |                |
-- +-------------+--------------+------+-----+---------+----------------+


-- ITEMS_ORDERS table
CREATE TABLE IF NOT EXISTS ITEMS_ORDERS(
    ITEM_ORDER_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ORDERED_QUANTITY INTEGER NOT NULL,
    ORDER_ID INTEGER NOT NULL,
    ITEM_ID INTEGER NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (ITEM_ID) REFERENCES ITEMS(ITEM_ID)
);

-- mysql> DESCRIBE ITEMS_ORDERS;
-- +------------------+---------+------+-----+---------+----------------+
-- | Field            | Type    | Null | Key | Default | Extra          |
-- +------------------+---------+------+-----+---------+----------------+
-- | ITEM_ORDER_ID    | int(11) | NO   | PRI | NULL    | auto_increment |
-- | ORDERED_QUANTITY | int(11) | NO   |     | NULL    |                |
-- | ORDER_ID         | int(11) | NO   | MUL | NULL    |                |
-- | ITEM_ID          | int(11) | NO   | MUL | NULL    |                |
-- +------------------+---------+------+-----+---------+----------------+


-- STORES_ITEMS table
CREATE TABLE IF NOT EXISTS STORES_ITEMS(
    STORE_ITEM_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    QUANTITY INTEGER NOT NULL,
    STORE_ID INTEGER NOT NULL,
    ITEM_ID INTEGER NOT NULL,
    FOREIGN KEY (STORE_ID) REFERENCES STORES(STORE_ID),
    FOREIGN KEY (ITEM_ID) REFERENCES ITEMS(ITEM_ID)
);

-- mysql> DESCRIBE STORES_ITEMS;
-- +---------------+---------+------+-----+---------+----------------+
-- | Field         | Type    | Null | Key | Default | Extra          |
-- +---------------+---------+------+-----+---------+----------------+
-- | STORE_ITEM_ID | int(11) | NO   | PRI | NULL    | auto_increment |
-- | QUANTITY      | int(11) | NO   |     | NULL    |                |
-- | STORE_ID      | int(11) | NO   | MUL | NULL    |                |
-- | ITEM_ID       | int(11) | NO   | MUL | NULL    |                |
-- +---------------+---------+------+-----+---------+----------------+
