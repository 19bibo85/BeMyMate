CREATE TABLE [Application].[MenuToMenuItem]
(
	[menuId] INT NOT NULL , 
    [menuItemId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([menuId], [menuItemId]), 
    CONSTRAINT [FK_MenuToMenuItem_Menu] FOREIGN KEY ([menuId]) REFERENCES [Application].[Menu]([id]), 
    CONSTRAINT [FK_MenuToMenuItem_MenuItem] FOREIGN KEY ([menuItemId]) REFERENCES [Application].[MenuItem]([id])
)
