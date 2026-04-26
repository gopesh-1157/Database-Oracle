SUBQUERIES 

1.
SQL> SELECT MAX(SALARY) FROM Employee
  2  ;

MAX(SALARY)
-----------
      90000

SQL>    SELECT NAME, SALARY
  2  FROM Employee
  3  WHERE SALARY = (SELECT MAX(SALARY) FROM Employee);

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000

2.

SQL> SELECT AVG(SALARY) FROM Employee
  2  ;

AVG(SALARY)
-----------
      70000

SQL> SELECT NAME, SALARY
  2  FROM Employee
  3  WHERE SALARY > (SELECT AVG(SALARY) FROM Employee);

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Lakshmi                   85000

3.

SQL> SELECT ADDRESS_CITY FROM Employee WHERE MANAGER_ID IS NULL
  2  ;

ADDRESS_CITY
--------------------------------------------------
Chennai

SQL> SELECT NAME, ADDRESS_CITY
   FROM Employee
    WHERE ADDRESS_CITY  IN (
        SELECT ADDRESS_CITY FROM Employee WHERE MANAGER_ID IS NULL
    );

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Rajesh Kumar         Chennai
Lakshmi              Chennai

4.

SQL> SELECT ADDRESS_CITY FROM Employee WHERE MANAGER_ID IS NULL
  2  ;

ADDRESS_CITY
--------------------------------------------------
Chennai

SQL> SELECT NAME, ADDRESS_CITY
  2     FROM Employee
  3      WHERE ADDRESS_CITY not IN (
  4          SELECT ADDRESS_CITY FROM Employee WHERE MANAGER_ID IS NULL
  5      );

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Priya Sharma         Madurai
Vijay Reddy          Madurai
Virat                VIRUDUNAGAR


SQL> SELECT ADDRESS_CITY FROM Employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

6 rows selected.

SQL>  SELECT NAME, ADDRESS_CITY
  2      FROM Supplier
  3      WHERE ADDRESS_CITY IN (
  4       SELECT ADDRESS_CITY FROM Employee
  5      );

NAME                 ADDRESS_CITY
-------------------- --------------------
Battery Solutions    Chennai
Engine Parts Co      Madurai

5.

SQL> SELECT SALARY FROM Employee WHERE SALARY >60000
  2  ;

    SALARY
----------
     90000
     85000

SQL> SELECT NAME, SALARY
  2      FROM Employee
  3      WHERE SALARY < All (
  4          SELECT SALARY FROM Employee WHERE SALARY >60000
  5      );

NAME                     SALARY
-------------------- ----------
Priya Sharma              55000
Vijay Reddy               50000
Virat                     50000

6.

SQL> SELECT SALARY FROM Employee WHERE SALARY >60000
  2  ;

    SALARY
----------
     90000
     85000

SQL> SELECT NAME, SALARY
  2  FROM Employee
  3  WHERE SALARY > ALL (
  4      SELECT SALARY FROM Employee WHERE SALARY >60000
  5  );

NAME                     SALARY
-------------------- ----------
Priya                     55000
Vijay Reddy               50000
Virat                     50000

7.

SQL> SELECT SALARY FROM Employee WHERE SALARY >60000
  2  ;

    SALARY
----------
     90000
     85000

SQL> SELECT NAME, SALARY
  2     FROM Employee
  3     WHERE SALARY = any (
  4          SELECT SALARY FROM Employee WHERE SALARY >60000
  5      );

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Lakshmi Iyer              85000
    
8.

SQL> SELECT SALARY FROM Employee WHERE SALARY >60000
  2  ;

    SALARY
----------
     90000
     85000

SQL> SELECT NAME, SALARY
  2     FROM Employee
  3     WHERE SALARY > any (
  4          SELECT SALARY FROM Employee WHERE SALARY >60000
  5      );

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000

9.

SQL> SELECT SALARY FROM Employee WHERE SALARY >60000
  2  ;

    SALARY
----------
     90000
     85000

SQL> SELECT NAME, SALARY
  2     FROM Employee
  3     WHERE SALARY < any (
  4          SELECT SALARY FROM Employee WHERE SALARY >60000
  5      );

NAME                     SALARY
-------------------- ----------
Priya Sharma              55000
Vijay Reddy               50000
Lakshmi Iyer              85000
Virat                     50000

10.

SQL> SELECT 1
  2  FROM Employee E1, Employee E2
  3  WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID;

         1
----------
         1
         1
         1
         1
         1

SQL> SELECT NAME, ADDRESS_CITY
  2  FROM Employee E1
  3  WHERE NOT EXISTS (
  4      SELECT 1 FROM Employee E2 WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
  5  );

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Rajesh Kumar         Chennai

11.

