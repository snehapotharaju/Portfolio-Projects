drop table if exists premiumusers_signup;
CREATE TABLE premiumusers_signup(userid integer,premium_signup_date date); 

INSERT INTO premiumusers_signup(userid,premium_signup_date) 
 VALUES (1,'09-22-2017'),
(3,'04-21-2017');

drop table if exists users;
CREATE TABLE users(userid integer,signup_date date); 

INSERT INTO users(userid,signup_date) 
 VALUES (1,'09-02-2014'),
(2,'01-15-2015'),
(3,'04-11-2014');

drop table if exists sales;
CREATE TABLE sales(userid integer,created_date date,product_id integer); 

INSERT INTO sales(userid,created_date,product_id) 
 VALUES (1,'04-19-2017',2),
(3,'12-18-2019',1),
(2,'07-20-2020',3),
(1,'10-23-2019',2),
(1,'03-19-2018',3),
(3,'12-20-2016',2),
(1,'11-09-2016',1),
(1,'05-20-2016',3),
(2,'09-24-2017',1),
(1,'03-11-2017',2),
(1,'03-11-2016',1),
(3,'11-10-2016',1),
(3,'12-07-2017',2),
(3,'12-15-2016',2),
(2,'11-08-2017',2),
(2,'09-10-2018',3);


drop table if exists product;
CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);


select * from sales;
select * from product;
select * from premiumusers_signup;
select * from users;


  --1.   what is the total amount each customer spent on beauty products from purple?
select a.userid,a.product_id,b.price from sales a inner join product b on a.product_id = b.product_id
-- >further
select a.userid,sum(b.price)total_amount_spent from sales a inner join product b on a.product_id = b.product_id
group by userid
--2.   how many days customer visited purple?
select userid,count(distinct created_date)from sales group by userid


-- 3.   most purchased item and how many items purchased by customers?
select top 1 product_id,count(product_id)number_of_times from sales group by product_id order by count(product_id) desc



