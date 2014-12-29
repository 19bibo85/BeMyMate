CREATE PROCEDURE [User].[GetNotifications]
	@UserID INT = 0,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS
	SELECT DISTINCT	
	u.id as userId, u.name as userName, u.surname, u.email, -- User
	n.id as notificationId, n.[guid] as [guid], nt.name, nt.[description], -- Notification
	loc.name, loc.[description]
	FROM [User].[Notification] as n
	INNER JOIN [User].[NotificationType] as nt on n.typeId = nt.id
	INNER JOIN [Application].[Localization] as loc on nt.refCode = loc.refCode
	INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
	INNER JOIN [User].[UserToNotification] as utn on n.id = utn.notificationId
	INNER JOIN [User].[User] as u on n.senderId = u.id
	WHERE utn.receiverId = @UserID and utn.dtDeleted is null and lan.code = @LanguageCode
RETURN 0
