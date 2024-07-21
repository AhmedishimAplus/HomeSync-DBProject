use Miestone2
-- AHmed Tamer eli shalo
--Abdullah Khamis el 7aramy


--Question 1 Part 1
declare @user_id int
exec UserRegister 'Admin','ohyea3@gmail.com','islam2','hamada2','2005-08-24','ay7aga2', @user_id OUTPUT
print @user_id

--guest
declare @user_id int
exec UserRegister 'Guest','ohyea2@gmail.com','islam','hamada','2005-08-23','ay7aga',@user_id OUTPUT
print @user_id

--Question 2 Part 1 need work
declare @user_id int
declare @success bit
exec UserLogin 'ohyea3@gmail.com','ay7aga2',@success output,@user_id output


--Question 2 part 2
  
EXEC ViewProfile 4;
--admin check
--show no, salary
DECLARE @user_id int = 1;  
EXEC ViewProfile @user_id;


--Question 2 part 3





--Question 2 part 4
DECLARE @user_id int = 1;
EXEC ViewMyTask @user_id;

--Question 2 part 5
DECLARE @user_id int = 3;
DECLARE @title varchar(50) ='Grocery shopping';
EXEC FinishMyTask @user_id,@title;

--Question 2 part 6
DECLARE @user_id int = 2;
DECLARE @creator int = 1;
EXEC ViewTask @user_id,@creator;

--Question 2 part 7
DECLARE @device_id int = 4;
DECLARE @charge int;
DECLARE @location int;

EXEC ViewMyDeviceCharge @device_id, @charge OUTPUT, @location OUTPUT;







--Question 2 part 8
DECLARE @user_id int 
DECLARE @room_id int 

EXEC AssignRoom 1, 1;


--Question 2 part 9

  
 EXEC CreateEvent 3,4,'MOVIES','WATCHING SUITS','SALON','2023-08-23',5
 --with null other user
  EXEC CreateEvent 1,2,'Game','Rainbow Six Siege','Bedroom','2023-08-23',null

 --Question 2 part 10
DECLARE @event_id Int = 1,
 @user_id int = 2
EXEC AssignUser @user_id , @event_id



 --Question 2 part 11

EXEC AddReminder 1 , '2023-12-01 12:00:00'



--Question 2 part 12

 EXEC Uninvited 2,3



--Question 2 part 13

   
EXEC UpdateTaskDeadline '2023-12-02 12:00:00',3
--------------------------------------------------------------------------

--mohamed Abdelaziz
--q14
insert into Calendar values(3,2,'siu','ay7aga','m1 105','2023-12-12');
 exec  ViewEvents 2 , 1
 --with event id null
 exec  ViewEvents 2 , null

 --q15
 insert into Preferences (preference_no,user_id , category , content)
 values (1,1,'Z3bola','a-class');

 insert into Preferences (preference_no,user_id , category , content)
 values (2,2,'Z3bola el 2ola','b-class');

 insert into Recommendation(user_id ,category,preference_no,Content)
 values (1,'3baaaas',1 ,'c-class');

  insert into Recommendation(user_id ,category,preference_no,Content)
 values (2,'3baaaas',2 ,'c-class');

 exec ViewRecommendation 

 --q16
 exec CreateNote 1,1,'a','aaa','2004-01-11'


 --q17 
 exec  ReceiveMoney 1,'beb',20000,'done','2004-01-11'

 --q18

 exec PlanPayment 1, 2 , 5000.00,'Pending', '2023-12-12'


 --q19
 exec SendMessage 1,2,'title','bio','01:25:15','01:25:17'


 --q20 
 exec NoteTitle 1,'ana ana ana ebre2 el shay'


 --21 
 exec ShowMessages 2,1

 --q3(1)
 exec ViewUsers 'Admin'
exec ViewUsers 'Guest'

--q3(2)
exec RemoveEvent 1,2

--q3(3)
exec CreateSchedule 1,1 , '2007-01-15' , '2007-01-11' , 'z3bola'

--q3(4)

declare @number_of_allowed_guests int 
exec GuestRemove 9,3, @number_of_allowed_guests output



--q3(5)

