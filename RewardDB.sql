--create database RewardDB
use RewardDB

create table Customer
(
custID		int					not null constraint pk_Customer primary key,
name		varchar(30)			not null,
phone		varchar(30)			not null,
email		varchar(50)			not null,
password	varchar(50)			not null,
);

insert into Customer values (1, 'Andy', '081908022280', 'andy@gmail.com', '123456');
insert into Customer values (2, 'Kevin', '081289385581', 'kevin@gmail.com', '123456');
insert into Customer values (3, 'Michael', '0818185515', 'michael@gmail.com', '123456');
insert into Customer values (4, 'Budi', '08128388382', 'budi@gmail.com', '123456');
insert into Customer values (5, 'Andreas', '081285881221', 'andreas@gmail.com', '123456');
insert into Customer values (6, 'Jason', '081908077780', 'jason@gmail.com', '123456');
insert into Customer values (7, 'Vina', '08112245678', 'vina@gmail.com', '123456');

create table History
(
hID				int					not null constraint pk_History primary key,
hName			varchar(30)			not null,
price			decimal(18,2)		not null,
description		varchar(50)			not null,
datetime		datetime			not null default current_timestamp,
custID			int,
constraint fk_customer foreign key (custID) references customer(custID)
);

insert into History values (1, 'demoPay', 1000000.00, 'testing', CURRENT_TIMESTAMP, 1);
insert into History values (2, 'demoPay2', 2000000.00, 'testing', CURRENT_TIMESTAMP, 1);
insert into History values (3, 'demopay3', 15000000.00, 'test', CURRENT_TIMESTAMP, 2);

create table Reward
(
rID			int				not null constraint pk_Reward primary key,
pts			decimal(6,2)	not null,
hID			int,
constraint fk_history foreign key (hID) references History(hID)
);

insert into Reward values (1, 10, 1);
insert into Reward values (2, 5, 2);
insert into Reward values (3, 15, 3);

create table Admin 
(
AdminID			VARCHAR(30) NOT NULL,
Name			VARCHAR(30) NOT NULL,
Password		VARCHAR(30) NOT NULL,
	PRIMARY KEY (AdminID),
);

insert into Admin values('admin','Admin','admin');

create table Merchant
(
mID			int				not null constraint pk_Merchant primary key,
name		varchar(30)		not null,
owner		varchar(30)		not null,
loc			varchar(50)		not null,
phone		varchar(30)		not null,
email		varchar(30)		not null,
username	varchar(30)		not null,
password	varchar(50)		not null
);

insert into Merchant values (1, 'ABC Group', 'Catherine', 'Kelapa Gading', '0818185515', 'abc@gmail.com', 'abcgroup', '123456');

create table Voucher
(
vID			int				not null constraint pk_Voucher primary key,
name		varchar(30)		not null,
totalPts	decimal(6,2)	not null,
totalPrice	decimal(18,2)	not null,
mID			int,
constraint fk_merchant foreign key (mID) references Merchant(mID)
);

insert into Voucher values (1, 'vTest', 50, 500000.00, 1);
insert into Voucher values (2, 'vTes2', 150, 1500000.00, 1);

select hID, hName, price, description, c.name from History inner join Customer c on History.custID = c.custID

select * from History;
select * from Reward;
select * from Customer;
select * from Admin;
select * from Merchant;
select * from Voucher;

select * from History where custID = 1;

--select custID by using phone number
select custID from Customer where phone = '081289385581';

--to show history and pts made by customer
select c.name, price, r.pts from Customer c inner join History on History.custID = c.custID left join Reward r on r.hID = History.hID

--to calculate how many pts from customer
select SUM(r.pts) as 'pts' from Customer c inner join History on History.custID = c.custID left join Reward r on r.hID = History.hID where c.custID=1

select * from reward join Customer on Reward.hID=Customer.custID where custID = 1;

select h.hID, h.hName, price, h.description, pts, h.datetime from History h inner join Reward on h.hID = Reward.hID order by datetime asc

select count(custID) from Customer

select SUM(price) from History

select SUM(pts) from Reward