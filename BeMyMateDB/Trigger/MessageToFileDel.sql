CREATE TRIGGER [MessageToFileDel]
	ON [User].[MessageToFile]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[MessageToFile]
		SET dtDeleted = GETDATE() 
		WHERE 
		messageId IN (SELECT DISTINCT messageId FROM DELETED) and 
		fileId IN (SELECT DISTINCT fileId FROM DELETED);
	END