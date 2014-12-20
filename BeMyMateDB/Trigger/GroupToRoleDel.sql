CREATE TRIGGER [GroupToRoleDel]
	ON [Security].[GroupToRole]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, groupId INT, roleId INT);
		INSERT INTO @TMP(i, groupId, roleId)
		SELECT ROW_NUMBER() OVER( ORDER BY groupId, roleId) as 'i', groupId, roleId
		FROM DELETED

		DECLARE @InsNum INT = (SELECT COUNT(groupId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @groupId INT = (SELECT groupId FROM @TMP WHERE i = @InsNum);
			DECLARE @roleId INT = (SELECT roleId FROM @TMP WHERE i = @InsNum);

			UPDATE [Security].[GroupToRole]
			SET dtDeleted = GETDATE() 
			WHERE groupId = @groupId and roleId = @roleId;

			SET @InsNum = @InsNum - 1;
		END
	END
