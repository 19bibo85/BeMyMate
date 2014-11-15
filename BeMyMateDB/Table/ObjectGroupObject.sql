CREATE TABLE [Security].[ObjectGroupObject]
(
	[groupId] INT NOT NULL , 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([groupId], [objectId]), 
    CONSTRAINT [FK_ObjectGroupObject_Group] FOREIGN KEY ([groupId]) REFERENCES [Security].[GroupObject]([id]), 
    CONSTRAINT [FK_ObjectGroupObject_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
