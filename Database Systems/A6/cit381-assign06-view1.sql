CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumnievents` AS select `e`.`event_id` AS `event_id`,`e`.`event_name` AS `event_name`,`e`.`event_datetime` AS `event_datetime`,`e`.`other_details` AS `other_details` from `events` `e`;