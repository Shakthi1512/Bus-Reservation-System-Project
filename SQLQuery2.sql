CREATE TYPE dbo.PassengerType AS TABLE
(
    Name NVARCHAR(30),
    Age INT,
    Sex NVARCHAR(10),
    Mobile NVARCHAR(10),
    SeatNumber NVARCHAR(10),
    Status INT
);