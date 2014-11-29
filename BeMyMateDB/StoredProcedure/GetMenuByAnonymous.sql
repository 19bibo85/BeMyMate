CREATE PROCEDURE [Application].[GetMenuByAnonymous]
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS

	SELECT DISTINCT
	s.name as Section, s.[level] as SectionLevel,
	m.name as Menu, m.[level] as MenuLevel,
	mi.name as Item, mi.link as Link
	FROM [Application].[Section] as s
	INNER JOIN [Application].[RowContext] as rcSec on s.contextId = rcSec.id
	INNER JOIN [Application].[Localization] as loc on s.refCode = loc.refCode
	INNER JOIN [Application].[Language] as lanSec on loc.languageId = lanSec.id
	INNER JOIN [Application].[SectionToMenu] as sm on s.id = sm.sectionId
	INNER JOIN [Application].[Menu] as m on sm.menuId = m.id
	INNER JOIN [Application].[RowContext] as rcMenu on m.contextId = rcMenu.id
	INNER JOIN [Application].[Localization] as locMenu on m.refCode = locMenu.refCode
	INNER JOIN [Application].[Language] as lanMenu on loc.languageId = lanMenu.id
	LEFT OUTER JOIN [Application].[MenuToMenuItem] as mm on m.id = mm.menuId
	LEFT OUTER JOIN [Application].[MenuItem] as mi on mm.menuItemId = mi.id
	LEFT OUTER JOIN [Application].[RowContext] as rcItem on mi.contextId = rcItem.id
	LEFT OUTER JOIN [Application].[Localization] as locMenuItem on mi.refCode = locMenuItem.refCode
	LEFT OUTER JOIN [Application].[Language] as lanMenuItem on loc.languageId = lanMenuItem.id
	WHERE 
	lanSec.code = 'en-us' and rcSec.[anonymous] = 1 
	and lanMenu.code = 'en-us' and rcMenu.[anonymous] = 1 
	and (mi.id IS NULL OR (mi.id IS NOT NULL and lanMenuItem.code = 'en-us' and rcItem.[anonymous] = 1 ))
	ORDER BY s.name, m.name, mi.name, mi.link
RETURN 0
