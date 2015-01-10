CREATE TRIGGER [UserToNationalityDel]
	ON [User].[UserToNationality]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToNationality]
		SET dtDeleted = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM DELETED) and 
		nationalityId IN (SELECT DISTINCT nationalityId FROM DELETED);
	END
