use Miestone2
--Abdullah
--q1 part 1
-- check guest part
go
CREATE PROCEDURE UserRegister
    @usertype varchar(20),
    @email varchar(50),
    @first_name varchar(20),
    @last_name varchar(20),
    @birth_date datetime,
    @password varchar(10),
    @user_id int output
AS
BEGIN
   if(@usertype='Admin')
    begin
    --insert into users
        INSERT INTO Users (f_Name, l_Name, password, email, type, birthdate)
        VALUES (@first_name, @last_name, @password, @email, @usertype, @birth_date);
        select @user_id=id
        from Users
        where f_Name=@first_name
        and l_name= @last_name
        and type=@usertype
        and password=@password
        and email= @email
        and birthdate = @birth_date 
        -- insert into admin
        insert into Admin(admin_id)
        values(@user_id);
    end
    if(@usertype='Guest')
    begin
     --insert into users
        INSERT INTO Users (f_Name, l_Name, password, email, type, birthdate)
        VALUES (@first_name, @last_name, @password, @email, @usertype, @birth_date);
        select @user_id=id
        from Users
        where f_Name=@first_name
        and l_name= @last_name
        and type=@usertype
        and password=@password
        and email= @email
        and birthdate = @birth_date 
        -- insert into admin
        insert into Guest(guest_id)
        values(@user_id);
        end
  
END

--Question 2 Part 1
--drop procedure UserLogin
go
CREATE PROCEDURE UserLogin
    @email varchar(50),
    @password varchar(10),
    @success bit OUTPUT,
    @user_id int OUTPUT
AS
BEGIN
    declare @temp int
     IF EXISTS (SELECT * FROM Users WHERE email = @email AND password = @password)
        BEGIN
            SET @success = 1;
            SELECT @temp = id FROM Users WHERE email = @email AND password = @password;
            set @user_id=@temp
            
        END
else
begin
set @success=0
set @user_id=-1
end
print @user_id
print @success
END;



--Question 2 part 2
--INNER JOIN WITH USER
go
 CREATE PROCEDURE ViewProfile
    @user_id int
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Admin WHERE admin_id = @user_id)
    BEGIN
        -- User is an admin, show all details including salary and no_of_guests_allowed
        SELECT U.*, A.no_of_guests_allowed, A.salary
        FROM Users U
        INNER JOIN Admin A ON U.id = A.admin_id
        WHERE U.id = @user_id;
    END
    ELSE
    BEGIN
        -- User is not an admin, show details without salary and no_of_guests_allowed
        SELECT U.*
        FROM Users U
        WHERE U.id = @user_id;
    END
END;






-- Question 2 part 3
--ORDER BY AGE





-- Question 2 part 4
go
CREATE PROCEDURE ViewMyTask
@user_id int
AS
BEGIN
IF EXISTS (SELECT @user_id FROM Assigned_to WHERE user_id = @user_id) 
    begin
    SELECT t.*
    FROM Task t inner join Assigned_to a on t.Task_id =a.task_id
    WHERE a.user_id = 2
    end
else
begin
Print'no assignedtask'
end
END;    
--drop PROCEDURE ViewMyTask


--Question 2 part 5
go
CREATE PROCEDURE FinishMyTask
@user_id int,
@title varchar(50)
AS
BEGIN
    Update Task 
    set status ='Task Done'
    from Task inner join Assigned_to on
    Task.Task_id = Assigned_to.task_id
    where Assigned_to.user_id = @user_id and Task.name = @title;
    
    end;
--drop proc FinishMyTask
--Question 2 part 6
--DESC ORDER IS MISSING
go
CREATE PROCEDURE ViewTask
    @user_id int,
    @creator int
AS 
BEGIN
    
    select t.* ,a.user_id 
    from Task t inner join Assigned_to a on t.Task_id=a.task_id
    where t.creator=@creator and @user_id=a.user_id
    order by t.creation_date desc
END;
--drop PROCEDURE ViewTask
--Question 2 part 7

