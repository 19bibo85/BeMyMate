CREATE PROCEDURE [User].[GetMessagesOutbox]
	@UserID INT = 0
AS
	SELECT DISTINCT	
	u.id as userId, u.name as userName, u.surname, u.email, -- User
	m.id as messageId, m.[guid] as [guid], m.[subject], m.body, -- Message 
	[file].id as fileId, [file].name, [file].[path], fInfo.name as extension -- File
	FROM [User].[Message] as m
	INNER JOIN [User].[UserToMessage] as utm on m.id = utm.messageId
	INNER JOIN [User].[User] as u on utm.receiverId = u.id
	LEFT OUTER JOIN [User].[MessageToFile] as mtf on m.id = mtf.messageId
	LEFT OUTER JOIN [User].[File] as [file] on mtf.[fileId] = [file].id
	LEFT OUTER JOIN [User].[FileInfo] as fInfo on [file].infoId = fInfo.id
	WHERE m.authorId = @UserID and m.dtDeleted is null
RETURN 0