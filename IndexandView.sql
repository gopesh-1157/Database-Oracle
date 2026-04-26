INDEX AND VIEWS 

1.

SQL> CREATE VIEW employee_role_view AS
  2  SELECT name, role FROM Employee;

View created.

SQL> select * from employee_role_view;

NAME                 ROLE
-------------------- --------------------
Rajesh Kumar         Senior Staff
Rajesh Kumar         Senior Staff
Priya Sharma         Senior Staff
Vijay Reddy          Senior Staff
Lakshmi Iyer         Senior Staff
Virat                Inventory Clerk

6 rows selected.

2.

SQL> select name,address_city from employee;

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Rajesh Kumar         Chennai
Rajesh Kumar         Chennai
Priya Sharma         Madurai
Vijay Reddy          Madurai
Lakshmi Iyer         Chennai
Virat                VIRUDUNAGAR

6 rows selected.

SQL> CREATE VIEW employeeMadurai AS
  2  SELECT name, role, address_city
  3  FROM Employee
  4  WHERE address_city = 'Madurai';

View created.

SQL> SELECT * FROM EMPLOYEEMADURAI;

NAME                 ROLE
-------------------- --------------------
ADDRESS_CITY
--------------------------------------------------
Priya Sharma         Senior Staff
Madurai

Vijay Reddy          Senior Staff
Madurai

3.


SQL> CREATE VIEW salesemployee_info AS
  2  SELECT
  3      so.sales_id,
  4      e.name       AS employee_name,
  5      e.role,
  6      so.total_amount,
  7      so.final_amount
  8  FROM SalesOrder so
  9  JOIN Employee e ON so.employee_id = e.employee_id;

View created.

SQL> select * from salesemployee_info;

  SALES_ID EMPLOYEE_NAME        ROLE                 TOTAL_AMOUNT FINAL_AMOUNT
---------- -------------------- -------------------- ------------ ------------
         1 Rajesh Kumar         Senior Staff                10000        11800
         2 Rajesh Kumar         Senior Staff                15000        17700
         3 Lakshmi Iyer         Senior Staff                 8000         9440
         4 Vijay Reddy          Senior Staff                12000        14160
         5 Rajesh Kumar         Senior Staff                 5000         5900

4.

SQL> CREATE VIEW totalsales AS
  2  SELECT
  3      e.name         AS employee_name,
  4      COUNT(so.sales_id)   AS total_orders,
  5      SUM(so.final_amount) AS total_sales_amount
  6  FROM Employee e
  7  JOIN SalesOrder so ON e.employee_id = so.employee_id
  8  GROUP BY e.name;

View created.

SQL>
SQL> select * from totalsales;

EMPLOYEE_NAME        TOTAL_ORDERS TOTAL_SALES_AMOUNT
-------------------- ------------ ------------------
Rajesh Kumar                    3              35400
Lakshmi Iyer                    1               9440
Vijay Reddy                     1              14160

5.


SQL> CREATE VIEW topemployees AS
  2  SELECT employee_name, total_orders, total_sales_amount
  3  FROM EMP_TOTALSALES
  4  WHERE total_sales_amount > 10000;

View created.

SQL> select * from topemployees;

EMPLOYEE_NAME        TOTAL_ORDERS TOTAL_SALES_AMOUNT
-------------------- ------------ ------------------
Rajesh Kumar                    3              35400
Vijay Reddy                     1              14160

6.


SQL> create  view c1 as select * from supplier;

View created.

SQL> select * from c1;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          1 Auto Parts India     contact@api.com      9876543210 GST123456
VIRUDHUNAGAR         T Nagar              Tamil Nadu

          2 Brake Masters Ltd    info@brake.com       9876543211 GST234567
CHennai              RS Puram             Tamil Nadu

          3 Engine Parts Co      sales@engine.com     9876543212 GST345678
Madurai              Anna Nagar           Tamil Nadu


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          4 Battery Solutions    support@battery.com  9876543213 GST456789
Chennai              Cantonment           Tamil Nadu


SQL> select * from supplier;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          1 Auto Parts India     contact@api.com      9876543210 GST123456
VIRUDHUNAGAR         T Nagar              Tamil Nadu

          2 Brake Masters Ltd    info@brake.com       9876543211 GST234567
CHennai              RS Puram             Tamil Nadu

          3 Engine Parts Co      sales@engine.com     9876543212 GST345678
Madurai              Anna Nagar           Tamil Nadu


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          4 Battery Solutions    support@battery.com  9876543213 GST456789
Chennai              Cantonment           Tamil Nadu


SQL> update c1 set address_city='Madurai' where SUPPLIER_ID=1;

