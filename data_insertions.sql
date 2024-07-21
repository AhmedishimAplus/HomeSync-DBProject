use Miestone2
-- 7 rooms
--Seven Rooms: five bedrooms, a living room, a kitchen, and garden.
-- 5 bedrooms
insert into Room values('bedroom', 1,'Available');
insert into Room values('bedroom',2,'Available');
insert into Room values('bedroom',3,'Available');
insert into Room values('bedroom',4,'Available');
insert into Room values('bedroom',5,'Available');

--living room
insert into Room values('living room',1,'Available');

--kitchen
insert into Room values('kitchen',1,'Available');

--garden
insert into Room values('garden',1,'Available');

--Ten users five admins and five guests.
--user admins
insert into Users values('Ahmed','Tamer','1234','ahmedtamer@gmail.com',null,1,'Admin','2002-7-23');
insert into Users values('Mohamed','wael','1234','mohamedw@gmail.com',null,2,'Admin','1990-09-01');
insert into Users values('Badr','Elkashif','1234','badrsad@gmail.com',null,4,'Admin','2004-10-14');
insert into Users values('Abdullah','Khamis','1tyip','abdolord@gmail.com',null,6,'Admin','2004-07-28');
insert into Users values('John','Mike','1234','Hello@yahoo.com',null,7,'Admin','2005-5-5');
--Guest users
insert into Users values('Mariam','fathalla','1234','Memo@gmail.com','Sea view',4,'Guest','1990-07-01');
insert into Users values('Grace','Miller','coolpass','grace.miller@gmail.com','Non-smoking',1,'Guest','1992-07-18');
insert into Users values('Michael','Jones','userSafePwd','michael.jones@icloud.com','Pet-friendly',2,'Guest','1993-06-08');
insert into Users values( 'John', 'Doe', 'password123', 'john.doe@yahoo.com', 'Non-smoking', 6, 'Guest', '1990-05-15');
insert into Users values('Mohamed','Abdelaziz','1234','Mohabd@gmail.com',null,7,'Guest','2005-5-5');
 -- admin table
insert into Admin values(1,3,20000);
insert into Admin values(2,5,2000);
insert into Admin values(3,2,100);
insert into Admin values(4,3,5000);
insert into Admin values(5,5,20000);
-- guests
 insert into Guest values(6,3,'Madinty','2023-11-30','2023-12-30','Resort');
 insert into Guest values (7, 1,'Shorouk','2023-11-25','2023-11-30','Hotel');
 insert into Guest values(8, 2,'Maadi','2023-11-23','2023-11-24','Hotel');
 insert into Guest values(9,4,'Madinty','2023-11-30','2023-12-30','Resort');
insert into Guest values  (10,5,'Madinet nasr','2023-11-26','2023-12-05','Resort');
--personal use

--updating room
update Room
set status = 'Used'
where room_id in(1, 2, 4, 6,7);
-- tasks
insert into Task Values('Report','2023-11-24','2023-11-27','Work related',1,'Done','2023-11-25',1);
insert into Task Values('peresentation','2023-11-23','2023-11-25','Work related',2,'not done','2023-11-24',2);
insert into Task Values('Grocery shopping','2023-11-23','2023-11-25','Personal',3,'almost done','2023-11-24',3);

--assigned to
insert into Assigned_to values(1,1,2);
insert into Assigned_to values(2,2,4);
insert into Assigned_to values(3,3,3);

-- event
insert into Calendar values(1,2,'Complete report','about Rooms','office 305','2023-11-25');
insert into Calendar values(2,3,'Grocery shopping','Ran out of Grocery','Gourmet','2023-11-24');

-- devices
INSERT INTO Device VALUES
  ( 1,1, 'Tablet', 'Not operational', 0),
  ( 2,1, 'Smart TV',' Not operational', 0),
  ( 3,1, 'Light Sensor', 'Not operational', 0),
  ( 4,4, 'Security Camera', 'Operational', 75),
  ( 5,5, 'Smart Lock', 'Not operational', 50);

 