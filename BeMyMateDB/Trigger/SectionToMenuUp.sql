CREATE TRIGGER [SectionToMenuUp]
	ON [Application].[SectionToMenu]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @sectionId INT = (SELECT sectionId FROM INSERTED);
		DECLARE @menuId INT = (SELECT menuId FROM INSERTED);		
        UPDATE [Application].[SectionToMenu]
		SET dtUpdated = GETDATE() 
		WHERE sectionId = @sectionId and menuId = @menuId;
	END
