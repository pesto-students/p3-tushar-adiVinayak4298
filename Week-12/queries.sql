INSERT INTO CITIES (CITY, STATE) VALUES ("Pune", "MH");
INSERT INTO CITIES (CITY, STATE) VALUES ("DELHI", "DEL");
-- mysql> SELECT * FROM CITIES;
-- +---------+-------+-------+
-- | CITY_ID | CITY  | STATE |
-- +---------+-------+-------+
-- |       1 | Pune  | MH    |
-- |       3 | DELHI | DEL   |
-- +---------+-------+-------+


INSERT INTO WAREHOUSES (WAREHOUSE_NAME, LOCATION, EXTRA_CONTEXT, CITY_ID)
VALUES ("Warehouse1", "kothrud", '{"pin": "495677", "contact": "78981"}', 1);

INSERT INTO WAREHOUSES (WAREHOUSE_NAME, LOCATION, EXTRA_CONTEXT, CITY_ID)
VALUES ("Warehouse2", "pimpedwadi", '{"pin": "495678", "contact": "78982"}', 1);

INSERT INTO WAREHOUSES (WAREHOUSE_NAME, LOCATION, EXTRA_CONTEXT, CITY_ID)
VALUES ("Warehouse3", "Cp", '{"pin": "110051", "contact": "78983"}', 3);

INSERT INTO WAREHOUSES (WAREHOUSE_NAME, LOCATION, EXTRA_CONTEXT, CITY_ID)
VALUES ("Warehouse4", "khan Market", '{"pin": "110052", "contact": "78984"}', 3);

-- mysql> SELECT * FROM WAREHOUSES;
-- +--------------+----------------+-------------+---------------------------------------+---------+
-- | WAREHOUSE_ID | WAREHOUSE_NAME | LOCATION    | EXTRA_CONTEXT                         | CITY_ID |
-- +--------------+----------------+-------------+---------------------------------------+---------+
-- |            2 | Warehouse1     | kothrud     | {"pin": "495677", "contact": "78981"} |       1 |
-- |            3 | Warehouse2     | pimpedwadi  | {"pin": "495678", "contact": "78982"} |       1 |
-- |            4 | Warehouse3     | Cp          | {"pin": "110051", "contact": "78983"} |       3 |
-- |            5 | Warehouse4     | khan Market | {"pin": "110052", "contact": "78984"} |       3 |
-- +--------------+----------------+-------------+---------------------------------------+---------+


INSERT INTO STORES (STORE_NAME, LOCATION_CITY, WAREHOUSE_ID) VALUES
("Store 1", "Pune", 2),
("Store 2", "PUNE", 2),
("Store 3", "DELHI", 3),
("Store 4", "DELHI", 3),
("Store 5", "DELHI", 5),
("Store 6", "NEW-DELHI", 4);

-- mysql> SELECT * FROM STORES;
-- +----------+------------+---------------+--------------+
-- | STORE_ID | STORE_NAME | LOCATION_CITY | WAREHOUSE_ID |
-- +----------+------------+---------------+--------------+
-- |        1 | Store 1    | Pune          |            2 |
-- |        2 | Store 2    | PUNE          |            2 |
-- |        3 | Store 3    | DELHI         |            3 |
-- |        4 | Store 4    | DELHI         |            3 |
-- |        5 | Store 5    | DELHI         |            5 |
-- |        6 | Store 6    | NEW-DELHI     |            4 |
-- +----------+------------+---------------+--------------+



INSERT INTO CUSTOMERS (CUSTOMER_NAME, ADDR, CUSTOMER_CITY) VALUES
("ADITYA", "CHAWARI BAZAR", "DELHI"),
("VINAYAK", "TILAK NAGAR", "DELHI"),
("VARUN", "KOTHRUD", "PUNE"),
("GANESH", "ANDHERI WEST", "MUMBAI");

-- mysql> SELECT * FROM CUSTOMERS;
-- +-------------+---------------+---------------+---------------+
-- | CUSTOMER_ID | CUSTOMER_NAME | ADDR          | CUSTOMER_CITY |
-- +-------------+---------------+---------------+---------------+
-- |           1 | ADITYA        | CHAWARI BAZAR | DELHI         |
-- |           2 | VINAYAK       | TILAK NAGAR   | DELHI         |
-- |           3 | VARUN         | KOTHRUD       | PUNE          |
-- |           4 | GANESH        | ANDHERI WEST  | MUMBAI        |
-- +-------------+---------------+---------------+---------------+


INSERT INTO ORDERS (ORDER_DATE, CUSTOMER_ID) VALUES
    -> (NOW(), 1),
    -> (NOW(), 2),
    -> (NOW(), 3),
    -> (NOW(), 4),
    -> (NOW(), 1);

