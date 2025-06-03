/* 
Suicide Rates 2023 data exploration

Skills used: Aggregate Functions, Sorting, Limits, Filtering, SELECT Statements, ORDER BY, Column Aliasing, Case use 


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


-- Top 10 countries with highest combined suicide rates

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


-- Countries have have an increase or decrease in suicide rates percentage

SELECT country, `All` AS `2023`, `2000`, CONCAT(ROUND(((`All` - `2000`) / `2000`) * 100), '%') AS `change% 2000 to 2023`,
CASE 
WHEN ((`All` - `2000`) / `2000`) * 100 > 0 THEN 'Increase'
WHEN ((`All` - `2000`) / `2000`) * 100 < 0 THEN 'Decrease'
ELSE 'No Change'
END AS `Change`
FROM world_suicide_rate_2023;


-- Countries that have positive or negative trends in suicide rates 

SELECT country, `All` AS `2023`, `2000`, 
CASE 
WHEN `All` > `2000` THEN 'Negative'
WHEN `All` < `2000` THEN 'Positive'
ELSE 'No Change'
END AS Trend
FROM world_suicide_rate_2023
ORDER BY country;