CREATE TABLE [Application].[Table]
(
	[id] INT NOT NULL ,
	[name] VARCHAR(MAX) NOT NULL ,
	[dtCreated] DATETIME NOT NULL DEFAULT GETDATE() ,
    CONSTRAINT [PK_ObjectTable] PRIMARY KEY ([id])
)
