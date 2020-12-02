-- Table 1 Data: Blog

SELECT `blog`.`blog_id`,
    `blog`.`blog_details`
FROM `assign04`.`blog`;

-- Table 2 Data: Blog entries

SELECT `blog_entries`.`entry_id`,
    `blog_entries`.`blog_id`
FROM `assign04`.`blog_entries`;

-- Table 3 Data: member

SELECT `member`.`member_id`,
    `member`.`first_name`,
    `member`.`last_name`,
    `member`.`blog_id`
FROM `assign04`.`member`;


