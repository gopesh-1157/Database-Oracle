SETS AND JOINS

1.

SQL> SELECT ADDRESS_CITY FROM SUPPLIER;

ADDRESS_CITY
--------------------
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR


SQL> SELECT address_city FROM Employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

6 rows selected.

SQL> SELECT address_city FROM Supplier
  2  UNION
  3  SELECT address_city FROM Employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Madurai
VIRUDUNAGAR

2.

SQL> SELECT address_city FROM Supplier
  2  UNION ALL
  3  SELECT address_city FROM Employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

3.

SQL> SELECT address_city FROM Supplier
  2  INTERSECT
  3  SELECT address_city FROM Employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Madurai
VIRUDUNAGAR

4.


SQL> SELECT address_city FROM Supplier
  2  MINUS
  3  SELECT address_city FROM Employee;

no rows selected

5.

SQL> SELECT address_city FROM Employee
  2  MINUS
  3  SELECT address_city FROM Supplier;

no rows selected

6. 


SQL> SELECT * FROM Supplier, Employee;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


30 rows selected.

7.


SQL> SELECT * FROM Supplier CROSS JOIN Employee;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu                   106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    101
Rajesh Kumar         9840123456      Senior Staff              90000

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Nagar           Chennai
Tamil Nadu           rajesh@spares.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    102
Rajesh Kumar         9123456789      Senior Staff              90000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
MG Road              Chennai
Tamil Nadu           rajesh@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    103
Priya Sharma         9123456790      Senior Staff              55000        102

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Anna Salai           Madurai
Tamil Nadu           priya@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    104
Vijay Reddy          9123456791      Senior Staff              50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
Nungambakkam         Madurai
Tamil Nadu           vijay@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    105
Lakshmi Iyer         9123456792      Senior Staff              85000        103

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
T Nagar              Chennai
Tamil Nadu           lakshmi@parts.com


SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
          5 RST Components       rst@mail.com         9876543214 GST005
VIRUDUNAGAR          Koramangala          TAMILNADU                    106
Virat                9123456718      Inventory Clerk           50000        101

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE        EMPLOYEE_ID
-------------------- -------------------- -------------------- -----------
NAME                 PHONE           ROLE                     SALARY MANAGER_ID
-------------------- --------------- -------------------- ---------- ----------
ADDRESS_LOCATION     ADDRESS_CITY
-------------------- --------------------------------------------------
ADDRESS_STATE        MAIL
-------------------- --------------------
t nagar              VIRUDUNAGAR
Tamil Nadu           virat@parts.com


30 rows selected.

8.

SQL> SELECT S.name AS Supplier_Name, E.name AS Employee_Name
  2  FROM Supplier S, Employee E
  3  WHERE S.address_city = E.address_city;

SUPPLIER_NAME        EMPLOYEE_NAME
-------------------- --------------------
ABC Parts Co         Rajesh Kumar
LMN Enterprises      Rajesh Kumar
ABC Parts Co         Ramesh Kumar
LMN Enterprises      Ramesh Kumar
XYZ Traders          Priya 
PQR Supplies         Priya 
XYZ Traders          Vijay Reddy
PQR Supplies         Vijay Reddy
ABC Parts Co         Lakshmi 
LMN Enterprises      Lakshmi 
RST Components       Virat

11 rows selected.

9.

SQL> SELECT * FROM Supplier NATURAL JOIN SupplierBank;

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
BANK_ACCOUNT
------------------------------
          1 ABC Parts Co         abc@mail.com         9876543210 GST001
Chennai              Anna Nagar           Tamil Nadu
ACC001122334

          2 XYZ Traders          xyz@mail.com         9876543211 GST002
Madurai              Andheri              TAMIL NADU
ACC002233445

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
BANK_ACCOUNT
------------------------------

          3 PQR Supplies         pqr@mail.com         9876543212 GST003
Madurai              Connaught Place      TAMIL NADU
ACC003344556

          4 LMN Enterprises      lmn@mail.com         9876543213 GST004
Chennai              T Nagar              Tamil Nadu

SUPPLIER_ID NAME                 EMAIL                PHONE      GST_NUMBER
----------- -------------------- -------------------- ---------- ---------------
ADDRESS_CITY         ADDRESS_LOCATION     ADDRESS_STATE
-------------------- -------------------- --------------------
BANK_ACCOUNT
------------------------------
ACC004455667

10.


SQL> SELECT SA.store_id, SA.location, DR.damage_id, DR.damage_date, DR.quantity
  2  FROM StorageArea SA
  3  LEFT OUTER JOIN DamageRecord DR ON SA.store_id = DR.store_id;

  STORE_ID
----------
LOCATION
--------------------------------------------------------------------------------
 DAMAGE_ID DAMAGE_DA   QUANTITY
---------- --------- ----------
         1
Main Warehouse
         1 20-FEB-26         10

         2
Secondary Store
         2 20-FEB-26          5

11.


SQL> SELECT E.employee_id, E.name, AR.activity_id, AR.activity_type, AR.activity_date
  2  FROM Employee E
  3  LEFT OUTER JOIN ActivityRecord AR ON E.employee_id = AR.employee_id;

EMPLOYEE_ID NAME                 ACTIVITY_ID
----------- -------------------- -----------
ACTIVITY_TYPE                                      ACTIVITY_
-------------------------------------------------- ---------
        102 Rajesh Kumar                   1
