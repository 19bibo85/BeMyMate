CREATE FUNCTION [Application].[GetReferenceCode]
(
	@prefix NVARCHAR(MAX),
	@Id INT,
	@Length INT,
	@PaddingChar CHAR(1) = '0'
)
RETURNS VARCHAR(MAX)
AS
BEGIN

RETURN (
 SELECT @prefix + RIGHT(REPLICATE(@PaddingChar, @Length) + CAST(@Id as nvarchar(6)), @Length)
)

END
GO