--drop procedure ViewMyDeviceCharge
go
CREATE PROCEDURE ViewMyDeviceCharge 
 
 @device_id int,
 @charge int OUTPUT,
 @location int OUTPUT

AS
BEGIN
    
 SELECT @charge = battery_status,
   @location = room
    FROM Device
    WHERE device_id = @device_id;
    PRINT @charge;
PRINT @location;
END



--Question 2 part 8


go
CREATE PROCEDURE AssignRoom
    @user_id int,
    @room_id int
AS
BEGIN
    
    IF EXISTS (SELECT room_id FROM Room WHERE room_id = @room_id AND status = 'Available')
    BEGIN
      
        UPDATE Room
       SET status = 'Used'
        WHERE room_id = @room_id;

        UPDATE Users
        SET room = @room_id
        WHERE id = @user_id;
    END
END
--drop procedure AssignRoom

--Question 2 part 9
--problem with @otherUser
--EMAIL NADA
go
CREATE PROCEDURE CreateEvent 
    @event_id Int,
    @user_id int, 
    @name varchar(50), 
    @description varchar(200), 
    @location varchar(40),
    @reminder_date datetime ,
    @other_user_id int

 as 
 begin
    insert into Calendar(event_id,user_assigned_to,name,description,location,
    reminder_date)
    values (@event_id, @user_id, @name, @description, @location,@reminder_date)
  --checks if the other user is not null
     if(@other_user_id is not null)
     begin
     insert into Calendar(event_id,user_assigned_to,name,description,location,
    reminder_date)
       values (@event_id, @other_user_id, @name, @description, @location,@reminder_date)
     end

 end
 -- drop PROCEDURE CreateEvent 

 --Question 2 part 10
 go
CREATE PROCEDURE AssignUser
    @user_id int , 
    @event_id int
AS
BEGIN
    -- Update only the first occurrence of the event with the user ID
    UPDATE Calendar
    SET user_assigned_to = @user_id
    WHERE event_id = @event_id
    AND user_assigned_to = (
        SELECT MIN(user_assigned_to) -- Select the minimum ID for the first occurrence of the event
        FROM Calendar
        WHERE event_id = @event_id
    );

    -- Return the updated row
    SELECT *
    FROM Calendar
    WHERE event_id = @event_id AND user_assigned_to = @user_id;
END
 -- drop PROCEDURE AssignUser 

 --Question 2 part 11
 go
CREATE PROCEDURE AddReminder
@task_id int,
@reminder datetime
AS
BEGIN
  
    UPDATE Task
    SET reminder_date = @reminder
    WHERE Task_id = @task_id;
END;
 

 --Question 2 part 12
 go
CREATE PROCEDURE Uninvited
@event_id int, 
@user_id int
AS
BEGIN
     
    update 
     Calendar
    set description = 'uninvited'
    WHERE user_assigned_to=@user_id
    AND event_id=@event_id

END

-- drop proc Uninvited



 --Question 2 part 13
 go
CREATE PROCEDURE  UpdateTaskDeadline
@deadline datetime, 
@task_id int
AS 
BEGIN
    UPDATE Task
    SET due_date = @deadline
    WHERE Task_id = @task_id
    


END
-----------------------------------------------------------------------

--Mohamed Abdelaziz
--q 14

GO
CREATE PROCEDURE ViewEvents 
@User_id int, @Event_id int 
AS 

begin 
if (@Event_id IS null) 
begin 

SELECT * from Calendar
where user_assigned_to = 2
Order by reminder_date
end

else
begin
SELECT * from Calendar
where user_assigned_to = @User_id and event_id = @Event_id
Order by reminder_date
end 
end

--drop procedure ViewEvents

--q15
GO
CREATE Procedure ViewRecommendation
AS
begin
SELECT u.f_Name,u.l_name  from Users u 
left outer join Preferences p on p.user_id = u.id

where   p.user_id IS NULL;
end

--drop procedure ViewRecommendation

--q16
GO

