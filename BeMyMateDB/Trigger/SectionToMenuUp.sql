CREATE TRIGGER [SectionToMenuUp]
	ON [Application].[SectionToMenu]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[SectionToMenu]
		SET dtUpdated = GETDATE() 
		WHERE 
		sectionId IN (SELECT DISTINCT sectionId FROM INSERTED) and 
		menuId IN (SELECT DISTINCT menuId FROM INSERTED);
	END
