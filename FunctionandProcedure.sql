Function 

1.COUNT TOTAL ROWS IN Employee

SQL> CREATE OR REPLACE FUNCTION c_count RETURN NUMBER
  2      IS
  3          c NUMBER;
  4      BEGIN
  5          SELECT COUNT(*) INTO c FROM Employee;
  6          RETURN c;
  7      EXCEPTION
  8          WHEN OTHERS THEN RETURN 0;
  9      END c_count;
 10     /

Function created.

SQL> BEGIN
  2         DBMS_OUTPUT.PUT_LINE(c_count);
  3     END;
  4     /
10

PL/SQL procedure successfully completed.

2.

SQL> CREATE OR REPLACE FUNCTION av_salary RETURN NUMBER
  2      IS
  3          num NUMBER;
  4      BEGIN
  5         SELECT COUNT(*) INTO num FROM Employee
  6          WHERE salary > (SELECT AVG(salary) FROM Employee);
  7          RETURN num;
  8      EXCEPTION
  9          WHEN OTHERS THEN RETURN NULL;
 10     END av_salary;
 11     /

Function created.

SQL>  BEGIN
  2          DBMS_OUTPUT.PUT_LINE('COUNT: ' || av_salary);
  3     END;
  4     /
COUNT: 6

PL/SQL procedure successfully completed.

SQL>  SELECT COUNT(*) FROM Employee WHERE salary > (SELECT AVG(salary) FROM Employee);

  COUNT(*)
----------
         6

3.


SQL> CREATE OR REPLACE FUNCTION r_name(id IN NUMBER) RETURN VARCHAR2
  2      IS
  3          v_name VARCHAR2(30);
  4      BEGIN
  5          SELECT name INTO v_name FROM Employee WHERE employee_id = id;
  6          RETURN v_name;
  7      EXCEPTION
  8          WHEN OTHERS THEN RETURN NULL;
  9      END r_name;
 10     /

Function created.

SQL> DECLARE
  2          n NUMBER;
  3      BEGIN
  4         n := &n;
  5          DBMS_OUTPUT.PUT_LINE('NAME OF ' || n || ' IS ' || r_name(n));
  6      END;
  7      /
Enter value for n: 106
old   4:        n := &n;
new   4:        n := 106;
NAME OF 106 IS Virat

PL/SQL procedure successfully completed.

4.

SQL> CREATE OR REPLACE FUNCTION get_employee_salary (
  2          p_employee_id IN NUMBER
  3      ) RETURN NUMBER
  4      IS
  5          v_salary NUMBER;
  6      BEGIN
  7          SELECT salary INTO v_salary
  8          FROM Employee
  9          WHERE employee_id = p_employee_id;
 10
 11         RETURN v_salary;
 12     EXCEPTION
 13        WHEN NO_DATA_FOUND THEN
 14             RETURN 0;
 15         WHEN OTHERS THEN
 16             RETURN NULL;
 17     END get_employee_salary;
 18     /

Function created

SQL>  BEGIN
  2         DBMS_OUTPUT.PUT_LINE('Salary: ' || get_employee_salary(106));
  3      END;
  4      /
Salary: 50000

PL/SQL procedure successfully completed.

5.


SQL>  CREATE OR REPLACE FUNCTION city_count(city IN VARCHAR2, sal IN NUMBER) RETURN NUMBER
  2      IS
  3          n NUMBER;
  4      BEGIN
  5          SELECT COUNT(*) INTO n FROM Employee
  6        WHERE address_city = city AND salary > sal;
  7          RETURN n;
  8     EXCEPTION
  9         WHEN OTHERS THEN RETURN 0;
 10    END city_count;
 11     /

Function created.

SQL> select salary,address_city from employee;

    SALARY ADDRESS_CITY
---------- --------------------------------------------------
     95000 Chennai
     93000 Chennai
     70000 Madurai
     50000 Madurai
     85000 Chennai
     50000 VIRUDUNAGAR
     35000 TRICHY
     35000 MADURAI
     70000 CHENNAI
     72000 CHENNAI

10 rows selected.

SQL>  DECLARE
  2          sal NUMBER;
  3      BEGIN
  4          sal := &sal;
  5         DBMS_OUTPUT.PUT_LINE('NUMBER OF EMPLOYEES IN CHENNAI WITH SALARY > ' || sal
  6                              || ' IS ' || city_count('CHENNAI', sal));
  7      END;
  8      /
