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

INSERT INTO [Application].[Context] (id, name) VALUES
(1, 'Common'),
(2, 'Tennant'),
(3, 'Landlord'),
(4, 'Agency')

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
(1, 'Home', 0, 1),
(2, 'Profile', 0, 1)

-- Menu
INSERT INTO [Application].[Menu] (id, name, level, parentId, contextId) VALUES
(1, 'Main', 0, null, 1),
(2, 'Company', 0, null, 1),
(3, 'User List', 0, null, 1),
(4, 'Message', 0, null, 1),
(5, 'Account', 0, null, 1)

-- Menu Item
INSERT INTO [Application].[MenuItem] (id, name, contextId, link) VALUES
(1, 'About', 1, '/page/about.aspx'),
(2, 'Jobs', 1, '/page/job.aspx'),
(3, 'Press', 1, '/page/press.aspx'),
(4, 'Blog', 1, '/page/blog.aspx'),
(5, 'Help', 1, '/page/help.aspx'),
(6, 'Policies', 1, '/page/policies.aspx'),
(7, 'Terms & Privacy', 1, '/page/terms_privacy.aspx')

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
(2, 5)

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

-- Type
INSERT INTO [User].[Type] (id, name) VALUES
(1, 'Tennant'),
(2, 'Landlord'),
(3, 'Agency')

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
(1, 'Administrator'),
(2, 'Tennant'),
(3, 'Landlord'),
(4, 'Agency')

-- Group Object
INSERT INTO [Security].[GroupObject] (id, name) VALUES
(1, 'Section.Tennant'),
(2, 'Menu.Tennant'),
(3, 'MenuItem.Tennant')

-- Object Group Object
INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 1, objectId
FROM [Application].[Section]
WHERE contextId = 1 OR contextId = 2 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 2, objectId
FROM [Application].[Menu]
WHERE contextId = 1 OR contextId = 2 AND dtDeleted IS NULL

INSERT INTO [Security].[ObjectGroupObject] (groupId, objectId)
SELECT 3, objectId
FROM [Application].[MenuItem]
WHERE contextId = 1 OR contextId = 2 AND dtDeleted IS NULL

-- Role Group Object Right
INSERT INTO [BeMyMateDB].[Security].[RoleGroupObjectRight] (roleId, groupObjectId, rightId, [deny])
SELECT 2, objectId, 2, 0
FROM [Security].[GroupObject]
WHERE name like '%.Tennant'