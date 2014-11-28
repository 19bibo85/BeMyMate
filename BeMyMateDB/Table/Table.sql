CREATE TABLE [Application].[Table]
(
	[id] INT NOT NULL ,
	[name] VARCHAR(MAX) NOT NULL ,
	[dtCreated] DATETIME NOT NULL DEFAULT GETDATE() ,
    [dtUpdated] DATETIME NULL, 
    CONSTRAINT [PK_Table] PRIMARY KEY ([id])
)
