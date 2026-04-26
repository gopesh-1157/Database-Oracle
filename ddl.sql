Vehicle Spare Parts 
DDL queries

1.Create the Supplier table with supplierid as primary key.

SQL> CREATE TABLE Supplier (supplier_id NUMBER PRIMARY KEY,name VARCHAR2(30),email VARCHAR2(20),phone VARCHAR2(15),gst_number VARCHAR2(30),address_city VARCHAR2(50),address_location VARCHAR2(100),address_state VARCHAR2(30));

Table created.

TO SEE THE STRUCTURE OF TABLE USERS

SQL> DESC Supplier
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SUPPLIER_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(30)
 EMAIL                                              VARCHAR2(20)
 PHONE                                              VARCHAR2(15)
 GST_NUMBER                                         VARCHAR2(30)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_STATE                                      VARCHAR2(30)

2.CREATE TABLE FOR EMPLOYEE 



SQL> CREATE TABLE Employee (employee_id NUMBER PRIMARY KEY,name VARCHAR2(30),phone VARCHAR2(15),email VARCHAR2(30),role VARCHAR2(50),salary NUMBER,manager_id NUMBER,address_location VARCHAR2(100),address_city VARCHAR2(50),address_state VARCHAR2(50));

Table created.

SQL> DESC Employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(30)
 PHONE                                              VARCHAR2(15)
 EMAIL                                              VARCHAR2(30)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)

3.TO CREATE TABLE FOR STORAGEAREA


SQL> CREATE TABLE StorageArea (store_id NUMBER PRIMARY KEY,location VARCHAR2(100),total_quantity NUMBER,damaged_quantity NUMBER,min_stock NUMBER,last_updated DATE);

Table created.

SQL> Desc StorageArea
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 STORE_ID                                  NOT NULL NUMBER
 LOCATION                                           VARCHAR2(100)
 TOTAL_QUANTITY                                     NUMBER
 DAMAGED_QUANTITY                                   NUMBER
 MIN_STOCK                                          NUMBER
 LAST_UPDATED                                       DATE

4.CREATE A TABLE FOR DAMAGERECORD


SQL> CREATE TABLE DamageRecord (damage_id NUMBER PRIMARY KEY,damage_date DATE,damage_type VARCHAR2(50),quantity NUMBER,reason VARCHAR2(100),action_taken VARCHAR2(100),store_id NUMBER,part_id NUMBER,FOREIGN KEY (store_id) REFERENCES StorageArea(store_id),FOREIGN KEY (part_id) REFERENCES SparePart(part_id));

Table created.


SQL> DESC DamageRecord
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DAMAGE_ID                                 NOT NULL NUMBER
 DAMAGE_DATE                                        DATE
 DAMAGE_TYPE                                        VARCHAR2(50)
 QUANTITY                                           NUMBER
 REASON                                             VARCHAR2(100)
 ACTION_TAKEN                                       VARCHAR2(100)
 STORE_ID                                           NUMBER
 PART_ID                                            NUMBER

5.create table for SalesOrder