exec RecommendTD 10, 'Ibiza', 19 , 1


--q3(6)
insert into Camera values (1,1) 
insert into Camera values (2,2)
exec Servailance 1,1,1
---------------------------------------------------------------------------

--Ahmed Tamer

--question 3 part 7
exec RoomAvailability 1,'Available'

--question 3 part 8
exec  Sp_Inventory 1,'Milk',3,'2025-12-12',5.99,'juhayna','dairy product'

--question 3 part 9
declare @total_price decimal(10,2)
exec Shopping 1 ,3, @total_price output
print @total_price

--question 3 part 10
exec LogActivityDuration 1,1,1,'2023-11-11','2 hours'

-- question 3 11
insert into Consumption values(1,60,'2023-12-12');
exec TabletConsumption 1

--question 3 12 
insert into Users values('Will','Smith','1234','keepmywifesnameoutofyourmouth@gmail.com',null,7,'Guest','1970-5-5');

exec MakePreferencesRoomTemp 11 ,'Room', 1

--question 3 13
--test
insert into log values(1,1,1,'yes','2023-07-23','1 hour');
insert into log values(2,2,2,'yes','2023-07-23','1 hour');
insert into log values(2,2,1,'yes','2023-07-23','1 hour');
exec  ViewMyLogEntry 1

--question 3 14
exec UpdateLogEntry 1,1,1,'No'
--question 3 15
 exec ViewRoom
 --question 3 16
 insert into RoomSchedule values(1,'sleep',1,'07:07:07','07:07:07');
 insert into RoomSchedule values(1,'Dance',2,'06:07:07','07:07:07');
 insert into Log values(1,1,1,'Sleep','2023-07-23','7 hours');
  insert into Log values(2,1,1,'Dance','2023-11-23','7 hours');
 exec ViewMeeting 3,1

 --question 3 17
 exec  AdminAddTask 5,2,'Mopping','work related',1,'not done','2023-12-1','2023-12-2',4

 exec  AdminAddTask 1,3,'Walking Dog','Personal',1,'not done','2023-12-1','2023-12-2',null
 --question 3 18
declare
@number_of_allowed_guests int
 exec AddGuest 'a@gmail.com','a','wewe','aws',5,5,@number_of_allowed_guests output

 --delete from Users where id=17

  --question 3 19
  exec AssignTask 1,1,1
  -------------------------------------------------------------------------
  -- Badr Mohamed
  
SELECT * 
FROM Travel
--20)--
EXEC DeleteMsg 



SELECT * 
FROM Finance
INSERT INTO Finance VALUES(2, 'ADADA', 12.3, 2,'Bank transfer','SADA', '2023-12-22', 24321, '2023-12-20', 500);
--21)--
EXEC AddItinerary 1,'TAMER', '2023-12-22' , 'GEES TOWN'
--22)--
INSERT INTO TRAVEL VALUES (119,'TULIP','KAFRSHOKR','BOENG12','DFGHJ','2020-12-30','2021-12-30','MITDEMBUS','MITDEMAOUTO','BATATES');
INSERT INTO TRAVEL VALUES (911,'TULIP','KAFRSHOKR','BOENG12','DFGHJ','2020-12-30','2021-12-30','MITDEMBUS','MITDEMAOUTO','BATATES');
EXEC ChangeFlight --aint done yet--
--23)--
EXEC UpdateFlight  '2023-12-22','GESS TOWN'
--24)--
EXEC AddDevice 6, 'Operational' , 78 , 1 , 'Speakers'
--25)--
EXEC OutOfBattery
--26)--
EXEC Charging
--27)--
EXEC GuestsAllowed 1,5
--28)--
EXEC Penalize 500
--29)--
declare @number int
EXEC GuestNumber 1,@number output
print @number

--30)--
EXEC Youngest
--31)--
EXEC AveragaPayment 2000
--32)--
EXEC dsfs
--33)--
EXEC NeedCharge
--34)--
EXEC Admins;
--for us
declare @type varchar (20)
exec GetType 6,@type output
print @type

--counting admin and guest for delete method
declare @counter int

exec  CountGuestandAdmin 6,3, @counter output
print @counter