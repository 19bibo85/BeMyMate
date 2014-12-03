SELECT DISTINCT
u.surname as Surname,
ava.[path] as AvatarPath,
gr.name as Gender,
usr.name as UserStatus,
urgr.name as UserRegistrationStatus,
[add].street as Street,
[add].city as City,
[add].zipCode as ZipCode,
[add].country as Country,
busr.address as BusinessAddress,
busr.name as JobType,
phor.prefix as Prefix, 
phor.number as Number, 
phor.name as PhonType
FROM [User].[User] as u
INNER JOIN (SELECT g.id, gl.name 
			FROM [User].[Gender] as g
			INNER JOIN [Application].[Localization] as gl on g.refCode = gl.refCode) as gr on u.genderId = gr.id
INNER JOIN [User].[Avatar] as ava on u.avatarId = ava.id
INNER JOIN (SELECT us.id, usl.name
			FROM [User].[UserStatus] as us
			INNER JOIN [Application].[Localization] as usl on us.refCode = usl.refCode) as usr on u.statusId = usr.id
INNER JOIN (SELECT urg.id, urgl.name
			FROM [User].[UserRegistrationStatus] as urg
			INNER JOIN [Application].[Localization] as urgl on urg.refCode = urgl.refCode) as urgr on u.registrationStatusId = urgr.Id
LEFT OUTER JOIN [User].[UserToAddress] as uta on u.id = uta.userId
LEFT OUTER JOIN [User].[Address] as [add] on uta.addressId = [add].id
LEFT OUTER JOIN [User].[UserToBusiness] as utb on u.id = utb.userId
LEFT OUTER JOIN (SELECT bus.id, bus.[address], loc.name
				 FROM [User].[Business] as bus 
				 INNER JOIN [User].[Job] as job on bus.jobId = job.id
				 INNER JOIN [Application].[Localization] as loc on job.refCode = job.refCode) as busr on utb.businessId = busr.id
LEFT OUTER JOIN [User].[UserToPhone] as utp on u.id = utp.userId
LEFT OUTER JOIN (SELECT p.id, p.prefix, p.number, loc.name
				 FROM [User].[Phone] as p
				 INNER JOIN [User].[PhoneType] as pt on p.typeId = pt.id
				 INNER JOIN [Application].[Localization] as loc on pt.refCode = loc.refCode) as phor on utp.phoneId = phor.id