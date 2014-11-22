CREATE PROCEDURE [Application].[GetMenuByUser]
	@UserID INT = 0
AS
	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)

	INSERT @TMP
	EXEC [Security].[GetSecurityByUser]
		 @UserID = @UserID

	SELECT sr.name as Section, sr.[level] as SectionLevel,
			mr.name as Menu, mr.[level] as MenuLevel,
			mir.name as Item
	FROM (SELECT s.id, s.name, s.[level]
		  FROM @TMP as st 
		  INNER JOIN [Application].[Section] as s on st.ViewObjectId = s.objectId) 
		  as sr
	INNER JOIN [Application].[SectionToMenu] as sm on sr.id = sm.sectionId
	INNER JOIN (SELECT m.id, m.name, m.[level]
				FROM @TMP as mt 
				INNER JOIN [Application].[Menu] as m on mt.ViewObjectId = m.objectId) 
				as mr
				on sm.menuId = mr.id
	LEFT OUTER JOIN [Application].[MenuToMenuItem] as mm on mr.id = mm.menuId
	LEFT OUTER JOIN (SELECT mi.id, mi.name
					 FROM @TMP as mt 
					 LEFT OUTER JOIN [Application].[MenuItem] as mi on mt.ViewObjectId = mi.objectId) 
					 as mir
					 on mm.menuItemId = mir.Id
RETURN 0
