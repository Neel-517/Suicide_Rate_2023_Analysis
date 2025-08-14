-- Suicide Rates 2023 data exploration

-- Skills used: Aggregate Functions, Sorting, Limits, Filtering, SELECT Statements, ORDER BY, Column Aliasing, Case use 


-- Viewing entire data 

SELECT * FROM world_suicide_rate_2023;


-- Analyzing data

-- 1. Top 10 countries with the highest male suicide rates 

SELECT country, male FROM world_suicide_rate_2023
ORDER BY male DESC
LIMIT 10;


-- 2. Top 10 countries with the highest female suicide rates

SELECT country, female FROM world_suicide_rate_2023
ORDER BY female DESC
LIMIT 10;


-- 3. Top 10 countries with the highest combined suicide rates

SELECT country, `all` FROM world_suicide_rate_2023
ORDER BY `all` DESC
LIMIT 10; 


-- 4. Top 10 countries with the highest male-to-female suicide rate ratio

SELECT country, `M/F`, CONCAT(ROUND((male / (male + female)) * 100, 1), '%') AS male_percentage, CONCAT(ROUND((female / (male + female)) * 100, 1), '%') AS female_percentage
FROM world_suicide_rate_2023
ORDER BY `M/F` DESC
LIMIT 10;


-- 5. Average suicide rates globally for males and females combined

SELECT country AS 'combined', CONCAT(ROUND((male / (male + female)) * 100, 1), '%') AS male_percentage, CONCAT(ROUND((female / (male + female)) * 100, 1), '%') AS female_percentage
FROM world_suicide_rate_2023;


-- 6. Countries that have an increase or decrease in the percentage of suicide rates percentage

SELECT country, `All` AS `2023`, `2000`, CONCAT(ROUND(((`All` - `2000`) / `2000`) * 100), '%') AS `change% 2000 to 2023`,
CASE 
WHEN ((`All` - `2000`) / `2000`) * 100 > 0 THEN 'Increase'
WHEN ((`All` - `2000`) / `2000`) * 100 < 0 THEN 'Decrease'
ELSE 'No Change'
END AS `Change`
FROM world_suicide_rate_2023;


-- 7. Countries that have positive or negative trends in suicide rates 

SELECT country, `All` AS `2023`, `2000`, 
CASE 
WHEN `All` > `2000` THEN 'Negative'
WHEN `All` < `2000` THEN 'Positive'
ELSE 'No Change'
END AS Trend
FROM world_suicide_rate_2023`suicide_rates2023`;


-- 8. Continents with the highest overall, male, female, and male-to-female ratio suicide rates

SELECT Continent, ROUND(AVG(`All`), 2) AS `All`,ROUND(AVG(Male), 2) AS Male, ROUND(AVG(Female), 2) AS Female, ROUND(AVG(`M/F`), 2) AS male_to_female_ratio
FROM world_suicide_rate_2023
GROUP BY Continent;