CREATE PROCEDURE CreateNote
    @User_id INT, @note_id INT, @title VARCHAR(50), @Content VARCHAR(500), @creation_date DATETIME
AS 
begin
    INSERT INTO Notes (user_id, id, title, Content, creation_date)
    VALUES (@User_id, @note_id, @title, @Content, @creation_date);
end


--q17
GO
CREATE PROCEDURE ReceiveMoney
    @Sender_id INT, @type VARCHAR(30), @amount decimal(13,2), @status VARCHAR(10), @date DATETIME
AS 
begin
    INSERT INTO Finance (user_id,type ,amount ,status ,date )
    VALUES (@Sender_id, @type, @amount, @status, @date);
end


--q18
GO
CREATE PROCEDURE  PlanPayment
    @Sender_id INT, @receiver_id INT, @amount decimal(13,2),@status varchar(10), @deadline DATETIME
AS 
begin
--sender
    INSERT INTO Finance (user_id,  type ,amount ,status ,deadline )
    VALUES (@Sender_id,'Sending ', @amount, @status, @deadline);
    --reciever
    INSERT INTO Finance (user_id,  type ,amount ,status ,deadline )
    VALUES (@receiver_id, 'Recieved ', @amount, @status, @deadline);
end

--drop proc PlanPayment

--q19

GO
CREATE PROCEDURE   SendMessage
    @sender_id int, @receiver_id int, @title varchar(30), @content Varchar(200), @timesent time, @timereceived time
AS 
begin
    INSERT INTO Communication (Sender_id, receiver_id ,  title ,content ,time_sent ,time_received )
    VALUES (@Sender_id,@receiver_id, @title, @content, @timesent, @timereceived);
end



--q20
GO
CREATE PROCEDURE   NoteTitle
    @user_id int,@note_title varchar(50)
AS 
begin
    update Notes 
    set title = @note_title
    where user_id = @user_id
end


--q21/
GO
CREATE PROCEDURE ShowMessages
    @user_id INT,@sender_id INT
AS 
begin 
    SELECT * 
    FROM Communication
    WHERE  receiver_id = @user_id AND sender_id = @sender_id;
end




--q3(1)
GO
CREATE PROCEDURE ViewUsers
    @user_type VARCHAR(20)
AS 
begin 
    SELECT * 
    FROM Users
    WHERE type = @user_type;
end



--q3(2)
GO
CREATE PROCEDURE RemoveEvent
    @event_id int , @user_id int
AS
begin 
  delete  from Calendar
    WHERE event_id = @event_id AND user_assigned_to = @user_id;
end


--q3(3)/
GO
CREATE PROCEDURE   CreateSchedule
     @creator_id int, @room_id int, @start_time datetime, @end_time datetime, @action varchar(20)
AS 
begin
    INSERT INTO RoomSchedule(creator_id, room ,  start_time ,end_time ,action  )
    VALUES (@creator_id, @room_id, @start_time, @end_time, @action);
end

--drop procedure CreateSchedule
--q3(4)
GO

CREATE procedure GuestRemove
    @guest_id INT,@admin_id INT ,  @number_of_allowed_guests int output
AS
BEGIN 
  if exists(select * from Guest where @admin_id=guest_of and @guest_id=guest_id)
  begin
  delete from Guest where @guest_id =guest_id
    delete from Users where id=@guest_id
    end
end

--drop procedure GuestRemove
 
--q3(5)
go
create proc RecommendTD
 @Guest_id int, @destination varchar(10), @age int , @preference_no int
As
begin

declare @userage int
declare @type varchar (50)
--gets the age
Select @userage=U.age
from Users U inner Join Guest G on U.id = G.guest_id
where G.guest_id=@Guest_id

--gets the type
Select @type=U.type
from Users U inner Join Guest G on U.id = G.guest_id
where G.guest_id=@Guest_id


--if user under input age  we insert into table preferences and recommendation a travel destination
if (@userage<@age and @type='Guest')
begin
insert into Preferences values(@Guest_id,'Travel recommendation',@preference_no,@destination);
insert into Recommendation values(@Guest_id,'Travel recommendation',@preference_no,@destination);
end

