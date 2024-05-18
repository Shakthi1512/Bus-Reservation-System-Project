CREATE PROCEDURE [dbo].[CompleteReservation]
	@p_UserID NVARCHAR (10),
	@p_RotuteID int = 0,
	@p_BusID NVARCHAR (10),
	@p_JoruneyDate NVARCHAR (20),
	@p_SeatCount int = 0,
	@p_Status int = 1,
	@p_passengers AS dbo.PassengerType READONLY

AS
BEGIN
	DECLARE @new_ReservationID int;

	INSERT INTO Reservation (UserID, RouteID, BusID, JourneyDate, SeatCount, Status) VALUES (@p_UserID, @p_RotuteID, @p_BusID, @p_JoruneyDate, @p_SeatCount, @p_Status);

	SET @new_ReservationID = SCOPE_IDENTITY();

	INSERT INTO Passenger (ReservationID, Name, Age, Sex, Mobile, SeatNumber, Status)
	SELECT @new_ReservationID, Name, Age, Sex, Mobile, SeatNumber, Status
	FROM @p_passengers;
END