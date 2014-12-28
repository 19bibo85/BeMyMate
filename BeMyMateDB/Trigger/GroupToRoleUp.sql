CREATE TRIGGER [GroupToRoleUp]
	ON [Security].[GroupToRole]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, groupId INT, roleId INT);
		--INSERT INTO @TMP(i, groupId, roleId)
		--SELECT ROW_NUMBER() OVER( ORDER BY groupId, roleId) as 'i', groupId, roleId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(groupId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @groupId INT = (SELECT groupId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @roleId INT = (SELECT roleId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [Security].[GroupToRole]
		--	SET dtUpdated = GETDATE() 
		--	WHERE groupId = @groupId and roleId = @roleId;

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [Security].[GroupToRole]
		SET dtUpdated = GETDATE() 
		WHERE 
		groupId IN (SELECT DISTINCT groupId FROM INSERTED) and 
		roleId IN (SELECT DISTINCT roleId FROM INSERTED);
	END
