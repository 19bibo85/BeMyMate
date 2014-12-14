CREATE TABLE [User].[UserToAddress]
(
	[userId] INT NOT NULL, 
	[addressId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [addressId]), 
    CONSTRAINT [FK_UserToAddress_Address] FOREIGN KEY ([addressId]) REFERENCES [User].[Address]([id]), 
    CONSTRAINT [FK_UserToAddress_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id])
)
