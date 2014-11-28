CREATE PROCEDURE [Security].[GetSecurityByUser]
	@UserID int = 0
AS
	SELECT [View].ViewObjectId, Edit.EditObjectId, [Delete].DeleteObjectId
	FROM
	(SELECT DISTINCT o.id as ViewObjectId
	FROM [Security].[Object] as o
	INNER JOIN [Security].[ObjectGroupObject] as ogo on o.id = ogo.objectId 
	INNER JOIN [Security].[GroupObject] as [go] on ogo.groupId = [go].id
	INNER JOIN [Security].[RoleGroupObjectRight] as rgo on [go].objectId = rgo.groupObjectId
	INNER JOIN [Security].[Role] as r on rgo.roleId = r.id
	INNER JOIN [Security].[RoleToUser] as rtu on rgo.roleId = rtu.roleId
	INNER JOIN [User].[User] as u on rtu.userId = u.id
	WHERE rgo.rightId = 2 AND rgo.[deny] = 0 AND u.id = @UserID) 
	as [View]
	LEFT OUTER JOIN
	(SELECT DISTINCT o.id as EditObjectId
	FROM [Security].[Object] as o
	INNER JOIN [Security].[ObjectGroupObject] as ogo on o.id = ogo.objectId 
	INNER JOIN [Security].[GroupObject] as [go] on ogo.groupId = [go].id
	INNER JOIN [Security].[RoleGroupObjectRight] as rgo on [go].objectId = rgo.groupObjectId
	INNER JOIN [Security].[Role] as r on rgo.roleId = r.id
	INNER JOIN [Security].[RoleToUser] as rtu on rgo.roleId = rtu.roleId
	INNER JOIN [User].[User] as u on rtu.userId = u.id
	WHERE rgo.rightId = 3 AND rgo.[deny] = 0 AND u.id = @UserID) as Edit on [View].ViewObjectId = Edit.EditObjectId
	LEFT OUTER JOIN
	(SELECT DISTINCT o.id as DeleteObjectId
	FROM [Security].[Object] as o
	INNER JOIN [Security].[ObjectGroupObject] as ogo on o.id = ogo.objectId 
	INNER JOIN [Security].[GroupObject] as [go] on ogo.groupId = [go].id
	INNER JOIN [Security].[RoleGroupObjectRight] as rgo on [go].objectId = rgo.groupObjectId
	INNER JOIN [Security].[Role] as r on rgo.roleId = r.id
	INNER JOIN [Security].[RoleToUser] as rtu on rgo.roleId = rtu.roleId
	INNER JOIN [User].[User] as u on rtu.userId = u.id
	WHERE rgo.rightId = 4 AND rgo.[deny] = 0 AND u.id = @UserID) as [Delete] on Edit.EditObjectId = [Delete].DeleteObjectId
RETURN 0
