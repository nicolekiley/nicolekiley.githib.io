-- View Author name, post title, and score of post.

CREATE VIEW vw_getAuthorPost AS
SELECT
author,
title,
score
FROM
author a INNER JOIN 
post p ON a.author_fullname = p.author_name;
 