Enter value for sal: 70000
old   4:         sal := &sal;
new   4:         sal := 70000;
NUMBER OF EMPLOYEES IN CHENNAI WITH SALARY > 70000 IS 1

PL/SQL procedure successfully completed.

6.

SQL> CREATE OR REPLACE FUNCTION r_row(id IN NUMBER) RETURN Employee%ROWTYPE
  2      IS
  3          row Employee%ROWTYPE;
  4      BEGIN
  5          SELECT * INTO row FROM Employee WHERE employee_id = id;
  6          RETURN row;
  7     EXCEPTION
  8          WHEN OTHERS THEN RETURN NULL;
  9      END r_row;
 10     /

Function created.

SQL>
SQL> DECLARE
  2          n   NUMBER;
  3          ans Employee%ROWTYPE;
  4      BEGIN
  5          n   := &n;
  6         ans := r_row(n);
  7          DBMS_OUTPUT.PUT_LINE('NAME: ' || ans.name ||
  8                               '  SALARY: ' || ans.salary ||
  9                               '  CITY: '   || ans.address_city);
 10     END;
 11     /
Enter value for n: 106
old   5:         n   := &n;
new   5:         n   := 106;
NAME: Virat   SALARY: 50000  CITY: VIRUDUNAGAR

PL/SQL procedure successfully completed.

7.

SQL>  CREATE OR REPLACE FUNCTION f1 RETURN SYS_REFCURSOR
  2    IS
  3          c_cursor SYS_REFCURSOR;
  4     BEGIN
  5          OPEN c_cursor FOR SELECT name, employee_id FROM Employee;
  6          RETURN c_cursor;
  7      END f1;
  8      /

Function created.

SQL> DECLARE
  2          ans     SYS_REFCURSOR;
  3          v_name  VARCHAR2(30);
  4          id      NUMBER;
  5     BEGIN
  6          ans := f1;
  7          LOOP
  8              FETCH ans INTO v_name, id;
  9              DBMS_OUTPUT.PUT_LINE('NAME: ' || v_name || '  EMPLOYEE ID: ' || id);
 10             EXIT WHEN ans%NOTFOUND;
 11         END LOOP;
 12     END;
 13     /
NAME: Rajesh Kumar  EMPLOYEE ID: 101
NAME: Rajesh Kumar  EMPLOYEE ID: 102
NAME: Priya Sharma  EMPLOYEE ID: 103
NAME: Vijay Reddy  EMPLOYEE ID: 104
NAME: Lakshmi Iyer  EMPLOYEE ID: 105
NAME: Virat   EMPLOYEE ID: 106
NAME: SURESH  EMPLOYEE ID: 10
NAME: rathinam  EMPLOYEE ID: 7
NAME: Dhoni  EMPLOYEE ID: 108
NAME: light  EMPLOYEE ID: 8
NAME: light  EMPLOYEE ID: 8

PL/SQL procedure successfully completed.

8.

SQL>  CREATE OR REPLACE FUNCTION sum_recur(n IN NUMBER) RETURN NUMBER
  2      IS
  3      BEGIN
  4          IF n <= 0 THEN
  5             RETURN 0;
  6          ELSE
  7              RETURN n + sum_recur(n - 1);
  8          END IF;
  9     END sum_recur;
 10     /

Function created.

SQL> DECLARE
  2          n NUMBER;
  3      BEGIN
  4          n := &n;
  5         DBMS_OUTPUT.PUT_LINE('SUM OF N NUMBER: ' || sum_recur(n));
  6      END;
  7      /
Enter value for n: 5
old   4:         n := &n;
new   4:         n := 5;
SUM OF N NUMBER: 15

PL/SQL procedure successfully completed.

9.

SQL> CREATE OR REPLACE FUNCTION get_sales_by_employee (
  2          p_employee_id IN NUMBER
  3      ) RETURN SYS_REFCURSOR
  4      IS
  5          v_cursor SYS_REFCURSOR;
  6      BEGIN
  7          OPEN v_cursor FOR
  8              SELECT * FROM SalesOrder
  9              WHERE employee_id = p_employee_id;
 10
 11        RETURN v_cursor;
 12     END get_sales_by_employee;
 13     /

Function created.