SQL> CREATE TABLE SalesOrder (sales_id NUMBER PRIMARY KEY,customer_id NUMBER,employee_id NUMBER,total_amount NUMBER,tax_amount NUMBER,final_amount NUMBER,FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

SQL> desc SalesOrder
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SALES_ID                                  NOT NULL NUMBER
 CUSTOMER_ID                                        NUMBER
 EMPLOYEE_ID                                        NUMBER
 TOTAL_AMOUNT                                       NUMBER
 TAX_AMOUNT                                         NUMBER
 FINAL_AMOUNT                                       NUMBER

6.create table for SalesItem 

SQL> CREATE TABLE SalesItem (sales_item_id NUMBER,sales_id NUMBER,part_id NUMBER,quantity NUMBER,unit_price FLOAT,total_price FLOAT,tax_amount FLOAT,FOREIGN KEY (sales_id) REFERENCES SalesOrder(sales_id),FOREIGN KEY (part_id) REFERENCES SparePart(part_id));

Table created.

SQL> DESC SalesItem
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SALES_ITEM_ID                                      NUMBER
 SALES_ID                                           NUMBER
 PART_ID                                            NUMBER
 QUANTITY                                           NUMBER
 UNIT_PRICE                                         FLOAT(126)
 TOTAL_PRICE                                        FLOAT(126)
 TAX_AMOUNT                                         FLOAT(126)

7.create a table for ActivityRecord 

SQL> CREATE TABLE ActivityRecord (activity_id NUMBER PRIMARY KEY,activity_type VARCHAR2(50),activity_date DATE,related_record_no NUMBER,employee_id NUMBER,FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

Table created.


SQL> desc ActivityRecord
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ACTIVITY_ID                               NOT NULL NUMBER
 ACTIVITY_TYPE                                      VARCHAR2(50)
 ACTIVITY_DATE                                      DATE
 RELATED_RECORD_NO                                  NUMBER
 EMPLOYEE_ID                                        NUMBER

8.create table for ExpenseRecord
 

SQL> CREATE TABLE ExpenseRecord (expense_id NUMBER PRIMARY KEY,expense_date DATE,type VARCHAR2(50),description VARCHAR2(100),amount NUMBER,payment_method VARCHAR2(30),paid_to VARCHAR2(100),employee_id NUMBER,FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

Table created.

SQL> desc ExpenseRecord
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EXPENSE_ID                                NOT NULL NUMBER
 EXPENSE_DATE                                       DATE
 TYPE                                               VARCHAR2(50)
 DESCRIPTION                                        VARCHAR2(100)
 AMOUNT                                             NUMBER
 PAYMENT_METHOD                                     VARCHAR2(30)
 PAID_TO                                            VARCHAR2(100)
 EMPLOYEE_ID                                        NUMBER

9.create table for cashpayment 

SQL> CREATE TABLE CashPayment (payment_id NUMBER PRIMARY KEY,invoice_id NUMBER,cash_received NUMBER,balance_status VARCHAR2(30),payment_date DATE,amount NUMBER,method VARCHAR2(30),status VARCHAR2(30),FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id));

Table created.

SQL> desc cashpayment
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PAYMENT_ID                                NOT NULL NUMBER
 INVOICE_ID                                         NUMBER
 CASH_RECEIVED                                      NUMBER
 BALANCE_STATUS                                     VARCHAR2(30)
 PAYMENT_DATE                                       DATE
 AMOUNT                                             NUMBER
 METHOD                                             VARCHAR2(30)
 STATUS                                             VARCHAR2(30)

10.create table for SupplierBank


SQL> CREATE TABLE SupplierBank (bank_account VARCHAR2(30) PRIMARY KEY,supplier_id NUMBER,FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id));

Table created.

SQL> desc supplierbank
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BANK_ACCOUNT                              NOT NULL VARCHAR2(30)
 SUPPLIER_ID                                        NUMBER

11.create a table for StockMovement

SQL> CREATE TABLE StockMovement (movement_id NUMBER PRIMARY KEY,store_id NUMBER,part_id NUMBER,movement_type VARCHAR2(30),quantity NUMBER,movement_date DATE,reference VARCHAR2(50),FOREIGN KEY (store_id) REFERENCES StorageArea(store_id),FOREIGN KEY (part_id) REFERENCES SparePart(part_id));

Table created.

SQL> desc stockmovement
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MOVEMENT_ID                               NOT NULL NUMBER
 STORE_ID                                           NUMBER
 PART_ID                                            NUMBER
 MOVEMENT_TYPE                                      VARCHAR2(30)
 QUANTITY                                           NUMBER
 MOVEMENT_DATE                                      DATE
 REFERENCE                                          VARCHAR2(50)



12.Drop email column from employee table.

SQL> ALTER TABLE Employee DROP email ;
ALTER TABLE Employee DROP email
                          *
ERROR at line 1:
ORA-00905: missing keyword


SQL> ALTER TABLE Employee DROP column email ;

Table altered.

SQL> desc Employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(30)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(30)

13.ADD a email column to employee table

SQL> ALTER TABLE employee ADD column email VARCHAR2(20);
ALTER TABLE employee ADD column email VARCHAR2(20)
                         *
ERROR at line 1:
ORA-00904: : invalid identifier


SQL> ALTER TABLE employee ADD  email VARCHAR2(20);

Table altered.

SQL> desc Employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(30)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(30)
 EMAIL                                              VARCHAR2(20)

14.Add check constraint to ensure salary is non-zero in employee table.


SQL> ALTER TABLE Employee ADD CONSTRAINT c1 CHECK (salary > 0);

Table altered.

15.Drop check constraint from employee table

SQL> ALTER TABLE Employee DROP CONSTRAINT c1;

Table altered.

16.Rename email to mail in employee table 


SQL> ALTER TABLE Employee RENAME COLUMN email TO mail;

Table altered.

SQL> desc Employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(100)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)

17. Add primary key to salesitem table.

SQL> desc SalesItem
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SALES_ITEM_ID                                      NUMBER
 SALES_ID                                           NUMBER
 PART_ID                                            NUMBER
 QUANTITY                                           NUMBER
 UNIT_PRICE                                         FLOAT(126)
 TOTAL_PRICE                                        FLOAT(126)
 TAX_AMOUNT                                         FLOAT(126)

SQL> ALTER TABLE Salesitem ADD CONSTRAINT c1 PRIMARY KEY(sales_item_id);

Table altered.

SQL> desc SalesItem
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SALES_ITEM_ID                             NOT NULL NUMBER
 SALES_ID                                           NUMBER
 PART_ID                                            NUMBER
 QUANTITY                                           NUMBER
 UNIT_PRICE                                         FLOAT(126)
 TOTAL_PRICE                                        FLOAT(126)
 TAX_AMOUNT                                         FLOAT(126)

