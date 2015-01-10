CREATE TRIGGER [GroupToRoleDel]
	ON [Security].[GroupToRole]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[GroupToRole]
		SET dtDeleted = GETDATE() 
		WHERE 
		groupId IN (SELECT DISTINCT groupId FROM DELETED) and 
		roleId IN (SELECT DISTINCT roleId FROM DELETED);
	END
