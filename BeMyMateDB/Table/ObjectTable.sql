CREATE TABLE [Security].[ObjectTable]
(
	[id] INT NOT NULL ,
	[name] VARCHAR(MAX) NOT NULL ,
	[dtCreated] DATETIME NOT NULL ,
    CONSTRAINT [PK_ObjectTable] PRIMARY KEY ([id])
)
