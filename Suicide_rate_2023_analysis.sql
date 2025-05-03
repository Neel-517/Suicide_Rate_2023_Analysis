/* 
Suicide Rates 2023 data exploration

Skills used: Aggregate Functions, Sorting, Limits, Filtering, SELECT Statements, Column Aliasing 

\*


-- Viewing entire data 


SELECT * FROM world_suicide_rate_2023;


-- Analyzing data

-- Top 10 countries with the highest male suicide rates 

SELECT country, male FROM world_suicide_rate_2023
WHERE country != 'world'
ORDER BY male DESC
LIMIT 10;


-- Top 10 countries with the highest female suicide rates

SELECT country, female FROM world_suicide_rate_2023
WHERE country != 'world'
ORDER BY female DESC
LIMIT 10;


-- Top 10 countries with the highest combined suicide rates

SELECT country, `all` FROM world_suicide_rate_2023
WHERE country != 'world'
ORDER BY `all` DESC
LIMIT 10; 


-- Average suicide rates globally from males and females combined

SELECT country AS 'combined', CONCAT(ROUND((male / (male + female)) * 100, 1), '%') AS male_percentage, CONCAT(ROUND((female / (male + female)) * 100, 1), '%') AS female_percentage
FROM world_suicide_rate_2023
WHERE country = 'world';


-- Average suicide rates percentage from males and females from each country

SELECT country, CONCAT(ROUND((male / (male + female)) * 100, 1), '%') AS male_percentage, CONCAT(ROUND((female / (male + female)) * 100, 1), '%') AS female_percentage, `M/F`
FROM world_suicide_rate_2023
WHERE country != 'world'
ORDER BY `M/F` DESC;


-- Countries with the highest/lowest change% in suicide rates

SELECT country, `All` AS `2023`, `2000`, CONCAT(`change%`, '%') AS `change%`
FROM world_suicide_rate_2023
WHERE country != 'world' 
ORDER BY `change%` * 1 DESC;
-- (Postive percent is bad, Negative is good) 
