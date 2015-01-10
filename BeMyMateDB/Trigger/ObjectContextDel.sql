CREATE TRIGGER [ObjectContextDel]
	ON [Application].[ObjectContext]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[ObjectContext]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