SQL> SELECT NAME, ADDRESS_CITY
  2  FROM Employee E1
  3  WHERE  EXISTS (
  4      SELECT 1 FROM Employee E2 WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
  5  );

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
Rajesh Kumar         Chennai
Priya Sharma         Madurai
Vijay Reddy          Madurai
Lakshmi Iyer         Chennai
Virat                VIRUDUNAGAR

11.

SQL> SELECT E2.ADDRESS_CITY, E2.EMPLOYEE_ID
  2  FROM Employee E1
  3  JOIN Employee E2
  4      ON E1.MANAGER_ID = E2.EMPLOYEE_ID;

ADDRESS_CITY                                       EMPLOYEE_ID
-------------------------------------------------- -----------
Chennai                                                    101
Chennai                                                    101
Chennai                                                    101
Chennai                                                    102
Madurai                                                    103

SQL> SELECT E1.NAME, E1.ADDRESS_CITY, E1.MANAGER_ID
  2  FROM Employee E1
  3  WHERE (E1.ADDRESS_CITY, E1.MANAGER_ID) IN (
  4      SELECT E2.ADDRESS_CITY, E2.EMPLOYEE_ID
  5      FROM Employee E2
  6      WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
  7  );

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
MANAGER_ID
----------
Rajesh Kumar         Chennai
       101
12.

SQL> SELECT ADDRESS_CITY FROM Employee;

ADDRESS_CITY
--------------------------------------------------
Chennai
Chennai
Madurai
Madurai
Chennai
VIRUDUNAGAR

6 rows selected.

SQL> SELECT ADDRESS_CITY, COUNT(*) AS NUM_EMPLOYEES
  2  FROM (
  3      SELECT ADDRESS_CITY FROM Employee
  4  ) E
  5  GROUP BY ADDRESS_CITY;

ADDRESS_CITY                                       NUM_EMPLOYEES
-------------------------------------------------- -------------
Chennai                                                        3
Madurai                                                        2
VIRUDUNAGAR                                                    1

13.

SQL> SELECT AVG(SALARY)
  2  FROM Employee
  3  WHERE ADDRESS_CITY = 'Chennai';

AVG(SALARY)
-----------
 88333.3333

SQL> SELECT AVG(SALARY)
  2  FROM Employee
  3  WHERE ADDRESS_CITY = 'Madurai';

AVG(SALARY)
-----------
      52500


SQL> SELECT AVG(SALARY)
  2  FROM Employee
  3  WHERE ADDRESS_CITY = 'VIRUDUNAGAR';

AVG(SALARY)
-----------
      50000


SQL> SELECT E1.NAME, E1.ADDRESS_CITY, E1.SALARY,
  2      (SELECT AVG(SALARY) FROM Employee E2 WHERE E2.ADDRESS_CITY = E1.ADDRESS_CITY) AS AVG_CITY_SALARY
  3  FROM Employee E1;

NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
    SALARY AVG_CITY_SALARY
---------- ---------------
Rajesh Kumar         Chennai
     90000      88333.3333

Rajesh Kumar         Chennai
     90000      88333.3333

Lakshmi Iyer         Chennai
     85000      88333.3333


NAME                 ADDRESS_CITY
-------------------- --------------------------------------------------
    SALARY AVG_CITY_SALARY
---------- ---------------
Priya Sharma         Madurai
     55000           52500

Vijay Reddy          Madurai
     50000           52500

Virat                VIRUDUNAGAR
     50000           50000


6 rows selected.

14.

SQL> SELECT MAX(SALARY) FROM Employee
  2  ;

MAX(SALARY)
-----------
      90000


SQL> SELECT NAME, SALARY
  2  FROM Employee
  3  WHERE SALARY = ALL (SELECT MAX(SALARY) FROM Employee);

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000

15.

SQL> SELECT AVG(SALARY) FROM Employee;

AVG(SALARY)
-----------
      70000


SQL> SELECT ADDRESS_CITY, AVG(SALARY) AS AVG_SAL
  2  FROM Employee
  3  GROUP BY ADDRESS_CITY
  4  HAVING AVG(SALARY) > (SELECT AVG(SALARY) FROM Employee);

ADDRESS_CITY                                          AVG_SAL
-------------------------------------------------- ----------
Chennai                                            88333.3333

16.

SQL> SELECT AVG(SALARY) AS avg_sal FROM Employee
  2  ;

   AVG_SAL
----------
     70000

SQL> SELECT NAME, SALARY
  2  FROM Employee
  3  WHERE SALARY > 70000;

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Rajesh Kumar              90000
Lakshmi Iyer              85000


SQL> WITH AvgSalary AS (
  2      SELECT AVG(SALARY) AS avg_sal FROM Employee
  3  )
  4  SELECT NAME, SALARY
  5  FROM Employee
  6  WHERE SALARY > (SELECT avg_sal FROM AvgSalary);

NAME                     SALARY
-------------------- ----------
Rajesh Kumar              90000
Rajesh Kumar              90000
Lakshmi Iyer              85000



