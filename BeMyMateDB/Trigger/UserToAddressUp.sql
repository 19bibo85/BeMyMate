CREATE TRIGGER [UserToAddressUp]
	ON [User].[UserToAddress]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON        

		--DECLARE @TMP TABLE(i INT, userId INT, addressId INT);
		--INSERT INTO @TMP(i, userId, addressId)
		--SELECT ROW_NUMBER() OVER( ORDER BY userId, addressId) as 'i', userId, addressId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @addressId INT = (SELECT addressId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[UserToAddress]
		--	SET dtUpdated = GETDATE() 
		--	WHERE userId = @userId and addressId = @addressId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[UserToAddress]
		SET dtUpdated = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM INSERTED) and 
		addressId IN (SELECT DISTINCT addressId FROM INSERTED);
	END
