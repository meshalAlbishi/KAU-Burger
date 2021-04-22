----------- employee table **********************
create table employee (
    ssn integer constraint ssnPK primary key , phone varchar2(10),
    address varchar2(20), dob date , fname varchar2(20), lname varchar2(20),
    job_type varchar2(15),  super_ssn integer constraint superFK references employee(ssn));

------------- cashir table SUB of employee  **********************
 create table cashir (
    cashir_id integer constraint cashir#PK primary key,
    username varchar2(10), password varchar2(8), alter table cashir add ssn constraint ssnFK references employee(ssn) on delete cascade);

----------- driver table SUB of employee  **********************
create table driver (
    driver_id integer constraint driver#PK primary key,
    ssn constraint driverFK references employee(ssn) on delete cascade,
    license integer constraint license#FK references driving_license (license#) on delete cascade);

---------- driving_license table **********************
create table driving_license (
    license# integer constraint licensePK primary key,
    exp_date date, blood_type varchar2(10));

--------- bill table  **********************
create  table bill (bill# integer constraint billPK primary key, total_price number(6,2));

--------- orders table  **********************
create table orders (
    order_id integer constraint order#PK primary key, order_type varchar2(20), order_date date,
    cashir_id integer constraint cashir#FK references cashir(cashir_id) on delete cascade,
    bill_number integer constraint bill#FK references bill(bill#) on delete cascade);

------ item table **********************
create table item( name varchar2(50) constraint foodPK primary key , price number(4,2) , cal number (4,2),supplier_id integer constraint suppIdFK references supplieres (sup_id) on delete cascade);

----------- order_item table
 create table order_item (
    order_id integer constraint order#FK references orders(order_id) on delete cascade,
     name varchar2(50) constraint nameFK references item(name) on delete cascade,
    qty integer);

------- Delivery_Car table  **********************
create table delivery_car( car_id integer constraint carPK primary key, car_plate varchar2(8), car_license integer);

---------- customer table **********************
create table customer (
    customer_id integer constraint customer#PK primary key,
    name varchar2(20), phone varchar2(10), address varchar2(20));

------- supplieres table **********************
create table supplieres ( sup_id integer constraint sub#PK primary key, name varchar2(20));

------------ pickup_order table
create table pickup_order (
     order_id integer constraint order_idFK references orders(order_id) on delete cascade ,
     customer_id integer constraint customer#FK references customer(customer_id) on delete cascade );

---------------- delivery_order table
 create table delivery_order (
    order_id integer constraint oreder_numberFK references orders(order_id) on delete cascade,
    car_id integer constraint car#FK references delivery_car (car_id) on delete cascade,
    customer_id integer constraint customer_numberFK references customer (customer_id) on delete cascade,
    drive_id integer constraint driver#FK references driver (driver_id) on delete cascade);


-------------------------------------------------------

 -- insert employee: 
insert into employee values(100,'567890','jeddah',to_Date('01-08-1998'),'sohaib','bakri','Cashier',null);
       insert into cashir values(200,'sohaib','0',100);

insert into employee values(101,'765435','jeddah',to_Date('02-04-1998'),'meshal','albishi','Cashier',100);
       insert into cashir values(201,'meshal','0',101);

insert into employee values(102,'123456','jeddah',to_date('17-05-1992'),'mohammed','fadel','Driver',null);
       insert into driver values (300,102,1234567809);

 insert into employee values(104,'067294','jeddah',to_date('28-12-1990'),'ahmed','bz','Driver',102);
       insert into driver values (301,104,12986577329);

insert into employee values(103,'168156','jeddah',to_date('09-05-1982'),'sliva','aziz','Driver',102);
       insert into driver values (302,103,1249836522);      

insert into employee values(105,'1793166','jeddah',to_date('09-03-1999'),'moath','safrey','Driver',102);
       insert into driver values (303,105,12998346104);

insert into employee values(106,'793635','jeddah',to_Date('15-04-1998'),'abdullah','bamatrf','Cashier',100);
       insert into cashir values(202,'abdullah','0',106);

  insert into employee values(107,'7900655','jeddah',to_Date('03-08-1998'),'esmaeeil','enani','Cashier',100);
       insert into cashir values(203,'esmaeeil','0',107);

    insert into employee values(108,'7008398','jeddah',to_Date('01-05-1999'),'shahad','silva','Cashier',100);
       insert into cashir values(204,'shahad','0',108);

    insert into employee values(109,'7234598','jeddah',to_Date('29-09-2000'),'sara','alghamdi','Cashier',100);
       insert into cashir values(205,'sara','0',109);

-------------------------------------------------------

 -- insert Driving license:
   insert into driving_license values(1234567809,'20-1-2020','o+');
     insert into driving_license values(12986577329,'05-1-2022','b+');
     insert into driving_license values(1249836522,'16-1-2023','o-');
     insert into driving_license values(12998346104,'13-1-2020','a-');

-------------------------------------------------------

 -- insert supplieres: 
   insert into supplieres values(600,'Soft Drink');
   insert into supplieres values(601,'Natural Drink');
   insert into supplieres values(602,'Meat');

-------------------------------------------------------

 -- insert item: 
   insert into item values ('pepsi',3,56,600);
   insert into item values ('7 up',3,56,600);
   insert into item values ('ice tea',3,22,600);
   insert into item values ('water',1,5,601);
   insert into item values ('juice',6,15,601);
   insert into item values ('beef grilled burger',25,88,602);
   insert into item values ('chicken grilled burger',25,78,602);
   insert into item values ('chicken fried burger',25,60,602);

-------------------------------------------------------

 -- insert orders: 
   1-   insert into orders values (400,'Delivery',to_date('09-sep-2019'),204,500);
	insert into delivery_order values (400,900,700,301);

   2-   insert into orders values (401,'Delivery',to_date('09-sep-2019'),204,501);
	insert into delivery_order values (401,900,701,301);

   3-   insert into orders values (402,'Pickup',to_date('09-sep-2019'),205,502);
        insert into pickup_order values (402,702);

-------------------------------------------------------

 -- insert bill:
   1- insert into bill values(500,50);
   2- insert into bill values(501,70);
   3- insert into bill values(502,10);
   4- insert into bill values(503,30);

-------------------------------------------------------

 -- insert customer: 
   1- insert into customer values(0,'Default',null,null);
   2- insert into customer values(700,'adel','34567567','nasem');	
   3- insert into customer values(701,'salman','23456787','alsafa');
   4- insert into customer values(702,'ebrahim','238743287','alsulaimanyah');

-------------------------------------------------------

 -- insert delivery_car: 
   1- insert into delivery_car values(900,'ACDN1765','12345678');
   2- insert into delivery_car values(901,'MESH1224','87654321');
   3- insert into delivery_car values(902,'SADA5652','87688767');

-----------------------------------------------------------------------------------