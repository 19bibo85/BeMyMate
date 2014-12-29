CREATE PROCEDURE [User].[GetMessageInbox]
	@MessageGuid uniqueidentifier = null,
	@UserID INT = 0
AS

	DECLARE @TMP TABLE(userId INT, 
					   userName VARCHAR(MAX), 
					   surName VARCHAR(MAX),
					   email VARCHAR(MAX),
					   messageId INT,
					   [guid] uniqueidentifier,
					   [subject] VARCHAR(MAX), 
					   body VARCHAR(MAX),
					   fileId INT,
					   [fileName] VARCHAR(MAX), 
					   [filePath] VARCHAR(MAX))
	
	INSERT @TMP	
	EXEC [User].[GetMessagesInbox]
		 @UserID = @UserID

	SELECT DISTINCT	*
	FROM @TMP as mr
	WHERE mr.[guid] = @MessageGuid

RETURN 0
