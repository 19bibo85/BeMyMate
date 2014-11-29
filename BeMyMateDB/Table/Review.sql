CREATE TABLE [User].[Review]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [review] VARCHAR(MAX) NOT NULL, 
    [userReviewingId] INT NOT NULL, 
    [userReviewedId] INT NOT NULL, 
    [rating] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_ProfileReview_UserReviewing] FOREIGN KEY ([userReviewingId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_ProfileReview_UserReviewed] FOREIGN KEY ([userReviewedId]) REFERENCES [User].[User]([id])
)
