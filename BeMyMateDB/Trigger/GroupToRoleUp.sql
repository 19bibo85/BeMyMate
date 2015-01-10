CREATE TRIGGER [GroupToRoleUp]
	ON [Security].[GroupToRole]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[GroupToRole]
		SET dtUpdated = GETDATE() 
		WHERE 
		groupId IN (SELECT DISTINCT groupId FROM INSERTED) and 
		roleId IN (SELECT DISTINCT roleId FROM INSERTED);
	END
