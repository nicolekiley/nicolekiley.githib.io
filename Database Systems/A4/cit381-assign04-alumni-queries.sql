-- Queries

-- 1. selecting first and last name from member
select first_name, last_name from member;

-- 2. ordering results by first name
select * from member order by first_name;

-- selecting results from multiple tables
select * from member, blog_entries where (member_id = 1);

-- subquery
select 
* 
from member, blog entries 
where (member_id = 1)
	in (select distinct entry_id from blog_entries);