SQL> DECLARE
  2          v_cursor     SYS_REFCURSOR;
  3          v_sales_id   SalesOrder.sales_id%TYPE;
  4          v_cust_id    SalesOrder.customer_id%TYPE;
  5          v_emp_id     SalesOrder.employee_id%TYPE;
  6         v_total      SalesOrder.total_amount%TYPE;
  7         v_tax        SalesOrder.tax_amount%TYPE;
  8          v_final      SalesOrder.final_amount%TYPE;
  9      BEGIN
 10         v_cursor := get_sales_by_employee(102);
 11         LOOP
 12             FETCH v_cursor INTO v_sales_id, v_cust_id, v_emp_id, v_total, v_tax, v_final;
 13             EXIT WHEN v_cursor%NOTFOUND;
 14
 15             DBMS_OUTPUT.PUT_LINE('Sales ID      : ' || v_sales_id);
 16             DBMS_OUTPUT.PUT_LINE('Customer ID   : ' || v_cust_id);
 17             DBMS_OUTPUT.PUT_LINE('Total Amount  : ' || v_total);
 18             DBMS_OUTPUT.PUT_LINE('Final Amount  : ' || v_final);
 19             DBMS_OUTPUT.PUT_LINE('----------------------');
 20         END LOOP;
 21
 22         CLOSE v_cursor;
 23     END;
 24     /
Sales ID      : 2
Customer ID   : 2
Total Amount  : 15000
Final Amount  : 17700
----------------------
Sales ID      : 5
Customer ID   : 5
Total Amount  : 5000
Final Amount  : 5900
----------------------
10.

SQL> CREATE OR REPLACE FUNCTION get_final_amount(p_sales_id IN NUMBER)
  2      RETURN NUMBER
  3      IS
  4          v_amount NUMBER;
  5      BEGIN
  6          SELECT final_amount INTO v_amount
  7          FROM SalesOrder
  8          WHERE sales_id = p_sales_id;
  9          RETURN v_amount;
 10     EXCEPTION
 11         WHEN NO_DATA_FOUND THEN
 12             DBMS_OUTPUT.PUT_LINE('Error: Sales ID not found.');
 13             RETURN 0;
 14         WHEN OTHERS THEN
 15             DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
 16             RETURN NULL;
 17     END get_final_amount;
 18    /

Function created.

SQL>  BEGIN
  2         DBMS_OUTPUT.PUT_LINE('Final Amount: ' || get_final_amount(106));
  3      END;
  4      /
Error: Sales ID not found.
Final Amount: 0

PL/SQL procedure successfully completed.

SQL>    BEGIN
  2             DBMS_OUTPUT.PUT_LINE('Final Amount: ' || get_final_amount(1));
  3          END;
  4          /
Final Amount: 11800

PL/SQL procedure successfully completed.

PROCEDURE

11.

SQL> SELECT * FROM Employee WHERE employee_id = 109;

no rows selected

SQL> CREATE OR REPLACE PROCEDURE p1
  2  IS
  3  BEGIN
  4      INSERT INTO Employee(employee_id, name, salary)
  5      VALUES(109, 'rohit', 25000);
  6  END p1;
  7  /

Procedure created.

SQL>  EXEC p1;
New row inserted name: rohit
New employee inserted with employee ID: 109

PL/SQL procedure successfully completed.

SQL> SELECT employee_id, name FROM Employee WHERE employee_id =109;

EMPLOYEE_ID NAME
----------- --------------------
        109 Rohit

12.

SQL>    CREATE OR REPLACE PROCEDURE hello
  2      IS
  3     BEGIN
  4          DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
  5      END hello;
  6      /

Procedure created.

SQL> EXEC hello;
HELLO WORLD

PL/SQL procedure successfully completed.

13.
SQL> CREATE OR REPLACE PROCEDURE p2(
  2      id IN NUMBER,
  3      name IN VARCHAR2,
  4      sal IN NUMBER
  5  )
  6  IS
  7  BEGIN
  8      INSERT INTO Employee(employee_id, name, salary)
  9      VALUES(id, name, sal);
 10  END p2;
 11  /

Procedure created.

SQL> EXEC p2(110, 'gill',85000);
New row inserted name: gill
New employee inserted with employee ID: 110

PL/SQL procedure successfully completed.

SQL> SELECT employee_id, name FROM Employee WHERE employee_id = 110;

EMPLOYEE_ID NAME
----------- --------------------
        110 gill

14.

