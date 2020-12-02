-- 1. inserts user IDs and any other user information you can find into the user table

DELIMITER //
CREATE PROCEDURE sp_insertUserID(in userID VARCHAR(45))
BEGIN
	INSERT INTO author (author_fullname)
    VALUES (@userID);
END //
DELIMITER ;

-- 2. inserts data into the posting table and must include a user ID value in addition 
-- to all of the data required by the posting table

DELIMITER //
CREATE PROCEDURE sp_InsertPost (in postID VARCHAR(45), 
title VARCHAR(300), created INT(20), score INT(9), num_crosspost INT(9), 
url VARCHAR(300), userID VARCHAR(45))
BEGIN
	INSERT INTO post
	VALUES (postID, title, created, score, num_crosspost, url, userID);
END //
DELIMITER ;
    