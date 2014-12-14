CREATE TRIGGER [UserBasicInfoDef]
	ON [User].[User]
	AFTER INSERT
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, id INT)
		INSERT INTO @TMP(i, id)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id
		FROM INSERTED AS ins

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @UserID INT = (SELECT id FROM @TMP as tmp WHERE tmp.i = @InsNum)			
			 
			-- Insert default address
			IF((SELECT userID FROM [User].[UserToAddress] WHERE userId = @UserID) IS NULL)
			BEGIN
			INSERT INTO [User].[UserToAddress] (userId, addressId) VALUES (@UserID, 0);
			END
			
			-- Insert default business
			IF((SELECT userID FROM [User].[UserToBusiness] WHERE userId = @UserID) IS NULL)
			BEGIN
			INSERT INTO [User].[UserToBusiness] (userId, businessId) VALUES (@UserID, 0);
			END

			-- Insert default phone
			IF((SELECT userID FROM [User].[UserToPhone] WHERE userId = @UserID) IS NULL)
			BEGIN
			INSERT INTO [User].[UserToPhone] (userId, phoneId) VALUES (@UserID, 0);
			END			

			SET @InsNum = @InsNum - 1;
		END
	END
