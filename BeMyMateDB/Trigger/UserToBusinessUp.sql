CREATE TRIGGER [UserToBusinessUp]
	ON [User].[UserToBusiness]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @userId INT = (SELECT userId FROM INSERTED);
		DECLARE @businessId INT = (SELECT businessId FROM INSERTED);
        UPDATE [User].[UserToBusiness]
		SET dtUpdated = GETDATE() 
		WHERE userId = @userId and businessId = @businessId
	END
