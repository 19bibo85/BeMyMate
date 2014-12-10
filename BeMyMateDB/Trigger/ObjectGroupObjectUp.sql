CREATE TRIGGER [ObjectGroupObjectUp]
	ON [Security].[ObjectGroupObject]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @groupId INT = (SELECT groupId FROM INSERTED);	
		DECLARE @objectId INT = (SELECT objectId FROM INSERTED);	
        UPDATE [Security].[ObjectGroupObject]
		SET dtUpdated = GETDATE() 
		WHERE groupId = @groupId and objectId = @objectId;
	END
