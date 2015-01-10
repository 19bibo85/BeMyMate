CREATE TRIGGER [MessageToFileUp]
	ON [User].[MessageToFile]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[MessageToFile]
		SET dtUpdated = GETDATE() 
		WHERE 
		messageId IN (SELECT DISTINCT messageId FROM INSERTED) and 
		fileId IN (SELECT DISTINCT fileId FROM INSERTED);
	END