SQL> CREATE OR REPLACE PROCEDURE get_employee_info(
  2          p_employee_id IN  NUMBER,
  3          p_name        OUT VARCHAR2,
  4          p_role        OUT VARCHAR2
  5      )
  6      IS
  7      BEGIN
  8          SELECT name, role INTO p_name, p_role
  9          FROM Employee
 10         WHERE employee_id = p_employee_id;
 11     END get_employee_info;
 12     /

Procedure created.

SQL>  DECLARE
  2          v_name VARCHAR2(30);
  3          v_role VARCHAR2(50);
  4      BEGIN
  5         get_employee_info(106, v_name, v_role);
  6         DBMS_OUTPUT.PUT_LINE('Name : ' || v_name);
  7         DBMS_OUTPUT.PUT_LINE('Role : ' || v_role);
  8      END;
  9      /
Name : Virat
Role : Inventory Clerk

PL/SQL procedure successfully completed.

15.
SQL>  CREATE OR REPLACE PROCEDURE p3(id IN NUMBER, empname OUT VARCHAR2)
  2      IS
  3      BEGIN
  4          SELECT name INTO empname FROM Employee WHERE employee_id = id;
  5      END p3;
  6      /

Procedure created.

SQL> DECLARE
  2          id      NUMBER;
  3          empname VARCHAR2(30);
  4      BEGIN
  5          id := &id;
  6          p3(id, empname);
  7          DBMS_OUTPUT.PUT_LINE('NAME: ' || empname);
  8    END;
  9     /
Enter value for id: 106
old   5:         id := &id;
new   5:         id := 106;
NAME: Virat

PL/SQL procedure successfully completed.

16.

SQL> CREATE OR REPLACE PROCEDURE p4(id IN OUT NUMBER, empname IN OUT VARCHAR2)
  2      IS
  3     BEGIN
  4        SELECT salary, address_city INTO id, empname
  5         FROM Employee
  6          WHERE employee_id = id AND name = empname;
  7     END p4;
  8     /

Procedure created.

SQL> DECLARE
  2          id      NUMBER;
  3          empname VARCHAR2(30);
  4      BEGIN
  5          id      := &id;
  6          empname := &empname;
  7          p4(id, empname);
  8          DBMS_OUTPUT.PUT_LINE('SALARY: ' || id || '  CITY: ' || empname);
  9      END;
 10     /
Enter value for id: 106
old   5:         id      := &id;
new   5:         id      := 106;
Enter value for empname: 'Virat '
old   6:         empname := &empname;
new   6:         empname := 'Virat ';
SALARY: 50000  CITY: VIRUDUNAGAR

PL/SQL procedure successfully completed.

17.

SQL>  CREATE OR REPLACE PROCEDURE fact(n IN OUT NUMBER)
  2      IS
  3          ans NUMBER := 1;
  4     BEGIN
  5          WHILE n > 0 LOOP
  6             ans := ans * n;
  7             n   := n - 1;
  8          END LOOP;
  9          n := ans;
 10     END fact;
 11     /

Procedure created.

SQL>  DECLARE
  2          num NUMBER;
  3      BEGIN
  4          num := &num;
  5          DBMS_OUTPUT.PUT('FACTORIAL OF NUMBER ' || num || ' IS ');
  6          fact(num);
  7          DBMS_OUTPUT.PUT_LINE(num);
  8      END;
  9      /
Enter value for num: 5
old   4:         num := &num;
new   4:         num := 5;
FACTORIAL OF NUMBER 5 IS 120

PL/SQL procedure successfully completed.

18.

SQL>  CREATE OR REPLACE PROCEDURE p5(c_cursor OUT SYS_REFCURSOR)
  2      IS
  3      BEGIN
  4          OPEN c_cursor FOR SELECT name, salary FROM Employee;
  5      END p5;
  6      /

Procedure created.

SQL> DECLARE
  2          v_cursor SYS_REFCURSOR;
  3          empname  VARCHAR2(30);
  4          sal      NUMBER;
  5      BEGIN
  6          p5(v_cursor);
  7          LOOP
  8              FETCH v_cursor INTO empname, sal;
  9              EXIT WHEN v_cursor%NOTFOUND;
 10             DBMS_OUTPUT.PUT_LINE('NAME: ' || empname || '  SALARY: ' || sal);
 11         END LOOP;
 12     END;
 13     /
