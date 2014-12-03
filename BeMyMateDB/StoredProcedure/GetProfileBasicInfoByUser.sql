CREATE PROCEDURE [User].[GetProfileBasicInfoByUser]
	@UserID INT = 0,
	@UserGuid uniqueidentifier = null,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS
	SELECT DISTINCT
	u.surname as Surname,
	ava.[path] as AvatarPath,
	gr.name as Gender,
	usr.name as UserStatus,
	[add].street as Street,
	[add].city as City,
	[add].zipCode as ZipCode,
	[add].country as Country,
	busr.address as BusinessAddress,
	busr.name as JobType,
	phor.prefix as Prefix, 
	phor.number as Number, 
	phor.name as PhoneType
	FROM [User].[User] as u
INNER JOIN (SELECT g.id, gl.name 
			FROM [User].[Gender] as g
			INNER JOIN [Application].[Localization] as gl on g.refCode = gl.refCode
			INNER JOIN [Application].[Language] as l on gl.languageId = l.id
			WHERE LTRIM(RTRIM(l.code)) = LTRIM(RTRIM(@LanguageCode))) as gr on u.genderId = gr.id
INNER JOIN [User].[Avatar] as ava on u.avatarId = ava.id
INNER JOIN (SELECT us.id, usl.name
			FROM [User].[UserStatus] as us
			INNER JOIN [Application].[Localization] as usl on us.refCode = usl.refCode
			INNER JOIN [Application].[Language] as l on usl.languageId = l.id
			WHERE LTRIM(RTRIM(l.code)) = LTRIM(RTRIM(@LanguageCode))) as usr on u.statusId = usr.id
LEFT OUTER JOIN [User].[UserToAddress] as uta on u.id = uta.userId
LEFT OUTER JOIN [User].[Address] as [add] on uta.addressId = [add].id
LEFT OUTER JOIN [User].[UserToBusiness] as utb on u.id = utb.userId
LEFT OUTER JOIN (SELECT bus.id, bus.[address], loc.name
				 FROM [User].[Business] as bus 
				 INNER JOIN [User].[Job] as job on bus.jobId = job.id
				 INNER JOIN [Application].[Localization] as loc on job.refCode = job.refCode
				 INNER JOIN [Application].[Language] as l on loc.languageId = l.id
				 WHERE LTRIM(RTRIM(l.code)) = LTRIM(RTRIM(@LanguageCode))) as busr on utb.businessId = busr.id
LEFT OUTER JOIN [User].[UserToPhone] as utp on u.id = utp.userId
LEFT OUTER JOIN (SELECT p.id, p.prefix, p.number, loc.name
				 FROM [User].[Phone] as p
				 INNER JOIN [User].[PhoneType] as pt on p.typeId = pt.id
				 INNER JOIN [Application].[Localization] as loc on pt.refCode = loc.refCode
				 INNER JOIN [Application].[Language] as l on loc.languageId = l.id
				 WHERE LTRIM(RTRIM(l.code)) = LTRIM(RTRIM(@LanguageCode))) as phor on utp.phoneId = phor.id
WHERE (@UserGuid IS NOT NULL AND u.[guid] = @UserGuid OR @UserGuid IS NULL AND u.id <> 0 AND u.id = @UserID)
RETURN 0
