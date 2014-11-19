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

-- Genders
INSERT INTO [User].[Gender] (id, refCode, name, dtCreated) VALUES
(1, 'gen_001', 'None', GETDATE()),
(2, 'gen_002', 'Male', GETDATE()),
(3, 'gen_003', 'Female', GETDATE())

-- Jobs
INSERT INTO [User].[Job] (id, refCode, name, dtCreated) VALUES
(1, 'job_001', 'Accounting', GETDATE()),
(2, 'job_002', 'Admin & Clerical', GETDATE()),
(3, 'job_003', 'Automotive', GETDATE()),
(4, 'job_004', 'Banking', GETDATE()),
(5, 'job_005', 'Biotech', GETDATE())

-- Object
INSERT INTO [Security].[Object] (id, name, dtCreated) VALUES
(1, 'Common', GETDATE()),
(2, 'Common', GETDATE()),
(3, 'Common', GETDATE()),
(4, 'Common', GETDATE()),
(5, 'Common', GETDATE()),
(6, 'Common', GETDATE()),
(7, 'Common', GETDATE()),
(8, 'Common', GETDATE()),
(9, 'Common', GETDATE()),
(10, 'Common', GETDATE()),
(11, 'Common', GETDATE()),
(12, 'Common', GETDATE()),
(13, 'Common', GETDATE()),
(14, 'Common', GETDATE())

-- Object Right
INSERT INTO [Security].[ObjectRight] (id, name, dtCreated) VALUES
(1, 'None', GETDATE()),
(2, 'View', GETDATE()),
(3, 'Edit', GETDATE()),
(4, 'Delete', GETDATE())

-- Section
INSERT INTO [Application].[Section] (id, refCode, name, level, objectId, dtCreated) VALUES
(1, 'section_001', 'Home', 0, 1, GETDATE()),
(2, 'section_002', 'Profile', 0, 2, GETDATE())

-- Menu
INSERT INTO [Application].[Menu] (id, refCode, name, level, parentId, objectId, dtCreated) VALUES
(1, 'app_001', 'Main', 0, null, 3, GETDATE()),
(2, 'app_002', 'Company', 0, null, 4, GETDATE()),
(3, 'app_003', 'User List', 0, null, 5, GETDATE()),
(4, 'app_004', 'Message', 0, null, 6, GETDATE()),
(5, 'app_005', 'Account', 0, null, 7, GETDATE())

-- Menu Item
INSERT INTO [Application].[MenuItem] (id, refCode, name, objectId, dtCreated) VALUES
(1, 'men_001', 'About', 8, GETDATE()),
(2, 'men_002', 'Jobs', 9, GETDATE()),
(3, 'men_003', 'Press', 10, GETDATE()),
(4, 'men_004', 'Blog', 11, GETDATE()),
(5, 'men_005', 'Help', 12, GETDATE()),
(6, 'men_006', 'Policies', 13, GETDATE()),
(7, 'men_007', 'Terms & Privacy', 14, GETDATE())

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
INSERT INTO [User].[PhoneType] (id, refCode, name, dtCreated) VALUES
(1, 'pho_001', 'Home', GETDATE()),
(2, 'pho_002', 'Cell', GETDATE()),
(3, 'pho_003', 'Fax', GETDATE())

-- Registration status
INSERT INTO [User].[UserRegistrationStatus] (id, refCode, name, dtCreated) VALUES
(1, 'urs_001', 'Non Verified', GETDATE()),
(2, 'urs_002', 'Pending', GETDATE()),
(3, 'urs_003', 'Verified', GETDATE())

-- User status
INSERT INTO [User].[UserStatus] (id, refCode, name, dtCreated) VALUES
(1, 'user_status_001', 'Looking for house', GETDATE()),
(2, 'user_status_002', 'Looking for flatmate', GETDATE()),
(3, 'user_status_003', 'Looking for tennat', GETDATE()),
(4, 'user_status_004', 'Looking for landlord', GETDATE()),
(5, 'user_status_005', 'Looking for landlord and tennat', GETDATE())

-- Type
INSERT INTO [User].[Type] (id, refCode, name, dtCreated) VALUES
(1, 'user_type_001', 'Tennant', GETDATE()),
(2, 'user_type_002', 'Landlord', GETDATE()),
(3, 'user_type_003', 'Agency', GETDATE())

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
INSERT INTO [User].[FriendshipStatus] (id, refCode, name, dtCreated) VALUES
(1, 'friendship_status_001', 'Accepted', GETDATE()),
(2, 'friendship_status_002', 'Rejected', GETDATE()),
(3, 'friendship_status_003', 'Pending', GETDATE()),
(4, 'friendship_status_004', 'Deleted', GETDATE())