

**Kau Restaurant**

By:

**1- Sohaib Albakri – 1742285**

2- **Meshal Albishi – 1740012**

3- **Mohammed Fadel – 1740426**

**Part No.**

**Topic**

**Page No.**

**Scenario**

**Identify entities and**

**relation**

**2**

**3**

**Part one**

**Er-diagram**

**10 Queries**

**Schema**

**4**

**5**

**5**

**Part Two**

**Queries by Algebra**

**6**

**Part three**

**Part Four**

**10 queries by SQL**

**Complex queries**

**Connect to NetBeans**

**6**

**7**

**Check zip folder**

1





❖ Scenario

**KAU RESTURANT**

A group of students in King Abdelaziz university started their own restaurant near

there college.

Their restaurant needs to have a data base management system to help them keep

their restaurant working with the least bit of problems They must start recording the

restaurant data base recruitment and its as follow.

There system needs to record their employees, there employee’s information is as

follow.

Employee name (first name, last name), (unique)social security number, phone

number, address, date of birth.

Not all employees have the same job there will be a cashier with cashier id(unique)

and will have an account (username, password), and a delivery driver with a unique

driver id, the driver needs to have a driving license that will also be recorded in the

system as License number(unique), expiration date, blood type. all the employees

will have a supervisor and there will be only one supervisor.

The restaurant will need to record and keep track of all the orders all orders have an

order type, order data, order id (unique), and every order have a bill with bill

number(unique) and total price.

the customers may order an item, the restaurant needs to determine how many

items was ordered, every item have a name(unique), price, and the number of

calories in it, and it will be supplied by only one supplier.

The restaurant will need a supplier to bring the items there each supplier will have a

name, and an id(unique), he will supply many items.

and it will have to determines if the order is pick up or delivery if it needs to be

delivered the restaurant will have to choose a driver to deliver the order, and a

delivery car every will have Car License, car plate, and a car id(unique), and will

deliver to one or more customers.

The restaurant will have to keep recorded of their customers each customer will

have a name, id(unique), phone, and an address, and it will need to define if the

customer will pick up the order or need it delivered to him.

2





❖ Identify entities and relation

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

\-

Each Employee must be either Cashier or Driver

Employee can supervise many Employees

Employee can be supervised by only one supervisor.

Each Driver must have one driving license

Each Driving\_license must have a one Driver

Each Cashier must take Order

Each Order is taken by one Cashier

Each Order must have one bill

Each bill is for one Order

Order can have many Food

Each Food can be in many Orders

Order can have many items

Each item can be in many Orders

Each item is supplied by one supplier

Each supplier supplies many item

Each Order must be either Delivery\_Order or Pickup\_Order

Each Delivery\_Order must be delivered by one Car to one Customer

Each delivery Car is delivering many Orders to many Customers

Each Customer is getting one Order by one Car

Each Pickup\_Order is picked by one Customer

Each Customer picks a Pickup Order

Entities:

Employee, Cashier, Driver, Driving license, Bill, Order, item, Delivery car,

Customer, Delivery order, Pickup order.

Entity

Employee

Cashier

Attributes

Full\_Name Phone

Account

SSN

Cashair\_id

Driver\_id

Address DOB

Job

Driver

Driving\_license

Bill

Order

License\_number Exp\_date

Blood type

Bill\_number

Order\_id

Name

Total\_price

Order\_date Order\_type

Price

Item

Calories

Car\_license

Phone

Delivery\_car

Customer

Supplier

Car\_id

Customer\_id

Sup\_id

Car\_plate

Name

Name

address

Primary key – Composite

3





❖ Er-diagram

4





❖ 10 Queries

\1. How to prints Employee according their job?

\2. How to prints all Employees with their supervisor?

\3. How to create view for the Orders with their bills and type of order?

\4. How to have order and driver information?

\5. How to print all Orders that has Items from one specific Supplier?

\6. How to insert Employees?

\7. How to fire an employee?

\8. How to show driver information ?

\9. How to update Order?

\10. How to Print all Delivery\_Order that delivered by specific Driver?

❖ Schema

5





❖ Queries by Algebra

▪ 휎 job=cashier (employee)

▪ 휋 Fname,Lname,driver\_id,license\_number(s job=driver

(employee,driver))

❖ 10 queries by SQL

**1. How to prints Employee according their job?**

o Select ssn,fname,lname, job\_type from employee where job\_type =

'Cashier';

**2. How to prints all Employees with their supervisor?**

o select a.ssn as "employee\_id",a.fname as "employee\_name" ,s.fname

as "super\_name" , s.ssn as "super\_ssn" from employee a, employee s

where a.super\_ssn = s.ssn;

**3. How to create view for the Orders with their bills and type of order?**

o Create view Order\_bill as select order\_id, order\_type, bill\_number

from orders, bill where orders.bill\_number = bill#;

**4. How to have order and driver information?**

o select distinct orders.ORDER\_ID,drive\_id from orders,delivery\_order

where orders.order\_id = delivery\_order.order\_id;

**5. How to print all Orders that has Items from one specific Supplier?**

o Select order\_id from order\_item where name in(select item.name

from item,supplieres where supplieres.sup\_id = item.sup\_id);

**6. How to insert Employees?**

o Insert into employee values(109222, '0569813231','jeddah','2-1-

1998', ' meshal' ,'mohammed',0);

**7. How to update Order?**

o update orders set order\_type = 'Delivery\_car' where order\_id = 5;

**8. How to Print all Delivery\_Order that delivered by specific Driver?**

o Select \* from orders where order\_id in (select order\_id from

delivery\_order where drive\_id = 301);

**9. How to fire an employee?**

o delete from employee where ssn = 1;

**10.How to show driver information ?**

o SELECT Fname,Lname ,driver\_id,license from employee,driver where

job\_type = 'Driver';

6





❖ Complex queries

**1- Complex using in OR not in:**

•

Select ssn,fname, job\_type from employee where ssn not

in(select ssn from cashir);

**2- Complex with Selection from different tables at one time:**

•

Select item.name, supplieres.name from supplieres, item

where item.supplier\_id = supplieres.sup\_id;

**3- Complex using group by and having:**

• Select count(\*),job\_type from employee group by job\_type

having count(\*) > 3;

**4- Complex using Nesting with aggregation:**

• Select \* from bill where TOTAL\_PRICE > (select

avg(TOTAL\_PRICE) from bill);

**5- Complex with outer join:**

•

Select e.ssn as "Employee",s.ssn as "Super" from employee

e, employee s where e.super\_ssn = s.ssn(+);

7


