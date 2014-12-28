CREATE TRIGGER [RoleToUserUp]
	ON [Security].[RoleToUser]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, roleId INT, userId INT);
		--INSERT INTO @TMP(i, roleId, userId)
		--SELECT ROW_NUMBER() OVER( ORDER BY roleId, userId) as 'i', roleId, userId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(roleId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @roleId INT = (SELECT roleId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [Security].[RoleToUser]
		--	SET dtUpdated = GETDATE() 
		--	WHERE roleId = @roleId and userId = @userId;

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [Security].[RoleToUser]
		SET dtUpdated = GETDATE() 
		WHERE 
		roleId IN (SELECT DISTINCT roleId FROM INSERTED) and 
		userId IN (SELECT DISTINCT userId FROM INSERTED);
	END
