CREATE TRIGGER [PrivacyQuestionnaireToAnswerUp]
	ON [User].[PrivacyQuestionnaireToAnswer]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, questionnaireId INT, answerId INT);
		--INSERT INTO @TMP(i, questionnaireId, answerId)
		--SELECT ROW_NUMBER() OVER( ORDER BY questionnaireId, answerId) as 'i', questionnaireId, answerId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(questionnaireId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @questionnaireId INT = (SELECT questionnaireId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @answerId INT = (SELECT answerId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[PrivacyQuestionnaireToAnswer]
		--	SET dtUpdated = GETDATE() 
		--	WHERE questionnaireId = @questionnaireId and answerId = @answerId;

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[PrivacyQuestionnaireToAnswer]
		SET dtUpdated = GETDATE() 
		WHERE 
		questionnaireId IN (SELECT DISTINCT questionnaireId FROM INSERTED) and 
		answerId IN (SELECT DISTINCT answerId FROM INSERTED);
	END
