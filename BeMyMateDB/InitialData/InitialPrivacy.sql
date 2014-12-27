INSERT INTO [User].[PrivacyArea] (id, name, contextId) VALUES
(1, 'Who can see my stuff?', 11),
(2, 'Who can contact me?', 11)

INSERT INTO [User].[PrivacyQuestionnaire] (id, name, contextId, areaId) VALUES
(1, 'Who can see your profile details?', 11, 1),
(2, 'Who can send you friend request?', 11, 2);

INSERT INTO [User].[PrivacyAnswer] (id, name, contextId, isDefault) VALUES
(0, 'None', 11, 0),
(1, 'Only Me', 11, 1),
(2, 'Friends', 11, 0),
(3, 'Public', 11, 0),
(4, 'Everyone', 11, 1),
(5, 'Friends of friends', 11, 0);

INSERT INTO [User].[PrivacyQuestionnaireToAnswer] (questionnaireId, answerId) VALUES
(1, 0),
(1, 1),
(1, 2),
(2, 0),
(2, 3),
(2, 4),
(2, 5);