drop database OrderDb

create database OrderDb

use OrderDb

create table Customers
(CId int primary key identity(101,1),
FName nvarchar(50) not null,
LName nvarchar(50) not null
)

insert into Customers(FName, LName) values('Heer','Kapoor'),
('Meher','Khanna'),
('Aarohi','Keshav')

create table Orders
(OId int primary key identity(1001,2),
ODate datetime,
TotalAmt float,
CId int foreign key (CId) references Customers (CId)
)

insert into Orders (ODate,TotalAmt,CId) values ('12/12/2022 11:15:00',150.00,101),
('02/02/2023 16:30:45',250.99,102),
('05/05/2023 20:20:20',350.99,103)

select * from Customers

select * from Orders

-----------------------------------------------
create proc pro_PlaceOrder
@cid int,
@totalamt float
as 
begin
declare @orderId int
insert into Orders (CId, ODate, TotalAmt)
values (@cid, GETDATE(), @totalamt)
set @orderId = SCOPE_IDENTITY()
select @orderId as OrderId
end

exec pro_PlaceOrder
@cid = 103,
@totalamt = 500.95

select * from Orders

