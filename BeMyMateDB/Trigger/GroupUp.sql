CREATE TRIGGER [GroupUp]
	ON [Security].[Group]
	FOR UPDATE
	AS
	BEGIN

		UPDATE [Security].[Group]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END