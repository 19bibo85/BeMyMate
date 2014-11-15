CREATE TABLE [User].[UserToFriend]
(
	[userId] INT NOT NULL , 
    [friendId] INT NOT NULL, 
    [statusId] INT NOT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [friendId]), 
    CONSTRAINT [FK_UserToFriend_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToFriend_Friend] FOREIGN KEY ([friendId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToFriend_FriendshipStatus] FOREIGN KEY ([statusId]) REFERENCES [User].[FriendshipStatus]([id])
)