end

--drop procedure RecommendTD







--q3(6)
GO 
CREATE PROCEDURE Servailance
    @user_id int, @location int,@camera_id int
    AS
    begin
    SELECT *
    FROM  Camera
    where    room_id = @location  and  camera_id = @camera_id and monitor_id = @user_id
    end
    
----------------------------------------------------------------------------

--Ahmed Tamer
-- question 3 part 7
go
CREATE PROCEDURE RoomAvailability
     @location INT, @status VARCHAR(40)
as
BEGIN
    UPDATE Room
    SET status = @status
    WHERE room_id = @location;
END 
go
--question 3 part 8
Create procedure  Sp_Inventory
@item_id int,@name varchar(30), @quantity int, @expirydate datetime, @price decimal(10,2),
@manufacturer varchar(30),@category varchar(20)
as 
begin
insert into Inventory values(@item_id,@name,@quantity,@expirydate,@price,
@manufacturer,@category)
end
--drop procedure Inventory1
--question 3 part 9
--needs work

Go

CREATE PROCEDURE Shopping
    @id int,
    @quantity int,
    @total_price decimal(10, 2) OUTPUT
AS
BEGIN
   
    DECLARE @item_price decimal(10, 2);

    -- Retrieve the item price based on the provided item ID
    SELECT @item_price = price
    FROM Inventory
    WHERE supply_id = @id;

    
    SET @total_price = @item_price * @quantity;
END;
 --drop proc Shopping

 --question 3 part 10
 go
 Create proc LogActivityDuration 
 @room_id int ,@device_id int, @user_id int,@date datetime, @duration varchar(50)
 as 
 begin
 Insert into Log (room_id,device_id , user_id , date , duration ) values(@room_id,@device_id,@user_id,
 @date,@duration);
 end

 go
 --question 3 11
 CREATE PROCEDURE TabletConsumption
    @consumption INT
as
BEGIN
    -- Update consumption for devices with type 'tablet'
    declare @counter int

    select @counter=count(type)
    from Device
    where type = 'Tablet'
  
    if(@counter=0)
    
    begin
    print 'no tablets found'
    end
    else
      UPDATE Consumption
    SET consumption = @consumption
    WHERE device_id IN (
        SELECT device_id
        FROM Device
        WHERE type = 'Tablet'
    );
END --drop proc TabletConsumption

--question 3 12 not done

go
create proc MakePreferencesRoomTemp
@user_id int ,@category varchar(20), @preferences_number int
as 
begin
declare @age int
--gets the age of the user
Select @age= age
from Users
where id=@user_id
--if age is more than 40 sets preference toom temprature to 30
if(@age>40)

begin
-- inserts values into prefrences table 

insert into preferences values(@user_id,@category,@preferences_number,'Room temp 30');
-- updates prefrence column in users table

update Users
set preference='Room temp 30'
where id=@user_id
end

end
--drop proc MakePreferencesRoomTemp

go
--question 3 13
create Proc ViewMyLogEntry
@user_id int
as 
begin
select *
from Log
where user_id=@user_id
end
 
 --question 3 14
 go
create Proc UpdateLogEntry
 @user_id int, @room_id int, @device_id int,@activity varchar(30)
 as
 begin
update Log
set activity=@activity
where user_id=@user_id and room_id=@room_id and device_id=@device_id
end

--question 3 15
go
create proc ViewRoom
as
begin
select *
from Room
where status = 'Available'
end
--drop proc ViewRoom
--question 3 16
go
create  proc ViewMeeting
@room_id int, @user_id int
as
begin
--checks if room is booked
if exists((select* from RoomSchedule where @user_id=creator_id and @room_id=room ))
begin

Select L.room_id, L.device_id, L.activity,L.date , L.duration
from Log L inner join Users U on L.user_id=U.id
where @room_id=L.room_id and L.user_id=@user_id

