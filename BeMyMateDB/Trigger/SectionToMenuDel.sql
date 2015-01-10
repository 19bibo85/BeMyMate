CREATE TRIGGER [SectionToMenuDel]
	ON [Application].[SectionToMenu]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[SectionToMenu]
		SET dtDeleted = GETDATE() 
		WHERE 
		sectionId IN (SELECT DISTINCT sectionId FROM DELETED) and 
		menuId IN (SELECT DISTINCT menuId FROM DELETED);
	END
