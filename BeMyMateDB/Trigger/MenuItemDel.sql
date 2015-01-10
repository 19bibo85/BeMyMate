CREATE TRIGGER [MenuItemDel]
	ON [Application].[MenuItem]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[MenuItem]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