18.Drop primary key from Salesitem table.

SQL> ALTER TABLE SalesItem DROP PRIMARY KEY;

Table altered.

SQL> desc SalesItem
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SALES_ITEM_ID                                      NUMBER
 SALES_ID                                           NUMBER
 PART_ID                                            NUMBER
 QUANTITY                                           NUMBER
 UNIT_PRICE                                         FLOAT(126)
 TOTAL_PRICE                                        FLOAT(126)
 TAX_AMOUNT                                         FLOAT(126)

19.TO ADD A FOREIGN KEY AS A EMPLOYEEID IN A SALESITEM TABLE


SQL> ALTER TABLE Salesitem ADD CONSTRAINT c1 FOREIGN KEY(employee_id) REFERENCES Employee(employee_id);
ALTER TABLE Salesitem ADD CONSTRAINT c1 FOREIGN KEY(employee_id) REFERENCES Employee(employee_id)
                                                    *
ERROR at line 1:
ORA-00904: "EMPLOYEE_ID": invalid identifier


SQL> ALTER TABLE Salesitem ADD employee_id int;

Table altered.

SQL> ALTER TABLE Salesitem ADD CONSTRAINT c1 FOREIGN KEY(employee_id) REFERENCES Employee(employee_id);

Table altered.

SQL> desc Salesitem
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SALES_ITEM_ID                                      NUMBER
 SALES_ID                                           NUMBER
 PART_ID                                            NUMBER
 QUANTITY                                           NUMBER
 UNIT_PRICE                                         FLOAT(126)
 TOTAL_PRICE                                        FLOAT(126)
 TAX_AMOUNT                                         FLOAT(126)
 EMPLOYEE_ID                                        NUMBER(38)

20.To remove a foreign key constraint in salesitem table

SQL> ALTER TABLE SaleSitem DROP CONSTRAINT C1;

Table altered.

21.Modify name datatype in employee table.


SQL> desc employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(50)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)

SQL> ALTER TABLE Employee MODIFY name VARCHAR2(30);

Table altered.

SQL> desc employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(30)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)

22.To create employee copy table from original employee table 


SQL> CREATE TABLE employee_Copy AS SELECT * FROM employee;

Table created.

SQL> desc employee_Copy
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                                        NUMBER
 NAME                                               VARCHAR2(50)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)

23.Rename employee_copy to employeetable

SQL> RENAME employee_copy TO employeetable;

Table renamed.

SQL> desc employee_Copy
ERROR:
ORA-04043: object employee_Copy does not exist


SQL> desc employeetable
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                                        NUMBER
 NAME                                               VARCHAR2(50)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)

24.Remove all records from employeetable


SQL> TRUNCATE TABLE employeetable;

Table truncated.

SQL> desc employeetable
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                                        NUMBER
 NAME                                               VARCHAR2(50)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                             NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)

25.Drop employeetable table

SQL> DROP TABLE employeetable;

Table dropped.

SQL> desc employeetable
ERROR:
ORA-04043: object employeetable does not exist


26.create a table for sptsoldsord table


SQL> create table sptsoldsord(partid number,salesid number,lead_time timestamp,sales_price float,constraint fk_rel foreign key(partid) references sparepart(part_id),constraint fk_rel1 foreign key(salesid) references salesorder(sales_id),primary key(partid,salesid));

Table created.

SQL> desc sptsoldsord
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PARTID                                    NOT NULL NUMBER
 SALESID                                   NOT NULL NUMBER
 LEAD_TIME                                          TIMESTAMP(6)
 SALES_PRICE                                        FLOAT(126)

26 MODIFY A SALARY AS A NOT NULL IN EMPLOYEE TABLE

SQL> alter table employee modify salary not null;

Table altered.

SQL> desc employee
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER
 NAME                                               VARCHAR2(50)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                    NOT NULL NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)

27.MODIFY A GST NUMDER AS A UNIQUE IN SUPPLIER TABLE


SQL> alter table SUPPLIER modify GST_NUMBER UNIQUE;

Table altered.


28.COPY THE RELATION EMPLOYEE TO OTHER RELATION WITHOUT COPYING CONTENTS

SQL>  CREATE TABLE EMPLOYEECOPY AS SELECT * FROM EMPLOYEE WHERE 1=0;

Table created.

SQL> desc EMPLOYEECOPY
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                                        NUMBER
 NAME                                               VARCHAR2(50)
 PHONE                                              VARCHAR2(15)
 ROLE                                               VARCHAR2(50)
 SALARY                                    NOT NULL NUMBER
 MANAGER_ID                                         NUMBER
 ADDRESS_LOCATION                                   VARCHAR2(100)
 ADDRESS_CITY                                       VARCHAR2(50)
 ADDRESS_STATE                                      VARCHAR2(50)
 MAIL                                               VARCHAR2(20)


