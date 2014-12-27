CREATE PROCEDURE [Application].[GetMenu]
	@UserID INT = 0,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS
	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)

	INSERT @TMP
	EXEC [Security].[GetSecurityByUser]
		 @UserID = @UserID

	SELECT sr.name as Section, sr.[level] as SectionLevel,
			mr.name as Menu, mr.[level] as MenuLevel,
			mir.name as Item, mir.link as Link
	FROM (SELECT s.id, loc.name, s.[level]
		  FROM @TMP as st 
		  INNER JOIN [Application].[Section] as s on st.ViewObjectId = s.objectId
		  INNER JOIN [Application].[Localization] as loc on s.refCode = loc.refCode
		  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
		  WHERE lan.code = @LanguageCode)
		  as sr
	INNER JOIN [Application].[SectionToMenu] as sm on sr.id = sm.sectionId
	INNER JOIN (SELECT m.id, loc.name, m.[level]
				FROM @TMP as mt 
				INNER JOIN [Application].[Menu] as m on mt.ViewObjectId = m.objectId
				INNER JOIN [Application].[Localization] as loc on m.refCode = loc.refCode
				INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
				WHERE lan.code = @LanguageCode) 
				as mr
				on sm.menuId = mr.id
	LEFT OUTER JOIN [Application].[MenuToMenuItem] as mm on mr.id = mm.menuId
	LEFT OUTER JOIN (SELECT mi.id, loc.name, mi.link
					 FROM @TMP as mt 
					 LEFT OUTER JOIN [Application].[MenuItem] as mi on mt.ViewObjectId = mi.objectId
					 INNER JOIN [Application].[Localization] as loc on mi.refCode = loc.refCode
					 INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
					 WHERE lan.code = @LanguageCode) 
					 as mir
					 on mm.menuItemId = mir.Id
	ORDER BY sr.name, mr.name, mir.name, mir.link
RETURN 0
