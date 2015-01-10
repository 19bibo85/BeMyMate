CREATE TRIGGER [RoleToUserDel]
	ON [Security].[RoleToUser]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[RoleToUser]
		SET dtDeleted = GETDATE() 
		WHERE 
		roleId IN (SELECT DISTINCT roleId FROM DELETED) and 
		userId IN (SELECT DISTINCT userId FROM DELETED);
	END