-- mysql> SELECT * FROM ORDERS;
-- +----------+---------------------+-------------+
-- | ORDER_ID | ORDER_DATE          | CUSTOMER_ID |
-- +----------+---------------------+-------------+
-- |        1 | 2022-09-21 18:31:01 |           1 |
-- |        2 | 2022-09-21 18:31:01 |           2 |
-- |        3 | 2022-09-21 18:31:01 |           3 |
-- |        4 | 2022-09-21 18:31:01 |           4 |
-- |        5 | 2022-09-21 18:31:01 |           1 |
-- +----------+---------------------+-------------+


INSERT INTO ITEMS (DESCRIPTION, WEIGHT, COST) VALUES
("Rice", 10.00, 500),
("BRUSH", 1, 75),
("FLOUR", 5.00, 200),
("Maggi", 0.500, 25),
("Onions", 5.00, 500),
("Tomatoes", 2.00, 105),
("Salt", 1.00, 45);

-- mysql> SELECT * FROM ITEMS;
-- +---------+-------------+--------+--------+
-- | ITEM_ID | DESCRIPTION | WEIGHT | COST   |
-- +---------+-------------+--------+--------+
-- |       1 | Rice        |  10.00 | 500.00 |
-- |       2 | BRUSH       |   1.00 |  75.00 |
-- |       3 | FLOUR       |   5.00 | 200.00 |
-- |       4 | Maggi       |   0.50 |  25.00 |
-- |       5 | Onions      |   5.00 | 500.00 |
-- |       6 | Tomatoes    |   2.00 | 105.00 |
-- |       7 | Salt        |   1.00 |  45.00 |
-- +---------+-------------+--------+--------+


INSERT INTO ITEMS_ORDERS (ORDERED_QUANTITY, ORDER_ID, ITEM_ID) VALUES
(5, 1, 1),
(10, 2, 2),
(1, 2, 3),
(2, 1, 4),
(3, 1, 5),
(2, 4, 1),
(25, 5, 2),
(8, 3, 3),
(1, 3, 4),
(4, 4, 5);

-- mysql> SELECT * FROM ITEMS_ORDERS;
-- +---------------+------------------+----------+---------+
-- | ITEM_ORDER_ID | ORDERED_QUANTITY | ORDER_ID | ITEM_ID |
-- +---------------+------------------+----------+---------+
-- |             1 |                5 |        1 |       1 |
-- |             2 |               10 |        2 |       2 |
-- |             3 |                1 |        2 |       3 |
-- |             4 |                2 |        1 |       4 |
-- |             5 |                3 |        1 |       5 |
-- |             6 |                2 |        4 |       1 |
-- |             7 |               25 |        5 |       2 |
-- |             8 |                8 |        3 |       3 |
-- |             9 |                1 |        3 |       4 |
-- |            10 |                4 |        4 |       5 |
-- +---------------+------------------+----------+---------+


INSERT INTO STORES_ITEMS (QUANTITY, STORE_ID, ITEM_ID) VALUES
(50, 1, 1),
(100, 2, 2),
(200, 3, 3),
(35, 3, 4),
(500, 4, 5),
(1000, 5, 1),
(500, 6, 2);

-- mysql> SELECT * FROM STORES_ITEMS;
-- +---------------+----------+----------+---------+
-- | STORE_ITEM_ID | QUANTITY | STORE_ID | ITEM_ID |
-- +---------------+----------+----------+---------+
-- |             1 |       50 |        1 |       1 |
-- |             2 |      100 |        2 |       2 |
-- |             3 |      200 |        3 |       3 |
-- |             4 |       35 |        3 |       4 |
-- |             5 |      500 |        4 |       5 |
-- |             6 |     1000 |        5 |       1 |
-- |             7 |      500 |        6 |       2 |
-- +---------------+----------+----------+---------+



-- Assignment
-- Find the item that has minimum weight.
SELECT * FROM ITEMS WHERE WEIGHT = (SELECT MIN(WEIGHT) FROM ITEMS);
-- +---------+-------------+--------+-------+
-- | ITEM_ID | DESCRIPTION | WEIGHT | COST  |
-- +---------+-------------+--------+-------+
-- |       4 | Maggi       |   0.50 | 25.00 |
-- +---------+-------------+--------+-------+


