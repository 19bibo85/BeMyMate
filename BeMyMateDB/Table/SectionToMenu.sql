CREATE TABLE [Application].[SectionToMenu]
(
	[sectionId] INT NOT NULL , 
    [menuId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([sectionId], [menuId]), 
    CONSTRAINT [FK_SectionToMenu_Section] FOREIGN KEY ([sectionId]) REFERENCES [Application].[Section]([id]), 
    CONSTRAINT [FK_SectionToMenu_Menu] FOREIGN KEY ([menuId]) REFERENCES [Application].[Menu]([id])
)
