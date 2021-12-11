create database KOP92112022;
use KOP92112022;

create table ticket(tick_number int);

create table driver(Dri_id int auto_increment not null, Dri_name varchar(80), Dri_number int unique,
primary key(Dri_id));

create table bus(bus_id int auto_increment not null, Dri_id int, bus_num int unique, bus_type varchar(30), 
primary key(bus_id), constraint foreign key(Dri_id) references driver(Dri_id));

create table customer(Cus_ID int auto_increment not null, tick_number int, Cus_Name varchar(80),
Cus_mobile int unique, Cus_email varchar(30),
primary key(Cus_ID));	

create table trip(Trip_ID int auto_increment not null, Dri_id int, bus_id int,
Trip_distance varchar(10), Trip_epoint varchar(14), Trip_spoint varchar(14),
primary key(Trip_ID), trip_time time, type enum('departure', 'arrival'),
	time time,
constraint foreign key(Dri_id) references driver(Dri_id),
constraint foreign key(bus_id) references bus(bus_id));

create table manager(Man_ID int auto_increment not null, Man_name varchar(80), Man_no int unique,
primary key(Man_ID));


create table transactions(tran_id bigint auto_increment primary key, bus_id int,
trip_id int, Man_ID int, Cus_ID int,
cost float check(cost >=3), tran_date datetime,
constraint foreign key(bus_id) references bus(bus_id),
constraint foreign key(trip_id) references trip(trip_id),
constraint foreign key(Cus_ID) references customer(Cus_ID),
constraint foreign key(Man_ID) references manager(Man_ID));


insert into driver(Dri_id, Dri_name, Dri_number)
values(1011 ,"Lewis Hamilton", 788000777),
(1012 ,"Valterri Botas", 808438747),
(1013 ,"Percy Jackson", 538746897),
(1014 ,"Lex Brian", 435748488),
(1015 ,"Austin Hughes", 19526898);

insert into bus(bus_id, Dri_id, bus_num, bus_type)
values(213, 1011, 21, "Double-decker bus"),
(113, 1012, 14, "Single-decker bus"),
(104, 1013, 41, "shuttle bus"),
(115, 1014, 81, "Double-decker bus"),
(014, 1015, 08, "mini bus");


insert into customer(Cus_ID, Cus_Name, Cus_mobile, Cus_email,tick_number )
values(011, "Mario Lopez", 0238704, "marlop2@gmail.com", 973215),
(301, "Samuel Green",3482704, "samgr8@gmail.com", 43280),
(112, "Lewis Oakley",9869504, "lewo8Q@hotmail.com",32097),
(904, "Grey Wood",9084312, "gw9@gmail.com", 89732),
(809, "Michael Quill",8782312, "mikeq21@gmail.com", 43219);


insert into trip(Trip_ID, Dri_id, bus_id, Trip_distance, Trip_epoint, Trip_spoint)
 values(001, 1011, 213, "225km", "Takoradi", "Accra"),
 (002, 1012, 113, "293km", "Kumasi", "Takoradi"),
 (003, 1013, 104, "395km", "Tema", "Sunyani"),
 (004, 1014, 115, "248km", "Kumasi", "Accra"),
 (005, 1015, 014, "159km", "Ho", "Accra");
 
insert into manager(Man_ID, Man_name, Man_no)
 values(9422, "Lex Luthor", 34216),
(2428, "Tony Stark", 55890),
(8421, "Bruce Wayne", 84565),
(8913, "Oliver Queen", 89043),
(9804, "T'Challa", 80734);

insert into transactions(tran_id, bus_id, trip_id, Man_ID, Cus_ID, cost, tran_date)
values(0001, 213, 001, 9422, 011, 10.00, "2020-01-28"),
(0002, 113, 002, 2428, 301, 18.00, "2020-04-16"),
 (0003, 104, 003, 8421, 112, 25.00, "2020-03-08"),
(0004, 115, 004, 8913, 904, 12.00, "2020-03-20"),
(0005, 014, 005, 9804, 809, 8.00, "2020-04-08");

insert into ticket(Tick_number)
values(973215), (431806),
(98702), (88990),
(69805), (90654),
(11208), (32097),
(806052), (90320);


select bus.bus_id, driver.Dri_name
from bus
inner join driver on bus.Dri_id = driver.Dri_id;

select * from customer
left join ticket on customer.tick_number = ticket.Tick_number
union
select * from customer
right join ticket on customer.tick_number = ticket.Tick_number;


select bus_type, count(*) from bus group by bus_type;

select *
from transactions where cost > 10.00;

select trip_id, cost from transactions order by cost;

select * from manager where Man_no is not null;

