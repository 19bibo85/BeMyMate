/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Language
INSERT INTO [Application].[Language] (id, code, name) VALUES
(1, 'en-US', 'English'),
(2, 'it-IT', 'Italiano')

-- Context
INSERT INTO [Application].[ObjectContext] (id, [anonymous], tennant, landlord, agency) VALUES
(1, 0, 0, 0, 0), -- None
(2, 1, 1, 1, 1), -- Administrator
(4, 1, 0, 0, 0), -- Anonymous
(5, 0, 1, 0, 0), -- Tennant
(6, 0, 1, 1, 0), -- Tennant, Landlord
(7, 0, 1, 0, 1), -- Tennant, Agency
(8, 0, 0, 1, 0), -- Landlord
(9, 0, 0, 1, 1), -- Landlord, Agency
(10, 0, 0, 0, 1), -- Agency
(11, 0, 1, 1, 1) -- Tennant, Landlord, Agency

-- Table
INSERT INTO [Application].[Table] (id, name) VALUES
(1, 'Section'),
(2, 'Menu'),
(3, 'MenuItem'),
(4, 'FriendshipStatus'),
(5, 'Gender'),
(6, 'Job'),
(7, 'PhoneType'),
(8, 'Type'),
(9, 'UserRegistrationStatus'),
(10, 'UserStatus'),
(11, 'GroupObject')

-- Genders
INSERT INTO [User].[Gender] (id, name) VALUES
(1, 'None'),
(2, 'Male'),
(3, 'Female')

-- Jobs
INSERT INTO [User].[Job] (id, name) VALUES
(1, 'Accounting'),
(2, 'Admin & Clerical'),
(3, 'Automotive'),
(4, 'Banking'),
(5, 'Biotech')

-- Object Right
INSERT INTO [Security].[ObjectRight] (id, name) VALUES
(1, 'None'),
(2, 'View'),
(3, 'Edit'),
(4, 'Delete')

-- Section
INSERT INTO [Application].[Section] (id, name, level, contextId) VALUES
(1, 'Home', 0, 2),
(2, 'Profile', 0, 2)

-- Menu
INSERT INTO [Application].[Menu] (id, name, level, parentId, contextId) VALUES
(1, 'Main', 0, null, 2),
(2, 'Company', 0, null, 2),	
(3, 'User List', 0, null, 2),
(4, 'Message', 0, null, 11),
(5, 'Account', 0, null, 11),
(6, 'Report', 0, null, 9)

-- Menu Item
INSERT INTO [Application].[MenuItem] (id, name, contextId, link) VALUES
(1, 'About', 2, '/page/about.aspx'),
(2, 'Jobs', 2, '/page/job.aspx'),
(3, 'Press', 2, '/page/press.aspx'),
(4, 'Blog', 2, '/page/blog.aspx'),
(5, 'Help', 2, '/page/help.aspx'),
(6, 'Policies', 2, '/page/policies.aspx'),
(7, 'Terms & Privacy', 2, '/page/terms_privacy.aspx')

-- Menu Item
INSERT INTO [Application].[MenuToMenuItem] (menuId, menuItemId) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7)

-- Section Menu
INSERT INTO [Application].[SectionToMenu] (sectionId, menuId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6)

-- Phone Type
INSERT INTO [User].[PhoneType] (id, name) VALUES
(1, 'Home'),
(2, 'Cell'),
(3, 'Fax')

-- Registration status
INSERT INTO [User].[UserRegistrationStatus] (id, name) VALUES
(1, 'Non Verified'),
(2, 'Pending'),
(3, 'Verified')

-- User status
INSERT INTO [User].[UserStatus] (id, name) VALUES
(1, 'Looking for house'),
(2, 'Looking for flatmate'),
(3, 'Looking for tennat'),
(4, 'Looking for landlord'),
(5, 'Looking for landlord and tennat')

-- File Info
INSERT INTO [User].[FileInfo] (id, name, extension) VALUES
(1, 'unknow', 'none'),
(2, 'word', 'doc'),
(3, 'excel', 'xls'),
(4, 'powerpoint', 'ppt'),
(5, 'picture', 'pbg')

-- Friendship 
INSERT INTO [User].[FriendshipStatus] (id, name) VALUES
(1, 'Accepted'),
(2, 'Rejected'),
(3, 'Pending'),
(4, 'Deleted')

-- Role
INSERT INTO [Security].[Role] (id, name) VALUES
(1, 'Anonymous'),
(2, 'Administrator'),
(3, 'Tennant'),
(4, 'Landlord'),
(5, 'Agency')

