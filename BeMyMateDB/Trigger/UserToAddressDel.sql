CREATE TRIGGER [UserToAddressDel]
	ON [User].[UserToAddress]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, userId INT, addressId INT);
		--INSERT INTO @TMP(i, userId, addressId)
		--SELECT ROW_NUMBER() OVER( ORDER BY userId, addressId) as 'i', userId, addressId
		--FROM DELETED

		--DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @addressId INT = (SELECT addressId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[UserToAddress]
		--	SET dtDeleted = GETDATE() 
		--	WHERE userId = @userId and addressId = @addressId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[UserToAddress]
		SET dtDeleted = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM DELETED) and 
		addressId IN (SELECT DISTINCT addressId FROM DELETED);
	END
