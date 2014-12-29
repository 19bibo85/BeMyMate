-- Genders
INSERT INTO [User].[Gender] (id, name) VALUES
(1, 'None'),
(2, 'Male'),
(3, 'Female')

-- Jobs
INSERT INTO [User].[Job] (id, name) VALUES
(0, 'None'),
(1, 'Accounting'),
(2, 'Admin & Clerical'),
(3, 'Automotive'),
(4, 'Banking'),
(5, 'Biotech')

-- Phone Type
INSERT INTO [User].[PhoneType] (id, name) VALUES
(0, 'None'),
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

-- Country
INSERT INTO [User].[Country] (id, name) VALUES
(0, 'None');

-- Province
INSERT INTO [User].[Province] (id, name, countryId) VALUES
(0, 'None', 0);

-- AddressType
INSERT INTO [User].[AddressType] (id, name) VALUES
(0, 'None'),
(1, 'Home'),
(2, 'Work');

-- Address
INSERT INTO [User].[Address] (addressLine, city, provinceId, postalCode, typeId) VALUES
('none', 'none', 0, 'none', 0);

-- Phone
INSERT INTO [User].[Phone] (prefix, number, typeId) VALUES
('+00', '000 000 000', 0);

-- Nationality
INSERT INTO [User].[Nationality] (id, name) VALUES
(0, 'Unknow'),
(1, 'English'),
(2, 'Italian');

-- Notification Type
INSERT INTO [User].[NotificationType] (id, name) VALUES
(0, 'None'),
(1, 'Friendship Request'),
(2, 'New Message');

-- User
INSERT INTO [User].[User] (name, surname, email, username, [password], genderId, avatarId, statusId, registrationStatusId) VALUES
('Anonymous', 'Anonymous', 'anonymous@gmail.com', 'Anonymous', 'Anonymous123', 1, 1, 1, 1),
('Alberto', 'Tosi Brandi', 'alberto.tosibrandi@gmail.com', 'alberto.tosibrandi', 'password123', 1, 1, 1, 1);