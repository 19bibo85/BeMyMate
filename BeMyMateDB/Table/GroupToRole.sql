CREATE TABLE [Security].[GroupToRole]
(
	[groupId] INT NOT NULL , 
    [roleId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
	CONSTRAINT [FK_GroupToRole_Group] FOREIGN KEY ([groupId]) REFERENCES [Security].[Group]([id]),
    CONSTRAINT [FK_GroupToRole_Role] FOREIGN KEY ([roleId]) REFERENCES [Security].[Role]([id]), 
    PRIMARY KEY ([groupId], [roleId])
)
