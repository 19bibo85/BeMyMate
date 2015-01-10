CREATE TRIGGER [UserToNationalityUp]
	ON [User].[UserToNationality]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToNationality]
		SET dtUpdated = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM INSERTED) and 
		nationalityId IN (SELECT DISTINCT nationalityId FROM INSERTED);
	END