-- Find the different warehouses in “Pune”.
SELECT * FROM WAREHOUSES WHERE CITY_ID = (
    SELECT CITY_ID FROM CITIES WHERE CITY = "Pune"
);
-- +--------------+----------------+------------+---------------------------------------+---------+
-- | WAREHOUSE_ID | WAREHOUSE_NAME | LOCATION   | EXTRA_CONTEXT                         | CITY_ID |
-- +--------------+----------------+------------+---------------------------------------+---------+
-- |            2 | Warehouse1     | kothrud    | {"pin": "495677", "contact": "78981"} |       1 |
-- |            3 | Warehouse2     | pimpedwadi | {"pin": "495678", "contact": "78982"} |       1 |
-- +--------------+----------------+------------+---------------------------------------+---------+


-- Find the details of items ordered by a customer “ADITYA.
SELECT * FROM ITEMS WHERE ITEM_ID IN (
    SELECT ITEM_ID FROM ITEMS_ORDERS WHERE ORDER_ID IN (
        SELECT ORDER_ID FROM ORDERS WHERE CUSTOMER_ID = (
            SELECT CUSTOMER_ID FROM CUSTOMERS WHERE CUSTOMER_NAME LIKE "%ADITYA"
        )
    )
);

-- +---------+-------------+--------+--------+
-- | ITEM_ID | DESCRIPTION | WEIGHT | COST   |
-- +---------+-------------+--------+--------+
-- |       1 | Rice        |  10.00 | 500.00 |
-- |       2 | BRUSH       |   1.00 |  75.00 |
-- |       4 | Maggi       |   0.50 |  25.00 |
-- |       5 | Onions      |   5.00 | 500.00 |
-- +---------+-------------+--------+--------+


-- Find a Warehouse which has maximum stores.
SELECT * FROM WAREHOUSES WHERE WAREHOUSE_ID = (
    SELECT WAREHOUSE_ID FROM STORES WHERE WAREHOUSE_ID = (
        SELECT WAREHOUSE_ID FROM STORES GROUP BY WAREHOUSE_ID ORDER BY COUNT(*) DESC LIMIT 1
    ) LIMIT 1
);
-- +--------------+----------------+----------+---------------------------------------+---------+
-- | WAREHOUSE_ID | WAREHOUSE_NAME | LOCATION | EXTRA_CONTEXT                         | CITY_ID |
-- +--------------+----------------+----------+---------------------------------------+---------+
-- |            2 | Warehouse1     | kothrud  | {"pin": "495677", "contact": "78981"} |       1 |
-- +--------------+----------------+----------+---------------------------------------+---------+


-- Find the detailed orders given by each customer.
SELECT O.ORDER_DATE, I.DESCRIPTION, C.CUSTOMER_NAME, C.CUSTOMER_CITY FROM ORDERS O
INNER JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
INNER JOIN ITEMS_ORDERS IOS ON IOS.ORDER_ID = O.ORDER_ID
INNER JOIN ITEMS I ON I.ITEM_ID = IOS.ITEM_ID
ORDER BY C.CUSTOMER_NAME ASC;
-- +---------------------+-------------+---------------+---------------+
-- | ORDER_DATE          | DESCRIPTION | CUSTOMER_NAME | CUSTOMER_CITY |
-- +---------------------+-------------+---------------+---------------+
-- | 2022-09-21 18:31:01 | Rice        | ADITYA        | DELHI         |
-- | 2022-09-21 18:31:01 | Maggi       | ADITYA        | DELHI         |
-- | 2022-09-21 18:31:01 | Onions      | ADITYA        | DELHI         |
-- | 2022-09-21 18:31:01 | BRUSH       | ADITYA        | DELHI         |
-- | 2022-09-21 18:31:01 | Rice        | GANESH        | MUMBAI        |
-- | 2022-09-21 18:31:01 | Onions      | GANESH        | MUMBAI        |
-- | 2022-09-21 18:31:01 | FLOUR       | VARUN         | PUNE          |
-- | 2022-09-21 18:31:01 | Maggi       | VARUN         | PUNE          |
-- | 2022-09-21 18:31:01 | BRUSH       | VINAYAK       | DELHI         |
-- | 2022-09-21 18:31:01 | FLOUR       | VINAYAK       | DELHI         |
-- +---------------------+-------------+---------------+---------------+


-- Find an item which is ordered for a minimum number of times.
SELECT * FROM ITEMS WHERE ITEM_ID = (
    SELECT ITEM_ID FROM ITEMS_ORDERS GROUP BY ITEM_ID ORDER BY COUNT(*) ASC LIMIT 1
) LIMIT 1;
-- +---------+-------------+--------+--------+
-- | ITEM_ID | DESCRIPTION | WEIGHT | COST   |
-- +---------+-------------+--------+--------+
-- |       3 | FLOUR       |   5.00 | 200.00 |
-- +---------+-------------+--------+--------+
