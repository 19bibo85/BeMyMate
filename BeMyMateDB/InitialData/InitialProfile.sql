﻿INSERT INTO [User].[ProfileArea] (id, name, contextId) VALUES
(1, 'Basic Info', 11),
(2, 'Detail Info', 11)

INSERT INTO [User].[ProfileQuestionnaire] (id, name, contextId, areaId) VALUES
(1, 'DRINKING', 11, 2),
(2, 'SMOKING', 11, 2),
(3, 'SEXUAL ORIENTATION', 11, 2),
(4, 'WHAT KIND OF RELATIONSHIP DO YOU WANT WITH YOUR ROOMMATE?', 11, 2),
(5, 'WHAT DO YOU MAINLY USE HOME FOR?', 11, 2),
(6, 'WHEN DO YOU SHOWER?', 11, 2),
(7, 'HOW OUTGOING VS. RESERVED ARE YOU?', 11, 2),
(8, 'HOW MUCH DO YOU VALUE PRIVACY?', 11, 2),
(9, 'THOUGHTS ON OVER NIGHT GUESTS:', 11, 2),
(10, 'USING YOUR STUFF (LIKE CLOTHES, DVD’S, FOOD):', 11, 2),
(11, 'WHAT TIME DO YOU USUALLY LEAVE THE HOUSE IN THE MORNING?', 11, 2),
(12, 'HOW WOULD YOU RATE YOUR CLEANLINESS?', 11, 2),
(13, 'WHAT IS YOUR IDEAL NOISE LEVEL?', 11, 2),
(14, 'DO YOU CARE IF THE APARTMENT IS USED FOR PARTIES?', 11, 2),
(16, 'DO YOU HAVE ANY FOOD RESTRICTIONS?', 11, 2),
(17, 'DO YOU HAVE PETS?', 11, 2),
(18, 'WHAT IS YOUR LEVEL OF ENGLISH?', 11, 2);


INSERT INTO [User].[ProfileAnswer] (id, name, contextId) VALUES
(1, 'Socially/Weekend', 11),
(2, 'Weeknights', 11),
(3, 'Nope', 11),
(4, 'Never', 11),
(5, 'Not Inside', 11),
(6, 'Only when drinking', 11),
(7, 'Yep', 11),
(8, 'Straight', 11),
(9, 'Gay', 11),
(10, 'Never mind / Other', 11),
(11, 'I want to socialize with them', 11),
(12, 'Best friends forever', 11),
(13, 'Business as usual', 11),
(14, 'Studying', 11),
(15, 'Sleeping', 11),
(16, 'Work', 11),
(17, 'Parties', 11),
(18, 'Mornings', 11),
(19, 'Evenings', 11),
(20, 'Few times a day', 11),
(21, 'Every few days', 11),
(22, '1', 11),
(23, '2', 11),
(24, '3', 11),
(25, '4', 11),
(26, '5', 11),
(27, '6', 11),
(28, '7', 11),
(29, '8', 11),
(30, '9', 11),
(31, '10', 11),
(32, 'Guests are always good', 11),
(33, 'They’re ok as long as they don''t stay too often', 11),
(34, 'I don’t really like them', 11),
(35, 'Not at all', 11),
(36, 'They will definitely live in my room!', 11),
(37, 'They will occasionally stay over', 11),
(38, 'My roommates will not have the pleasure of meeting them', 11),
(39, 'That’s fine', 11),
(40, 'Ask me first', 11),
(41, 'Nope', 11),
(42, 'Before 7-8am', 11),
(43, 'Before 11am', 11),
(44, 'Around sunset', 11),
(45, 'Stay home most of the day', 11),
(46, 'Before 10pm', 11),
(47, 'Before Midnight', 11),
(48, 'Before 3am', 11),
(49, 'Sleep?', 11),
(50, 'Far Left', 11),
(51, 'Left', 11),
(52, 'Centre', 11),
(53, 'Right', 11),
(54, 'Far Right', 11),
(55, 'Politics?', 11),
(56, 'Loud music is on most of the time', 11),
(57, 'TV is on most of the time', 11),
(58, 'I''m on my phone most of the time', 11),
(59, 'I enjoy hearing myself thinking', 11),
(60, 'Yes', 11),
(61, 'It’s ok as long as I get some warning', 11),
(62, 'No', 11),
(63, 'I''m vegetarian/vegan', 11),
(64, 'I keep religious food', 11),
(65, 'I have food allergies', 11),
(66, 'Gimme anything, I''ll eat it', 11),
(67, 'I don''t eat at home, anyway', 11),
(68, 'Yes, a cat/dog', 11),
(69, 'Fish and such, but they keep quiet', 11),
(70, 'Nah, maybe only a teddy bear', 11),
(71, 'Mostly in common areas', 11),
(72, 'Mostly in bedroom', 11),
(73, 'Evenly split', 11),
(74, 'Barely at home', 11)

INSERT INTO [User].[ProfileQuestionnaireToAnswer] (questionnaireId, answerId) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 8),
(3, 9),
(3, 10)