Created Sales Order                                20-FEB-26

        103 Priya Sharma                   2
Approved Expense                                   20-FEB-26

        105 Lakshmi Iyer



EMPLOYEE_ID NAME                 ACTIVITY_ID
----------- -------------------- -----------
ACTIVITY_TYPE                                      ACTIVITY_
-------------------------------------------------- ---------
        104 Vijay Reddy


        101 Rajesh Kumar


        106 Virat



6 rows selected.

12.

SQL> SELECT SP.part_id AS Part_id, DR.damage_id, DR.damage_date, DR.quantity
  2  FROM SparePart SP
  3  RIGHT OUTER JOIN DamageRecord DR ON SP.part_id = DR.part_id;

   PART_ID  DAMAGE_ID DAMAGE_DA   QUANTITY
---------- ---------- --------- ----------
       201          1 20-FEB-26         10
       202          2 20-FEB-26          5

13.

SQL> SELECT S.name AS Supplier_Name, S.address_city AS Supplier_City,
  2         E.name AS Employee_Name, E.address_city AS Employee_City
  3  FROM Supplier S
  4  FULL OUTER JOIN Employee E ON S.address_city = E.address_city;

SUPPLIER_NAME        SUPPLIER_CITY        EMPLOYEE_NAME
-------------------- -------------------- --------------------
EMPLOYEE_CITY
--------------------------------------------------
ABC Parts Co         Chennai              Rajesh Kumar
Chennai

LMN Enterprises      Chennai              Rajesh Kumar
Chennai

ABC Parts Co         Chennai              Rajesh Kumar
Chennai


SUPPLIER_NAME        SUPPLIER_CITY        EMPLOYEE_NAME
-------------------- -------------------- --------------------
EMPLOYEE_CITY
--------------------------------------------------
LMN Enterprises      Chennai              Rajesh Kumar
Chennai

XYZ Traders          Madurai              Priya Sharma
Madurai

PQR Supplies         Madurai              Priya Sharma
Madurai


SUPPLIER_NAME        SUPPLIER_CITY        EMPLOYEE_NAME
-------------------- -------------------- --------------------
EMPLOYEE_CITY
--------------------------------------------------
XYZ Traders          Madurai              Vijay Reddy
Madurai

PQR Supplies         Madurai              Vijay Reddy
Madurai

ABC Parts Co         Chennai              Lakshmi Iyer
Chennai


SUPPLIER_NAME        SUPPLIER_CITY        EMPLOYEE_NAME
-------------------- -------------------- --------------------
EMPLOYEE_CITY
--------------------------------------------------
LMN Enterprises      Chennai              Lakshmi Iyer
Chennai

RST Components       VIRUDUNAGAR          Virat
VIRUDUNAGAR


11 rows selected.

14.

SQL> SELECT SA.store_id, SA.location, DR.damage_id, DR.damage_date
  2  FROM StorageArea SA
  3  FULL OUTER JOIN DamageRecord DR ON SA.store_id = DR.store_id;

  STORE_ID
----------
LOCATION
--------------------------------------------------------------------------------
 DAMAGE_ID DAMAGE_DA
---------- ---------
         1
Main Warehouse
         1 20-FEB-26

         2
Secondary Store
         2 20-FEB-26

  STORE_ID
----------
LOCATION
--------------------------------------------------------------------------------
 DAMAGE_ID DAMAGE_DA
---------- ---------

15.

SQL> SELECT E1.name AS Employee_Name, E1.role AS Employee_Role,
  2         E2.name AS Manager_Name, E2.role AS Manager_Role
  3  FROM Employee E1
  4  JOIN Employee E2 ON E1.manager_id = E2.employee_id;

EMPLOYEE_NAME        EMPLOYEE_ROLE        MANAGER_NAME
-------------------- -------------------- --------------------
MANAGER_ROLE
--------------------
Rajesh Kumar         Senior Staff         Rajesh Kumar
Senior Staff

Vijay Reddy          Senior Staff         Rajesh Kumar
Senior Staff

Virat                Inventory Clerk      Rajesh Kumar
Senior Staff


EMPLOYEE_NAME        EMPLOYEE_ROLE        MANAGER_NAME
-------------------- -------------------- --------------------
MANAGER_ROLE
--------------------
Priya Sharma         Senior Staff         Rajesh Kumar
Senior Staff

Lakshmi Iyer         Senior Staff         Priya Sharma
Senior Staff

16.

SQL> SELECT E1.name AS Employee1, E1.role, E2.name AS Employee2
  2  FROM Employee E1
  3  JOIN Employee E2 ON E1.role = E2.role
  4  WHERE E1.employee_id < E2.employee_id;

EMPLOYEE1            ROLE                 EMPLOYEE2
-------------------- -------------------- --------------------
Rajesh Kumar         Senior Staff         Rajesh Kumar
Rajesh Kumar         Senior Staff         Priya Sharma
Rajesh Kumar         Senior Staff         Priya Sharma
Rajesh Kumar         Senior Staff         Vijay Reddy
Rajesh Kumar         Senior Staff         Vijay Reddy
Priya Sharma         Senior Staff         Vijay Reddy
Rajesh Kumar         Senior Staff         Lakshmi Iyer
Rajesh Kumar         Senior Staff         Lakshmi Iyer
Priya Sharma         Senior Staff         Lakshmi Iyer
Vijay Reddy          Senior Staff         Lakshmi Iyer

10 rows selected.

17.