NAME: Rajesh Kumar  SALARY: 95000
NAME: Rajesh Kumar  SALARY: 93000
NAME: Priya Sharma  SALARY: 70000
NAME: Vijay Reddy  SALARY: 50000
NAME: Lakshmi Iyer  SALARY: 85000
NAME: Virat   SALARY: 50000
NAME: SURESH  SALARY: 35000
NAME: rathinam  SALARY: 35000
NAME: Dhoni  SALARY: 70000
NAME: light  SALARY: 72000
NAME: rohit  SALARY: 25000
NAME: gill  SALARY: 85000

PL/SQL procedure successfully completed.

19.

SQL> CREATE OR REPLACE PROCEDURE five(c_cursor OUT SYS_REFCURSOR)
  2      IS
  3      BEGIN
  4          OPEN c_cursor FOR SELECT name FROM Employee FETCH FIRST 5 ROWS ONLY;
  5      END five;
  6      /

Procedure created.

SQL> DECLARE
  2          v_cursor SYS_REFCURSOR;
  3          empname  VARCHAR2(30);
  4      BEGIN
  5          five(v_cursor);
  6          LOOP
  7              FETCH v_cursor INTO empname;
  8              EXIT WHEN v_cursor%NOTFOUND;
  9              DBMS_OUTPUT.PUT_LINE('NAME: ' || empname);
 10         END LOOP;
 11     END;
 12    /
NAME: Rajesh Kumar
NAME: Rajesh Kumar
NAME: Priya Sharma
NAME: Vijay Reddy
NAME: Lakshmi Iyer

PL/SQL procedure successfully completed.

20

SQL> CREATE OR REPLACE FUNCTION get_emp_table
  2  RETURN emp_table
  3  IS
  4      v_result emp_table := emp_table();
  5      v_index  NUMBER := 0;
  6  BEGIN
  7      FOR rec IN (SELECT * FROM Employee) LOOP
  8          v_index := v_index + 1;
  9          v_result.EXTEND;
 10          v_result(v_index) := emp_row(
 11              rec.employee_id,
 12              rec.name,
 13              rec.role,
 14              rec.salary
 15          );
 16      END LOOP;
 17      RETURN v_result;
 18  END;
 19  /

Function created.

SQL> SELECT * FROM TABLE(get_emp_table);

EMPLOYEE_ID NAME
----------- ------------------------------
ROLE                                                   SALARY
-------------------------------------------------- ----------
        101 Rajesh Kumar
Senior Staff                                            95000

        102 Rajesh Kumar
Senior Staff                                            93000

        103 Priya Sharma
Senior Staff                                            70000


EMPLOYEE_ID NAME
----------- ------------------------------
ROLE                                                   SALARY
-------------------------------------------------- ----------
        104 Vijay Reddy
Senior Staff                                            50000

        105 Lakshmi Iyer
Senior Staff                                            85000

        106 Virat
Inventory Clerk                                         50000


EMPLOYEE_ID NAME
----------- ------------------------------
ROLE                                                   SALARY
-------------------------------------------------- ----------
         10 SURESH
TECHNICIAN                                              35000

          7 rathinam
TECHNICIAN                                              35000

        108 Dhoni
MANAGER                                                 70000


EMPLOYEE_ID NAME
----------- ------------------------------
ROLE                                                   SALARY
-------------------------------------------------- ----------
          8 light
MANAGER                                                 72000

        109 rohit
                                                        25000

        110 gill
                                                        85000


12 rows selected.

HACKERRANK

 A. Procedure to display employee_id, name, role, and city of all employees

SQL> CREATE OR REPLACE PROCEDURE details(c_cursor OUT SYS_REFCURSOR)
  2      IS
  3      BEGIN
  4          OPEN c_cursor FOR
  5              SELECT employee_id, name, role, address_city
  6              FROM Employee;
  7      END details;
  8      /

Procedure created.

SQL> DECLARE
  2          v_cursor  SYS_REFCURSOR;
  3          emp_id    NUMBER;
  4          empname   VARCHAR2(30);
  5          role      VARCHAR2(50);
  6         city      VARCHAR2(50);
  7      BEGIN
  8          details(v_cursor);
  9          LOOP
 10             FETCH v_cursor INTO emp_id, empname, role, city;
 11             EXIT WHEN v_cursor%NOTFOUND;
 12             DBMS_OUTPUT.PUT_LINE('ID: ' || emp_id ||
 13                                  '  NAME: '  || empname ||
 14                                  '  ROLE: '  || role    ||
 15                                  '  CITY: '  || city);
 16         END LOOP;
 17    END;
 18    /
