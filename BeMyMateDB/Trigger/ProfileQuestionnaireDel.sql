CREATE TRIGGER [ProfileQuestionnaireDel]
	ON [User].[ProfileQuestionnaire]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[ProfileQuestionnaire]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
