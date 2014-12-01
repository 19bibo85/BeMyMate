SELECT s.name as Section, m.name as Menu, mi.name as Item
FROM [Application].[Section] as s
INNER JOIN [Application].[SectionToMenu] as sm on s.id = sm.sectionId
INNER JOIN [Application].[Menu] as m on m.id = sm.menuId
LEFT OUTER JOIN [Application].[MenuToMenuItem] as mm on m.id = mm.menuId
LEFT OUTER JOIN [Application].[MenuItem] as mi on mm.menuItemId = mi.Id