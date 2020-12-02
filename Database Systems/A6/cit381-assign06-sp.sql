DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteEvent`(in eventID int(11))
BEGIN
    DELETE
    FROM assign04.events
    WHERE event_id = eventID;
END$$
DELIMITER ;
