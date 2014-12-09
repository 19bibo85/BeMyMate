CREATE TABLE [User].[User]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(0, 1), 
    [name] VARCHAR(MAX) NOT NULL, 
    [surname] VARCHAR(MAX) NOT NULL, 
    [email] VARCHAR(MAX) NOT NULL, 
    [username] VARCHAR(MAX) NOT NULL, 
    [password] VARCHAR(MAX) NOT NULL, 
	[guid] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(), 
    [genderId] INT NOT NULL, 
    [dob] DATE NULL, 
    [avatarId] INT NOT NULL,
	[statusId] INT NOT NULL,
	[registrationStatusId] INt NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_User_Avatar] FOREIGN KEY ([avatarId]) REFERENCES [User].[Avatar]([id]),
	CONSTRAINT [FK_User_Status] FOREIGN KEY ([statusId]) REFERENCES [User].[UserStatus]([id]),
	CONSTRAINT [FK_User_RegistrationStatus] FOREIGN KEY ([statusId]) REFERENCES [User].[UserRegistrationStatus]([id])
)
