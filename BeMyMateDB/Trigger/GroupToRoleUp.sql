CREATE TRIGGER [GroupToRoleUp]
	ON [Security].[GroupToRole]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @groupId INT = (SELECT groupId FROM INSERTED);
		DECLARE @roleId INT = (SELECT roleId FROM INSERTED);		
        UPDATE [Security].[GroupToRole]
		SET dtUpdated = GETDATE() 
		WHERE groupId = @groupId and roleId = @roleId;
	END