-- Group Object
INSERT INTO [Security].[GroupObject] (id, name) VALUES
(1, 'Section.Anonymous'),
(2, 'Menu.Anonymous'),
(3, 'MenuItem.Anonymous'),
(4, 'Section.Tennant'),
(5, 'Menu.Tennant'),
(6, 'MenuItem.Tennant'),
(7, 'Section.Landlord'),
(8, 'Menu.Landlord'),
(9, 'MenuItem.Landlord'),
(10, 'Section.Agency'),
(11, 'Menu.Agency'),
(12, 'MenuItem.Agency')

-- Object Group Object
-- Anonymous
INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 1, objectId
FROM [Application].[Section] as s
INNER JOIN [Application].[ObjectContext] as rc on s.contextId = rc.id 
WHERE rc.[anonymous] = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 2, objectId
FROM [Application].[Menu] as m 
INNER JOIN [Application].[ObjectContext] as rc on m.contextId = rc.id 
WHERE rc.[anonymous] = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 3, objectId
FROM [Application].[MenuItem] as mi
INNER JOIN [Application].[ObjectContext] as rc on mi.contextId = rc.id 
WHERE rc.[anonymous] = 1 AND dtDeleted IS NULL

-- Tennant
INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 4, objectId
FROM [Application].[Section] as s
INNER JOIN [Application].[ObjectContext] as rc on s.contextId = rc.id 
WHERE rc.tennant = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 5, objectId
FROM [Application].[Menu] as m 
INNER JOIN [Application].[ObjectContext] as rc on m.contextId = rc.id 
WHERE rc.tennant = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 6, objectId
FROM [Application].[MenuItem] as mi
INNER JOIN [Application].[ObjectContext] as rc on mi.contextId = rc.id 
WHERE rc.tennant = 1 AND dtDeleted IS NULL

-- Landlord
INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 7, objectId
FROM [Application].[Section] as s
INNER JOIN [Application].[ObjectContext] as rc on s.contextId = rc.id 
WHERE rc.landlord = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 8, objectId
FROM [Application].[Menu] as m 
INNER JOIN [Application].[ObjectContext] as rc on m.contextId = rc.id 
WHERE rc.landlord = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 9, objectId
FROM [Application].[MenuItem] as mi
INNER JOIN [Application].[ObjectContext] as rc on mi.contextId = rc.id 
WHERE rc.landlord = 1 AND dtDeleted IS NULL

-- Agency
INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 10, objectId
FROM [Application].[Section] as s
INNER JOIN [Application].[ObjectContext] as rc on s.contextId = rc.id 
WHERE rc.agency = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 11, objectId
FROM [Application].[Menu] as m 
INNER JOIN [Application].[ObjectContext] as rc on m.contextId = rc.id 
WHERE rc.agency = 1 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 12, objectId
FROM [Application].[MenuItem] as mi
INNER JOIN [Application].[ObjectContext] as rc on mi.contextId = rc.id 
WHERE rc.agency = 1 AND dtDeleted IS NULL

-- Role Group Object Right
-- Anonymous
INSERT INTO [Security].[RoleGroupObjectRight] (roleId, groupObjectId, rightId, [deny])
SELECT 1, objectId, 2, 0
FROM [Security].[GroupObject]
WHERE name like '%.Anonymous'

-- Tennant
INSERT INTO [Security].[RoleGroupObjectRight] (roleId, groupObjectId, rightId, [deny])
SELECT 3, objectId, 2, 0
FROM [Security].[GroupObject]
WHERE name like '%.Tennant'

-- Landlord
INSERT INTO [Security].[RoleGroupObjectRight] (roleId, groupObjectId, rightId, [deny])
SELECT 4, objectId, 2, 0
FROM [Security].[GroupObject]
WHERE name like '%.Landlord'

-- Agency
INSERT INTO [Security].[RoleGroupObjectRight] (roleId, groupObjectId, rightId, [deny])
SELECT 5, objectId, 2, 0
FROM [Security].[GroupObject]
WHERE name like '%.Agency'

-- Avatar
INSERT INTO [User].[Avatar] (id, name, [path]) VALUES
(1, 'Placeholder', '/Avatar/placeholder.png');

-- User
INSERT INTO [User].[User] (name, surname, email, username, [password], genderId, avatarId, statusId, registrationStatusId) VALUES
('Anonymous', 'Anonymous', 'anonymous@gmail.com', 'Anonymous', 'Anonymous123', 1, 1, 1, 1),
('Alberto', 'Tosi Brandi', 'alberto.tosibrandi@gmail.com', 'alberto.tosibrandi', 'password123', 1, 1, 1, 1);

-- Role To User
INSERT INTO [Security].[RoleToUser] (roleId, userId) VALUES
(1, 0),
(3, 1);
