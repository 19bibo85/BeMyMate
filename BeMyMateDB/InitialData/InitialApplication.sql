-- Language
INSERT INTO [Application].[Language] (id, code, name, link) VALUES
(1, 'en-US', 'English', '/en-US/Home.aspx'),
(2, 'it-IT', 'Italiano', '/it-IT/Home.aspx')

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
(22, 'PrivacyAnswer'),
(23, 'NotificationType');

-- Section
INSERT INTO [Application].[Section] (id, name, level, contextId) VALUES
(1, 'Home', 0, 2),
(2, 'Dashboard', 0, 2),
(3, 'Avatar', 0, 2),
(4, 'Profile', 0, 11);

-- Menu
INSERT INTO [Application].[Menu] (id, name, link, [order], contextId) VALUES
(1, 'Main', null, 0, 2),
(2, 'Company', null, 1, 2),	
(3, 'Search', null, 0, 2),
(4, 'Message', null, 1, 11),
(5, 'Account', null, 2, 11),
(6, 'Report', null, 3, 9),
(7, 'Profile', 'page_profile_detail.aspx', 0, 11),
(8, 'Review', 'page_profile_review.aspx', 1, 11);

-- Menu Item
INSERT INTO [Application].[MenuItem] (id, name, parentId, contextId, [order], link, isActive) VALUES
(1, 'About', null, 2, 0, 'page_home_about.aspx', 0),
(2, 'Jobs', null, 2, 1, 'page_home_job.aspx', 0),
(3, 'Press', null, 2, 2, 'page_home_press.aspx', 0),
(4, 'Blog', null, 2, 3, 'page_home_blog.aspx', 0),
(5, 'Help', null, 2, 4, 'page_home_help.aspx', 0),
(6, 'Policies', null, 2, 5, 'page_home_policies.aspx', 0),
(7, 'Terms & Privacy', null, 2, 6, 'page_home_terms_privacy.aspx', 0),
(8, 'User', null, 11, 0, 'page_dashboard_user.aspx', 0),
(9, 'Inbox', null, 11, 0, 'page_dashboard_inbox.aspx', 0),
(10, 'Outbox', null, 11, 1, 'page_dashboard_outbox.aspx', 0),
(11, 'Profile', null, 11, 0, 'page_dashboard_profile.aspx', 1),
(12, 'Setting', null, 11, 1, 'page_dashboard_setting.aspx', 0),
(13, 'General', null, 11, 2, 'page_dashboard_general.aspx', 0);


-- Menu Item
INSERT INTO [Application].[MenuToMenuItem] (menuId, menuItemId) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 8),
(4, 9),
(4, 10),
(5, 11),
(5, 12),
(5, 13);


-- Section Menu
INSERT INTO [Application].[SectionToMenu] (sectionId, menuId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(4, 7),
(4, 8);
