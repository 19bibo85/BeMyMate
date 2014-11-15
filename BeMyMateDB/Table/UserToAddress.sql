CREATE TABLE [User].[UserToAddress]
(
	[addressId] INT NOT NULL , 
    [userId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [addressId]), 
    CONSTRAINT [FK_UserToAddress_Address] FOREIGN KEY ([addressId]) REFERENCES [User].[Address]([id]), 
    CONSTRAINT [FK_UserToAddress_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id])
)
