CREATE TRIGGER [RoleToUserUp]
	ON [Security].[RoleToUser]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[RoleToUser]
		SET dtUpdated = GETDATE() 
		WHERE 
		roleId IN (SELECT DISTINCT roleId FROM INSERTED) and 
		userId IN (SELECT DISTINCT userId FROM INSERTED);
	END
