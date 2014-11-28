CREATE TABLE [Security].[RoleToUser]
(
	[roleId] INT NOT NULL,
	[userId] INT NOT NULL ,     
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [roleId]), 
    CONSTRAINT [FK_RoleToUser_Role] FOREIGN KEY ([roleId]) REFERENCES [Security].[Role]([id]), 
    CONSTRAINT [FK_RoleToUser_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id])
)
