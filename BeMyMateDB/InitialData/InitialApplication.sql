-- Language
INSERT INTO [Application].[Language] (id, code, name, link) VALUES
(1, 'en-US', 'English', '/en-US/home.aspx'),
(2, 'it-IT', 'Italiano', '/it-IT/home.aspx')

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
(0, 'Table'),
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
(11, 'GroupObject'),
(12, 'ProfileArea'),
(13, 'ProfileQuestionnaire'),
(14, 'ProfileAnswer'),
(15, 'Group'),
(16, 'Nationality'),
(17, 'City'),
(18, 'Country'),
(19, 'AddressType'),
(20, 'PrivacyArea'),
(21, 'PrivacyQuestionnaire'),
(22, 'PrivacyAnswer');

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