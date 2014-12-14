CREATE TRIGGER [ProfileQuestionnaireToAnswerUp]
	ON [User].[ProfileQuestionnaireToAnswer]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @questionnaireId INT = (SELECT questionnaireId FROM INSERTED);
		DECLARE @answerId INT = (SELECT answerId FROM INSERTED);		
        UPDATE [User].[ProfileQuestionnaireToAnswer]
		SET dtUpdated = GETDATE() 
		WHERE questionnaireId = @questionnaireId and answerId = @answerId;
	END
