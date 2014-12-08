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

-- Avatar
INSERT INTO [User].[Avatar] (id, name, [path]) VALUES
(1, 'Placeholder', '/Avatar/placeholder.png');

-- User Type
INSERT INTO [User].[UserType] (id, name) VALUES
(1, 'Anonymous'),
(2, 'Administrator'),
(3, 'Tennant'),
(4, 'Landlord'),
(5, 'Agency')