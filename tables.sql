--create database Miestone2
use Miestone2
-- status type?
-- priority type?
-- no entry what do i do?
--primary key and foreign key on delete and cascade?
--foregin key only?

--Room(room_id, type,floor,status)
create table Room(
room_id int primary key identity,
type varchar(50) ,
floor int default null,
-- 
status Varchar(40) default 'Available'
);

 
--Users(id, f_Name,l_Name ,password, email, preference, room , type, birthdate, age)
create table Users(
-- foregin key only?
id int primary key identity, 
f_Name varchar(50) ,
l_Name varchar(50) ,
password varchar(50) not null, 
email varchar(50) not null unique, 
preference varchar(50) , 
room int, 
foreign key(room) references Room , 
type varchar(50) , 
birthdate datetime , 
age as (YEAR(CURRENT_TIMESTAMP) - YEAR(birthdate))
);


--Admin(admin_id, no_of_guests_allowed,salary)
create table Admin
(
admin_id int ,
Primary key(admin_id),
no_of_guests_allowed int check(no_of_guests_allowed>0)  default 30,
salary decimal(10,2),
foreign key(admin_id) references Users on delete cascade on update cascade
);


-- Guest(guest_id, guest_id,address,arrival_date,departure_date,residential)
Create table Guest(
guest_id int primary key REFERENCES Users on delete cascade on update cascade,
guest_of int REFERENCES Users ,
address varchar(50) ,
arrival_date datetime ,
departure_date datetime ,
residential  varchar(50) ,
);



--Task(Task_id, name, creation_date, due_date, category, creator, status,reminder_date, priority)
Create table Task(
Task_id int primary key identity, 
name varchar(50) not null, 
creation_date datetime not null, 
due_date datetime not null, 
category varchar(50) not null, 
creator int not null,
status Varchar(20) default 'not done',
reminder_date datetime, 
priority int not null,
foreign key (creator) references Admin(admin_id) 
);



--Assigned_to(admin_id,task_id,user_id)
Create table Assigned_to(
admin_id int,task_id int,user_id int,
primary key(admin_id,task_id,user_id),
foreign key (admin_id) references Admin(admin_id) ,
foreign key (task_id) references task on delete cascade on update cascade,
--
foreign key (user_id) references Users on delete cascade on update cascade 
);

--Introducing FOREIGN KEY constraint 'FK__Assigned___task___57DD0BE4' on table 'Assigned_to' may cause cycles or multiple cascade paths. Specify ON DELETE NO ACTION or ON UPDATE NO ACTION, or modify other FOREIGN KEY constraints.
--Calendar(event_id,user_assigned_to , name, description, location, reminder_date)

Create table Calendar(
event_id int ,
user_assigned_to int , 
name varchar (50), 
description varchar(250), 
location varchar(50), 
reminder_date datetime,
primary key(event_id,user_assigned_to),
foreign key (user_assigned_to) references Users on delete cascade on update cascade
);
--Notes(id, user_id, content, creation_date, title)
create table Notes(
id int  primary key , 
user_id int, 
content varchar(500), 
creation_date datetime, 
title varchar(50)
Foreign key (user_id) references Users
);

--Travel(trip_no, hotel_name, destination, ingoing_flight_num, outgoing_flight_num,
--ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport,
--outgoing_flight_airport, transport)

create table Travel(
trip_no int primary key , 
hotel_name varchar(50)  , 
destination varchar(50)  ,
ingoing_flight_num Varchar(30) ,
outgoing_flight_num Varchar(30)  ,
ingoing_flight_date datetime  , 
outgoing_flight_date datetime  , 
ingoing_flight_airport varchar(50)  ,
outgoing_flight_airport varchar(50)  , 
transport varchar(50)  

);


--User_trip(trip_no, user_id, hotel_room_no,
---------------
--in_going_flight_seat_number, out_going_flight_seat_number)

create table User_trip(
trip_no int, 
user_id int, 
hotel_room_no int not null,
in_going_flight_seat_number int not null,
out_going_flight_seat_number int not null,
primary key(trip_no, user_id),
foreign key (trip_no) references Travel on update cascade on delete cascade,
foreign key (user_id) references Users on update cascade on delete cascade
);

--foreign key only
create table Finance(
payment_id int identity primary key, 
user_id int , 
type varchar (50) , 
amount decimal(13,2) , 
currency int , method varchar(50) default 'Bank transfer',
status varchar(50) , 
date datetime, 
receipt_no int , 
deadline datetime , 
penalty int 
foreign key (user_id) references Users 
);
--foreign key only
create table Health(
date datetime, 
activity varchar(50), 
user_id int, 
hours_slept int default 0, 
food varchar(50) not null,
primary key(date, activity),
foreign key (user_id) references Users 
);
--leave it as it is or decided what to do when updating and deleting
Create table Communication(
message_id int primary key identity,
sender_id int,
receiver_id int,
foreign key(sender_id) references Users, 
foreign key(receiver_id) references Users, 
content varchar(200) not null, 
time_sent time, 
time_received time,
time_read time,
title varchar(50)
);
--
create table Device(
device_id int primary key ,
room int ,
foreign key(room) references Room,
type varchar(50),
--1 used 0 not used
status varchar(20) default 'Operational', 
battery_status int default 0 not null
);

Create table RoomSchedule(
creator_id int,
action varchar(50) not null, 
room int ,
start_time datetime ,
end_time datetime not null,
foreign key(creator_id) references Users on delete cascade on update cascade,
foreign key(room) references Room ,
primary key(creator_id,start_time )
);

create table Log(
room_id int,
device_id int, 
user_id int, 
activity varchar(50) default 'watching',
date datetime , 
duration Varchar(50) default '1 hour',
primary key(room_id, device_id,user_id,date),
foreign key(room_id) references Room on delete cascade on update cascade,
foreign key(device_id) references Device on delete cascade on update cascade,
foreign key(user_id) references Users on delete cascade on update cascade,
);

Create table Consumption(
device_id int, 
consumption int default 0 not null,
date datetime,
primary key(device_id, date),
foreign key(device_id) references Device on delete cascade on update cascade

);


create table Preferences(
user_id int, 
category varchar(50) not null,
preference_no int  ,
content varchar(50) default null,
primary key(user_id,preference_no),
foreign key(user_id) references Users on delete cascade on update cascade,
);


create table Recommendation(
Recommendation_id int identity primary key, 
user_id int , 
category varchar(50) not null, 
preference_no int, 
Content varchar(50) not null
FOREIGN KEY (user_id,preference_no) REFERENCES Preferences,

);

create table Inventory(
supply_id int primary key, 
name varchar(50) not null, 
quantity int default 0 , 
expiry_date datetime not null , 
price decimal(10,2) default 0,
manufacturer varchar(50) not null,
category varchar(50) not null 
);
 create table Camera
 (monitor_id int identity primary key, 
 camera_id int not null,
 room_id int,
 FOREIGN KEY (room_id) REFERENCES Room
 );

 -- question 1 part 1




--DROP TABLE IF EXISTS Assigned_to, Admin, Calendar, Camera, Communication, Consumption, Device, Finance, Guest, Health, Inventory, Log, Notes, Preferences, Recommendation, Room, RoomSchedule, Task, Travel, User_trip, Users;
