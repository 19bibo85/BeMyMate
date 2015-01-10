CREATE TRIGGER [ProfileQuestionnaireUp]
	ON [User].[ProfileQuestionnaire]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[ProfileQuestionnaire]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
