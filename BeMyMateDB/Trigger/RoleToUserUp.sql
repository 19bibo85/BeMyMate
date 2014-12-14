CREATE TRIGGER [RoleToUserUp]
	ON [Security].[RoleToUser]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @roleId INT = (SELECT roleId FROM INSERTED);
		DECLARE @userId INT = (SELECT userId FROM INSERTED);		
        UPDATE [Security].[RoleToUser]
		SET dtUpdated = GETDATE() 
		WHERE roleId = @roleId and userId = @userId;
	END
