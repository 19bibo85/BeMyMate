CREATE TRIGGER [UserToNationalityDel]
	ON [User].[UserToNationality]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, userId INT, nationalityId INT);
		--INSERT INTO @TMP(i, userId, nationalityId)
		--SELECT ROW_NUMBER() OVER( ORDER BY userId, nationalityId) as 'i', userId, nationalityId
		--FROM DELETED

		--DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @nationalityId INT = (SELECT nationalityId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[UserToNationality]
		--	SET dtDeleted = GETDATE() 
		--	WHERE userId = @userId and nationalityId = @nationalityId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[UserToNationality]
		SET dtDeleted = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM DELETED) and 
		nationalityId IN (SELECT DISTINCT nationalityId FROM DELETED);
	END
