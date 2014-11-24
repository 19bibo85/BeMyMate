﻿/*
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
INSERT INTO [Application].[Language] (id, code, name, dtCreated) VALUES
(1, 'en-us', 'English', GETDATE()),
(2, 'it', 'Italiano', GETDATE())

-- Object Table
INSERT INTO [Security].[ObjectTable] (id, name, dtCreated) VALUES
(1, 'Section', GETDATE()),
(2, 'Menu', GETDATE()),
(3, 'MenuItem', GETDATE())

-- Genders
INSERT INTO [User].[Gender] (id, name, dtCreated) VALUES
(1, 'None', GETDATE()),
(2, 'Male', GETDATE()),
(3, 'Female', GETDATE())

-- Jobs
INSERT INTO [User].[Job] (id, name, dtCreated) VALUES
(1, 'Accounting', GETDATE()),
(2, 'Admin & Clerical', GETDATE()),
(3, 'Automotive', GETDATE()),
(4, 'Banking', GETDATE()),
(5, 'Biotech', GETDATE())

-- Object
INSERT INTO [Security].[Object] (id, objectTableId, dtCreated) VALUES
(1, 1, GETDATE()),
(2, 1, GETDATE()),
(3, 1, GETDATE()),
(4, 1, GETDATE()),
(5, 1, GETDATE()),
(6, 1, GETDATE()),
(7, 1, GETDATE()),
(8, 1, GETDATE()),
(9, 1, GETDATE()),
(10, 1, GETDATE()),
(11, 1, GETDATE()),
(12, 1, GETDATE()),
(13, 1, GETDATE()),
(14, 1, GETDATE())

-- Object Right
INSERT INTO [Security].[ObjectRight] (id, name, dtCreated) VALUES
(1, 'None', GETDATE()),
(2, 'View', GETDATE()),
(3, 'Edit', GETDATE()),
(4, 'Delete', GETDATE())

-- Section
INSERT INTO [Application].[Section] (id, name, level, objectId, dtCreated) VALUES
(1, 'Home', 0, 1, GETDATE()),
(2, 'Profile', 0, 2, GETDATE())

-- Menu
INSERT INTO [Application].[Menu] (id, name, level, parentId, objectId, dtCreated) VALUES
(1, 'Main', 0, null, 3, GETDATE()),
(2, 'Company', 0, null, 4, GETDATE()),
(3, 'User List', 0, null, 5, GETDATE()),
(4, 'Message', 0, null, 6, GETDATE()),
(5, 'Account', 0, null, 7, GETDATE())

-- Menu Item
INSERT INTO [Application].[MenuItem] (id, name, objectId, link, dtCreated) VALUES
(1, 'About', 8, '/page/about.aspx', GETDATE()),
(2, 'Jobs', 9, '/page/job.aspx', GETDATE()),
(3, 'Press', 10, '/page/press.aspx', GETDATE()),
(4, 'Blog', 11, '/page/blog.aspx', GETDATE()),
(5, 'Help', 12, '/page/help.aspx', GETDATE()),
(6, 'Policies', 13, '/page/policies.aspx', GETDATE()),
(7, 'Terms & Privacy', 14, '/page/terms_privacy.aspx', GETDATE())

-- Menu Item
INSERT INTO [Application].[MenuToMenuItem] (menuId, menuItemId, dtCreated) VALUES
(2, 1, GETDATE()),
(2, 2, GETDATE()),
(2, 3, GETDATE()),
(2, 4, GETDATE()),
(2, 5, GETDATE()),
(2, 6, GETDATE()),
(2, 7, GETDATE())

-- Section Menu
INSERT INTO [Application].[SectionToMenu] (sectionId, menuId, dtCreated) VALUES
(1, 1, GETDATE()),
(1, 2, GETDATE()),
(2, 3, GETDATE()),
(2, 4, GETDATE()),
(2, 5, GETDATE())

-- Phone Type
INSERT INTO [User].[PhoneType] (id, name, dtCreated) VALUES
(1, 'Home', GETDATE()),
(2, 'Cell', GETDATE()),
(3, 'Fax', GETDATE())

-- Registration status
INSERT INTO [User].[UserRegistrationStatus] (id, name, dtCreated) VALUES
(1, 'Non Verified', GETDATE()),
(2, 'Pending', GETDATE()),
(3, 'Verified', GETDATE())

-- User status
INSERT INTO [User].[UserStatus] (id, name, dtCreated) VALUES
(1, 'Looking for house', GETDATE()),
(2, 'Looking for flatmate', GETDATE()),
(3, 'Looking for tennat', GETDATE()),
(4, 'Looking for landlord', GETDATE()),
(5, 'Looking for landlord and tennat', GETDATE())

-- Type
INSERT INTO [User].[Type] (id, name, dtCreated) VALUES
(1, 'Tennant', GETDATE()),
(2, 'Landlord', GETDATE()),
(3, 'Agency', GETDATE())

-- Role
INSERT INTO [Security].[Role] (id, name, dtCreated) VALUES
(1, 'Administrator', GETDATE()),
(2, 'Tennant', GETDATE()),
(3, 'Landlord', GETDATE()),
(4, 'Agency', GETDATE())

-- File Info
INSERT INTO [User].[FileInfo] (id, name, extension, dtCreated) VALUES
(1, 'unknow', 'none', GETDATE()),
(2, 'word', 'doc', GETDATE()),
(3, 'excel', 'xls', GETDATE()),
(4, 'powerpoint', 'ppt', GETDATE()),
(5, 'picture', 'pbg', GETDATE())

-- Friendship 
INSERT INTO [User].[FriendshipStatus] (id, name, dtCreated) VALUES
(1, 'Accepted', GETDATE()),
(2, 'Rejected', GETDATE()),
(3, 'Pending', GETDATE()),
(4, 'Deleted', GETDATE())
