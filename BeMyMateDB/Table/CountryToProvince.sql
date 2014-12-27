CREATE TABLE [User].[CountryToProvince]
(
	[countryId] INT NOT NULL, 
    [provinceId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([countryId], [provinceId]),	 
    CONSTRAINT [FK_CountryToCity_Country] FOREIGN KEY ([countryId]) REFERENCES [User].[Country]([id]), 
    CONSTRAINT [FK_CountryToCity_City] FOREIGN KEY ([provinceId]) REFERENCES [User].[Province]([id])
)