ID: 101  NAME: Rajesh Kumar  ROLE: Senior Staff  CITY: Chennai
ID: 102  NAME: Rajesh Kumar  ROLE: Senior Staff  CITY: Chennai
ID: 103  NAME: Priya Sharma  ROLE: Senior Staff  CITY: Madurai
ID: 104  NAME: Vijay Reddy  ROLE: Senior Staff  CITY: Madurai
ID: 105  NAME: Lakshmi Iyer  ROLE: Senior Staff  CITY: Chennai
ID: 106  NAME: Virat   ROLE: Inventory Clerk  CITY: VIRUDUNAGAR
ID: 10  NAME: SURESH  ROLE: TECHNICIAN  CITY: TRICHY
ID: 7  NAME: rathinam  ROLE: TECHNICIAN  CITY: MADURAI
ID: 108  NAME: Dhoni  ROLE: MANAGER  CITY: CHENNAI
ID: 8  NAME: light  ROLE: MANAGER  CITY: CHENNAI
ID: 109  NAME: rohit  ROLE:   CITY:
ID: 110  NAME: gill  ROLE:   CITY:

PL/SQL procedure successfully completed.

B. Function to display the role of all employees 

SQL> CREATE OR REPLACE FUNCTION get_role RETURN SYS_REFCURSOR
  2      IS
  3          c_cursor SYS_REFCURSOR;
  4      BEGIN
  5          OPEN c_cursor FOR
  6              SELECT employee_id, role FROM Employee WHERE role IS NOT NULL;
  7          RETURN c_cursor;
  8     END get_role;
  9     /

Function created.

SQL> DECLARE
  2          v_cursor  SYS_REFCURSOR;
  3         emp_id    NUMBER;
  4          emp_role  Employee.role%TYPE;
  5      BEGIN
  6          v_cursor := get_role;
  7          DBMS_OUTPUT.PUT_LINE('EMPLOYEE_ID   ROLE');
  8          LOOP
  9             FETCH v_cursor INTO emp_id, emp_role;
 10             EXIT WHEN v_cursor%NOTFOUND;
 11             DBMS_OUTPUT.PUT_LINE(emp_id || '        ' || emp_role);
 12         END LOOP;
 13     END;
 14     /
EMPLOYEE_ID   ROLE
101        Senior Staff
102        Senior Staff
103        Senior Staff
104        Senior Staff
105        Senior Staff
106        Inventory Clerk
10        TECHNICIAN
7        TECHNICIAN
108        MANAGER
8        MANAGER

PL/SQL procedure successfully completed.

C. Function to display average salary for each city


SQL> CREATE OR REPLACE FUNCTION avg_salary_city RETURN SYS_REFCURSOR
  2      IS
  3          c_cursor SYS_REFCURSOR;
  4      BEGIN
  5         OPEN c_cursor FOR
  6              SELECT address_city, AVG(salary)
  7              FROM Employee
  8              GROUP BY address_city;
  9          RETURN c_cursor;
 10     END avg_salary_city;
 11     /

Function created.

SQL>
SQL>  DECLARE
  2          v_cursor SYS_REFCURSOR;
  3          sal      NUMBER;
  4          city     VARCHAR2(50);
  5      BEGIN
  6          v_cursor := avg_salary_city;
  7          DBMS_OUTPUT.PUT_LINE('AVG_SALARY   CITY');
  8          LOOP
  9              FETCH v_cursor INTO city, sal;
 10             EXIT WHEN v_cursor%NOTFOUND;
 11             DBMS_OUTPUT.PUT_LINE(sal || '        ' || city);
 12         END LOOP;
 13     END;
 14     /
AVG_SALARY   CITY
91000        Chennai
60000        Madurai
50000        VIRUDUNAGAR
35000        TRICHY
35000        MADURAI
71000        CHENNAI
55000

PL/SQL procedure successfully completed.

D. Procedure to find employee with highest salary in each city

