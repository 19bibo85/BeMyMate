CREATE TRIGGER [ProfileAnswerDel]
	ON [User].[ProfileAnswer]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[ProfileAnswer]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
