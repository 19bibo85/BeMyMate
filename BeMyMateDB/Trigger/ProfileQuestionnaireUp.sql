CREATE TRIGGER [ProfileQuestionnaireUp]
	ON [User].[ProfileQuestionnaire]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[ProfileQuestionnaire]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