1 row updated.

SQL> select * from c1;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          1 Auto Parts India     contact@api.com      9876543210 GST123456
Madurai              T Nagar              Tamil Nadu

          2 Brake Masters Ltd    info@brake.com       9876543211 GST234567
CHennai              RS Puram             Tamil Nadu

          3 Engine Parts Co      sales@engine.com     9876543212 GST345678
Madurai              Anna Nagar           Tamil Nadu


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          4 Battery Solutions    support@battery.com  9876543213 GST456789
Chennai              Cantonment           Tamil Nadu


SQL> select * from supplier;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          1 Auto Parts India     contact@api.com      9876543210 GST123456
Madurai              T Nagar              Tamil Nadu

          2 Brake Masters Ltd    info@brake.com       9876543211 GST234567
CHennai              RS Puram             Tamil Nadu

          3 Engine Parts Co      sales@engine.com     9876543212 GST345678
Madurai              Anna Nagar           Tamil Nadu


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
          4 Battery Solutions    support@battery.com  9876543213 GST456789
Chennai              Cantonment           Tamil Nadu


SQL> SELECT COUNT(*) FROM SUPPLIER;

  COUNT(*)
----------
         4

SQL> SELECT COUNT(*) FROM C1;

  COUNT(*)
----------
         4


SQL> INSERT INTO C1 VALUES (5,'TAILOR LIMITED','tailor@limited.com',9875634321,'GST347865','Chennai','T nagar','tamilnadu');

1 row created.

SQL> SELECT COUNT(*) FROM C1;

  COUNT(*)
----------
         5

SQL> SELECT COUNT(*) FROM SUPPLIER;

  COUNT(*)
----------
         5


7.

SQL> create view c2 as select address_city,count(*) as city_count from c1 group by address_city;

View created.

Elapsed: 00:00:00.00
SQL> select * from c2;

ADDRESS_CITY         CITY_COUNT
-------------------- ----------
Madurai                       2
CHennai                       1
Chennai                       2

Elapsed: 00:00:00.00
SQL> set timing off;
SQL> update c2 set address_city ='madurai' where address_city='Madurai';
update c2 set address_city ='madurai' where address_city='Madurai'
       *
ERROR at line 1:
ORA-01732: data manipulation operation not legal on this view


8.


SQL> create view dd as select address_city from supplier order by address_city;

View created.

SQL> insert into dd(address_city) values('madurai');
insert into dd(address_city) values('madurai')
*
ERROR at line 1:
ORA-01400: cannot insert NULL into ("SYSTEM"."SUPPLIER"."SUPPLIER_ID")

9.

SQL> CREATE INDEX in1 ON Employee(address_city);

Index created.

Elapsed: 00:00:00.02
SQL> SELECT address_city, COUNT(*) FROM Employee GROUP BY address_city;

ADDRESS_CITY                                         COUNT(*)
-------------------------------------------------- ----------
Chennai                                                     3
Madurai                                                     2
VIRUDUNAGAR                                                 1

Elapsed: 00:00:00.01

10 .

SQL> CREATE UNIQUE INDEX i2 ON Supplier(email);

Index created.

Elapsed: 00:00:00.00

11.

SQL> CREATE BITMAP INDEX i3 ON Employee(role);

Index created.

Elapsed: 00:00:00.01

12.

SQL> CREATE INDEX i4 ON Employee(address_city, role);

Index created.

Elapsed: 00:00:00.01

SQL> SELECT * FROM Employee WHERE address_city = 'Madurai' AND role = 'Senior Staff';

EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        103 Priya Sharma         9123456790      Senior Staff              55000
       102 Anna Salai
Madurai                                            Tamil Nadu
priya@parts.com


EMPLOYEE_ID NAME                 PHONE           ROLE                     SALARY
----------- -------------------- --------------- -------------------- ----------
MANAGER_ID ADDRESS_LOCATION
---------- --------------------
ADDRESS_CITY                                       ADDRESS_STATE
-------------------------------------------------- --------------------
MAIL
--------------------
        104 Vijay Reddy          9123456791      Senior Staff              50000
       101 Nungambakkam
Madurai                                            Tamil Nadu
vijay@parts.com


Elapsed: 00:00:00.01

13.

SQL>CREATE INDEX I5 ON Supplier(LOWER(email));

Index created.

Elapsed: 00:00:00.03

14.

SQL> CREATE INDEX I6 ON Employee(UPPER(name));

Index created.

Elapsed: 00:00:00.00

15.

SQL> CREATE INDEX I7 ON ExpenseRecord(type);

Index created.

Elapsed: 00:00:00.00
