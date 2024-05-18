CREATE TRIGGER update_seat_count
ON [dbo].[Passenger]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Status) AND EXISTS (
        SELECT 1 FROM INSERTED WHERE Status = 0
    )
    BEGIN
        UPDATE R
        SET R.SeatCount = R.SeatCount - 1
        FROM [dbo].[Reservation] R
        INNER JOIN INSERTED I ON R.ID = I.ReservationID
        WHERE I.Status = 0;
    END
END;