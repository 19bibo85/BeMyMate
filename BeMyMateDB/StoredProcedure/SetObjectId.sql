CREATE PROCEDURE [dbo].[SetObjectId]
	@param1 int = 0,
	@param2 int
AS
	DECLARE @unassigned INT = (SELECT COUNT([id]) FROM [Application].[Section] WHERE objectId IS NULL);
	
	WHILE @unassigned > 0
	BEGIN
		DECLARE @tmpId INT = (SELECT id FROM [Application].[Section] WHERE objectID IS NULL);
		INSERT INTO [Security].[Object] DEFAULT VALUES;
		
		DECLARE @objId INT = (SCOPE_IDENTITY());		
		UPDATE [Application].[Section] 
		SET objectId = @objId
		WHERE id = @tmpID;

		SET @unassigned = (SELECT COUNT([id]) FROM [Application].[Section] WHERE objectId IS NULL);
	END

RETURN 0
