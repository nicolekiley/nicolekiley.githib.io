-- A query to list all persons with family relationships using joins between person, family and relationship

SELECT
rel.family, rel.person, rel.relationship
FROM
family JOIN person JOIN relationship;
