CREATE TRIGGER [ObjectGroupObjectUp]
	ON [Security].[ObjectGroupObject]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[ObjectGroupObject]
		SET dtUpdated = GETDATE() 
		WHERE 
		groupId IN (SELECT DISTINCT groupId FROM INSERTED) and 
		objectId IN (SELECT DISTINCT objectId FROM INSERTED);
	END