end 
else 
--if room is not bookes
begin
Select L.room_id, L.device_id, L.activity,L.date , L.duration
from Log L inner join Users U on L.user_id=U.id
where L.user_id=@user_id
end

end
--drop proc ViewMeeting
----question 3 17
go
Create proc AdminAddTask 
@user_id int , @creator int ,@name varchar(30), @category varchar(20), @priority Int,@status
varchar(20), @reminder datetime , @deadline datetime , @other_user int
as 
begin
--declarations
declare @todaysdate dateTime
declare @taskid int

--getting todays date
set @todaysdate= CURRENT_TIMESTAMP
insert into Task values(@name,@todaysdate,@deadline,@category,@creator,@status,
@reminder,@priority);

select @taskid=MAX(Task_id)
from Task

insert into Assigned_to values(@creator,@taskid,@user_id)
if(@other_user is not null)
begin
insert into Assigned_to values(@creator,@taskid,@other_user)
end
end
--drop  proc AdminAddTask
--question 3 18
go
create procedure AddGuest
@email varchar(30), @first_name varchar(10) ,@address varchar (30),@password varchar(30),
@guest_of int,@room_id int,  @number_of_allowed_guests int OUTPUT

as 
begin
 declare 
 @guest_id int
 
insert into Users (email,f_Name,password,room) values(@email,@first_name,@password,@room_id)

--loop to find guest id
select @guest_id=max(id) 
from Users

--inserting into guests
insert into Guest(guest_id,guest_of,address) values(@guest_id,@guest_of,@address)

--finding max allowed of guests
select @number_of_allowed_guests=no_of_guests_allowed
from Admin
where admin_id=@guest_of
 print @number_of_allowed_guests
end 
----drop  proc AddGuest
--question 3 19
go
create proc AssignTask
@user_id int , @task_id int , @creator_id int
as 
begin
insert into Assigned_to values(@creator_id,@task_id,@user_id);
end
---------------------------------------------------------------------------

--badr

--- 20) Delete last message sent.---
GO
CREATE PROCEDURE DeleteMsg
AS
BEGIN
    DECLARE @LASTMESSAGEID INT;
    SELECT @LASTMESSAGEID = MAX(message_id)
    FROM Communication;
    DELETE FROM Communication
    WHERE message_id = @LASTMESSAGEID;
   
    ---IDK IF I SHOULD DELETE EVERYTHING ASSOCIATED WITH THE LAST MESSAEGE---
END;

--DROP PROCEDURE DeleteMsg
--- 21) Add outgoing flight itinerary for a specific flight ---

GO
CREATE PROCEDURE AddItinerary @@trip_no int,@flight_num varchar(50) ,@flight_date datetime ,@destination varchar(50) 
AS
BEGIN 
INSERT INTO Travel (trip_no , outgoing_flight_num , outgoing_flight_date , destination)
   VALUES (@@trip_no ,@flight_num ,@flight_date ,@destination)
END;
  

--- 22) Change flight date to next year for all flights in current year --- 
GO
CREATE PROCEDURE ChangeFlight
AS
BEGIN
     UPDATE Travel
     SET ingoing_flight_date = DATEADD(YEAR,1, ingoing_flight_date)

      UPDATE Travel
     SET outgoing_flight_date = DATEADD(YEAR,1, outgoing_flight_date)
END;
--DROP PROCEDURE ChangeFlight
--- 23) Update incoming flights. ---

GO
CREATE PROCEDURE UpdateFlight @date datetime, @destination varchar(15)
AS
BEGIN
    UPDATE Travel
    SET ingoing_flight_date = @date,
        ingoing_flight_airport = @destination
    WHERE ingoing_flight_date = GETDATE();
END;


--- 24) Add a new device. ---

GO
CREATE PROCEDURE AddDevice @device_id int, @status varchar(20), @battery int,@location int, @type varchar(20)
AS
BEGIN
    INSERT INTO Device 
    VALUES (@device_id ,@location ,@type ,@status ,@battery);