SQL> CREATE OR REPLACE PROCEDURE max_salary_per_city
  2      IS
  3          CURSOR city_cur IS
  4              SELECT DISTINCT address_city FROM Employee WHERE address_city IS NOT NULL;
  5          v_city    Employee.address_city%TYPE;
  6          v_max_sal NUMBER;
  7          v_name    Employee.name%TYPE;
  8     BEGIN
  9          OPEN city_cur;
 10         FETCH city_cur INTO v_city;
 11
 12        WHILE city_cur%FOUND LOOP
 13             v_max_sal := 0;
 14
 15             SELECT MAX(salary) INTO v_max_sal
 16             FROM Employee
 17             WHERE address_city = v_city;
 18
 19             DECLARE
 20                 CURSOR emp_cur IS
 21                     SELECT name FROM Employee
 22                     WHERE address_city = v_city AND salary = v_max_sal;
 23             BEGIN
 24                 OPEN emp_cur;
 25                 FETCH emp_cur INTO v_name;
 26                 WHILE emp_cur%FOUND LOOP
 27                     DBMS_OUTPUT.PUT_LINE('CITY: ' || v_city ||
 28                                          '  NAME: '   || v_name    ||
 29                                          '  SALARY: ' || v_max_sal);
 30                     FETCH emp_cur INTO v_name;
 31                 END LOOP;
 32               CLOSE emp_cur;
 33             END;
 34
 35             FETCH city_cur INTO v_city;
 36         END LOOP;
 37         CLOSE city_cur;
 38     END;
 39     /

Procedure created.

SQL> EXEC max_salary_per_city;
CITY: CHENNAI  NAME: light  SALARY: 72000
CITY: Chennai  NAME: Rajesh Kumar  SALARY: 95000
CITY: MADURAI  NAME: rathinam  SALARY: 35000
CITY: Madurai  NAME: Priya Sharma  SALARY: 70000
CITY: TRICHY  NAME: SURESH  SALARY: 35000
CITY: VIRUDUNAGAR  NAME: Virat   SALARY: 50000

PL/SQL procedure successfully completed.

E. Procedure to return the City with maximum number of Employees


SQL>  CREATE OR REPLACE PROCEDURE max_emp_city(
  2          v_out_city  OUT VARCHAR2,
  3          v_out_count OUT NUMBER
  4      )
  5      IS
  6      BEGIN
  7          SELECT address_city, count_val
  8          INTO v_out_city, v_out_count
  9          FROM (
 10            SELECT address_city, COUNT(*) AS count_val
 11             FROM Employee
 12             WHERE address_city IS NOT NULL
 13             GROUP BY address_city
 14             ORDER BY count_val DESC
 15         )
 16         WHERE ROWNUM = 1;
 17    END;
 18    /

Procedure created.

SQL> DECLARE
  2          city_name  VARCHAR2(50);
  3          emp_count  NUMBER;
  4      BEGIN
  5          max_emp_city(city_name, emp_count);
  6          DBMS_OUTPUT.PUT_LINE('City with most Employees: ' || city_name ||
  7                               '  (Count: ' || emp_count || ')');
  8      END;
  9      /
City with most Employees: Chennai  (Count: 3)

PL/SQL procedure successfully completed.

F. Function to return employees with salary below average
    salary of employees in ARJUN's city

SQL>  CREATE OR REPLACE FUNCTION emp_below_avg_arjun RETURN SYS_REFCURSOR
  2     IS
  3          v_cursor SYS_REFCURSOR;
  4      BEGIN
  5          OPEN v_cursor FOR
  6              SELECT name, salary, address_city
  7             FROM Employee
  8              WHERE salary < (
  9                  SELECT AVG(salary)
 10                FROM Employee
 11                 WHERE address_city = (
 12                     SELECT address_city FROM Employee
 13                     WHERE name = 'Virat ' AND ROWNUM = 1
 14                 )
 15             );
 16        RETURN v_cursor;
 17    END;
 18    /

Function created.

SQL> DECLARE
  2          v_res    SYS_REFCURSOR;
  3          v_name   Employee.name%TYPE;
  4          v_sal    Employee.salary%TYPE;
  5          v_city   Employee.address_city%TYPE;
  6      BEGIN
  7         v_res := emp_below_avg_arjun;
  8          LOOP
  9              FETCH v_res INTO v_name, v_sal, v_city;
 10             EXIT WHEN v_res%NOTFOUND;
 11             DBMS_OUTPUT.PUT_LINE('NAME: ' || v_name   ||
 12                                  '  SALARY: ' || v_sal    ||
 13                                  '  CITY: '   || v_city);
 14         END LOOP;
 15         CLOSE v_res;
 16     END;
 17     /
NAME: SURESH  SALARY: 35000  CITY: TRICHY
NAME: rathinam  SALARY: 35000  CITY: MADURAI
NAME: rohit  SALARY: 25000  CITY:

PL/SQL procedure successfully completed.




