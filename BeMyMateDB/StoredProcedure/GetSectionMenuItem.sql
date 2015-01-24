CREATE PROCEDURE [Application].[GetSectionMenuItem]
	@UserID INT = 0,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS
	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)

	INSERT @TMP
	EXEC [Security].[GetUserSecurity]
		 @UserID = @UserID

	SELECT  sr.id as SectionId, sr.name as SectionName, sr.[description] as SecionDesc, sr.[level] as SectionLevel,
			mr.id as MenuId, mr.name as MenuName, mr.[description] as MenuDesc,
			mir.id as ItemId, mir.name as ItemName, mir.[description] as ItemDesc, mir.icon as Icon, mir.link as Link, mir.isActive as Active, mir.parentId as ParentId 
	FROM (SELECT s.id, loc.name, loc.[description], s.[level]
		  FROM @TMP as st 
		  INNER JOIN [Application].[Section] as s on st.ViewObjectId = s.objectId
		  INNER JOIN [Application].[Localization] as loc on s.refCode = loc.refCode
		  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
		  WHERE lan.code = @LanguageCode)
		  as sr
	INNER JOIN [Application].[SectionToMenu] as sm on sr.id = sm.sectionId
	INNER JOIN (SELECT m.id, loc.name, loc.[description], m.[order]
				FROM @TMP as mt 
				INNER JOIN [Application].[Menu] as m on mt.ViewObjectId = m.objectId
				INNER JOIN [Application].[Localization] as loc on m.refCode = loc.refCode
				INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
				WHERE lan.code = @LanguageCode) 
				as mr
				on sm.menuId = mr.id
	LEFT OUTER JOIN [Application].[MenuToMenuItem] as mm on mr.id = mm.menuId
	LEFT OUTER JOIN (SELECT mi.id, loc.name, loc.[description], mi.link, mi.icon, mi.[order], mi.isActive, mi.parentId
					 FROM @TMP as mt 
					 LEFT OUTER JOIN [Application].[MenuItem] as mi on mt.ViewObjectId = mi.objectId
					 INNER JOIN [Application].[Localization] as loc on mi.refCode = loc.refCode
					 INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
					 WHERE lan.code = @LanguageCode) 
					 as mir
					 on mm.menuItemId = mir.Id
	--ORDER BY sr.name, mr.name, mir.name, mir.link
	ORDER BY sr.name, mr.[order], mir.[order]
RETURN 0