END;
--drop procedure AddDevice

--- 25) Find the location of all devices out of battery. ---

GO
CREATE PROCEDURE OutOfBattery
AS
BEGIN

SELECT R.*,d.device_id
FROM Device d INNER JOIN Room R ON
d.room = R.room_id
WHERE
d.battery_status = 0;
END;
--DROP PROCEDURE OutOfBattery

--- 26) Set the status of all devices out of battery to charging. ---

GO 
CREATE PROCEDURE Charging
AS
BEGIN

UPDATE Device
SET status = 'Charging'
WHERE battery_status = 0;
END;

--- 27) Set the number of allowed guests for an admin. ---

GO
CREATE PROCEDURE GuestsAllowed @admin_id int,@number_of_guests int
AS
BEGIN
UPDATE Admin
SET no_of_guests_allowed = @number_of_guests
WHERE admin_id = @admin_id
END;

--- 28) Add a penalty for all unpaid transactions where the deadline has passed. ---

GO
CREATE PROCEDURE Penalize @Penalty_amount int
AS
BEGIN

UPDATE Finance
SET penalty = @Penalty_amount
WHERE status = 'unpaid' AND deadline <= GETDATE();
END;

--- 29) Get the number of all guests currently present for a certain admin. ---
GO
CREATE proc GuestNumber 
@admin_id INT,
@number int output
as

BEGIN
select @number =count(*)
from Guest
where arrival_date <CURRENT_TIMESTAMP and CURRENT_TIMESTAMP<departure_date and @admin_id=guest_of
end
--drop Procedure GuestNumber
--- 30)Get the youngest user in the system (hint : use limit). ---

GO
CREATE PROCEDURE Youngest
AS
BEGIN
   
    SELECT TOP 1*
    FROM Users
    ORDER BY age 
END;
--DROP PROCEDURE Youngest
--- 31) Get the users whose average income per month is greater then a specific amount. ---

GO
CREATE PROCEDURE AveragaPayment @amount decimal (10,2)
AS
BEGIN

  SELECT U.f_Name , U.l_Name
  FROM Admin A INNER JOIN Users U ON
  U.id = A.admin_id
  GROUP BY U.f_Name , U.l_Name
  HAVING AVG( A.salary) > @amount
  
  END;
  --DROP PROCEDURE AveragaPayment

  --- 33)
  GO
CREATE PROCEDURE NeedCharge
AS
BEGIN
    
    -- Insert room_ids with more than two devices having a dead battery into the result table
  
    SELECT D.room
    FROM Device D
    INNER JOIN Room R ON D.room = R.room_id
    WHERE D.battery_status=0 -- Assuming 'Operational' is the status for devices with dead batteries
    GROUP BY D.room
    HAVING COUNT(*) > 2;

    -- Select the result table
    
END;
--drop procedure NeedCharge
go
CREATE PROCEDURE Admins
AS
BEGIN
    
 SELECT U.f_Name,U.l_Name
FROM 
 Users U
inner  JOIN Guest UG ON UG.guest_of = U.id
WHERE UG.guest_of=U.id
GROUP BY U.f_Name,U.l_Name
HAVING COUNT(UG.guest_of) > 2;
   
END;
--drop procedure Admins

go
create proc GetType @user_id int , @type varchar(20) output
as
begin
select @type=type
from Users
where @user_id=id;

end
--drop proc GetType
go
create proc ViewRoomsFirst
@user_id int
as
begin
    select r.*
    from Room r
    inner join Users u on u.room = r.room_id -- Corrected join condition
    where u.id = @user_id;
end
go
create proc CountGuestandAdmin
@guestID int,
@adminID int,
@counter int output
as
Begin

Select @counter=count(*)
from Guest
where guest_id=@guestID and guest_of=@adminID
end



go
create procedure ViewTaskStatus
@task_id int
as
begin
    select status
    from Task
    where Task_id = @task_id
end

go
-- ViewRoomsFirst stored procedure



























