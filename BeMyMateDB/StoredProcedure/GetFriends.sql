CREATE PROCEDURE [User].[GetFriends]
	@UserID INT = 0,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS
	SELECT DISTINCT
	a2.name, a2.[path],
	u2.name, u2.surname, u2.[guid],
	loc.name, loc.[description]
	FROM [User].[User] as u1
	INNER JOIN [User].[UserToFriend] as utf on u1.id = utf.userId
	INNER JOIN [User].[User] as u2 on utf.userId = u2.id
	INNER JOIN [User].[Avatar] as a2 on u2.avatarId = a2.id
	INNER JOIN [User].[FriendshipStatus] as fs on utf.friendId = fs.id
	INNER JOIN [Application].[Localization] as loc on fs.refCode = loc.refCode
	INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
	WHERE u1.id = @UserID and fs.id = 1 and lan.code = @LanguageCode
RETURN 0
