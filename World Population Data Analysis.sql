CREATE DATABASE world_population;

USE world_population;

-- 1. Total Number of Records:
SELECT COUNT(*) AS Total_Records 
FROM world_population_data;

-- 2. Average Population in 2023:
SELECT AVG(`2023_population`) AS Avg_Population_2023 
FROM world_population_data;

-- 3. Minimum and Maximum Population in 2023:
SELECT MIN(`2023_population`) AS Min_Population_2023, 
       MAX(`2023_population`) AS Max_Population_2023 
FROM world_population_data;

-- 4. Number of Unique Continents:
SELECT COUNT(DISTINCT continent) AS Unique_Continents 
FROM world_population_data;

-- 5. Top 5 Countries by Population in 2023:
SELECT country, `2023_population` 
FROM world_population_data 
ORDER BY `2023_population` DESC 
LIMIT 5;

-- 6. Bottom 5 Countries by Population in 2023:
SELECT country, `2023_population` 
FROM world_population_data 
ORDER BY `2023_population` ASC 
LIMIT 5;

-- 7. Average Population Growth Rate by Continent:
SELECT continent, AVG(growth_rate) AS Avg_Growth_Rate 
FROM world_population_data 
GROUP BY continent;

-- 8. Total Population in 2023 by Continent:
SELECT continent, SUM(`2023_population`) AS Total_Population_2023 
FROM world_population_data 
GROUP BY continent;

-- 9. Countries with Population Above the Average in 2023:
SELECT country, `2023_population` 
FROM world_population_data 
WHERE `2023_population` > (SELECT AVG(`2023_population`) FROM world_population_data);

-- 10. Density Distribution Across Continents:
SELECT continent, AVG(density) AS Avg_Density 
FROM world_population_data 
GROUP BY continent;

-- 11. Growth Rate Analysis Over Time (Past 50 Years):
SELECT country, 
       (`2023_population` - `1970_population`) / `1970_population` * 100 AS Growth_Rate_Past_50_Years 
FROM world_population_data;

-- 12. Comparison of Population in 2000 vs. 2023:
SELECT country, 
       `2000_population`, 
       `2023_population`, 
       (`2023_population` - `2000_population`) AS Population_Increase 
FROM world_population_data;

--  13. Population Density vs. Growth Rate:
SELECT country, density, growth_rate 
FROM world_population_data 
WHERE density IS NOT NULL AND growth_rate IS NOT NULL;

-- 14. Top 10 Countries with Highest Population Growth Rate:
SELECT country, growth_rate 
FROM world_population_data 
ORDER BY growth_rate DESC 
LIMIT 10;

-- 15. Countries with Area and Population Correlation:
SELECT country, area, `2023_population`, 
       (CAST(`2023_population` AS FLOAT) / area) AS Population_Density 
FROM world_population_data 
WHERE area > 0;

-- 16. Historical Population Trend Analysis for a Specific Country:
SELECT country, `1970_population`, `1980_population`, `1990_population`, 
       `2000_population`, `2010_population`, `2015_population`, 
       `2020_population`, `2022_population`, `2023_population`
FROM world_population_data
WHERE country = 'Specific Country';

-- 17. Continent-wise Average Population Growth Rate Over Time:
SELECT continent, AVG(growth_rate) AS Avg_Growth_Rate
FROM world_population_data
GROUP BY continent;

-- 18. Countries with the Largest Area and Highest Population:
SELECT country, area, `2023_population`
FROM world_population_data
ORDER BY area DESC, `2023_population` DESC
LIMIT 10;

-- 19. Percentage of World Population by Continent:
SELECT continent, SUM(world_percentage) AS Total_World_Percentage 
FROM world_population_data 
GROUP BY continent;

-- 20. Growth Rate Comparison by Area Size:
SELECT CASE 
           WHEN area < 10000 THEN 'Small'
           WHEN area BETWEEN 10000 AND 50000 THEN 'Medium'
           ELSE 'Large'
       END AS Area_Category,
       AVG(growth_rate) AS Avg_Growth_Rate
FROM world_population_data
GROUP BY Area_Category;

-- 21. Top 5 Countries by Population in 1970 vs. 2023:
SELECT country, `1970_population`, `2023_population`
FROM world_population_data
ORDER BY `1970_population` DESC, `2023_population` DESC
LIMIT 5;

-- 22. Change in Population Density Over Decades:
SELECT country, 
       Density_2023, 
       Density_2000, 
       (Density_2023 - Density_2000) AS Density_Change
FROM (
    SELECT country, 
           (`2023_population` / area) AS Density_2023, 
           (`2000_population` / area) AS Density_2000
    FROM world_population_data
    WHERE area > 0
) AS density_data
LIMIT 0, 1000;

-- 23. Top 5 Countries with Highest Population Density:
SELECT country, density
FROM world_population_data 
ORDER BY density DESC 
LIMIT 5;

-- 24. Trend of Population Growth Rates by Continent:
SELECT continent, 
       AVG(growth_rate) AS Avg_Growth_Rate, 
       COUNT(*) AS Country_Count
FROM world_population_data 
GROUP BY continent 
ORDER BY continent;

-- 25. Percentage of World Population Over Time:
SELECT country, 
       (`2023_population` / total_population) * 100 AS Percentage
FROM (
    SELECT country, 
           `2023_population`, 
           (SELECT SUM(`2023_population`) FROM world_population_data) AS total_population
    FROM world_population_data
) AS percentage_data;

-- 26. Comparison of Population Growth by Area Size:
SELECT CASE 
           WHEN area < 50000 THEN 'Small'
           WHEN area BETWEEN 50000 AND 200000 THEN 'Medium'
           ELSE 'Large'
       END AS Area_Category,
       AVG(growth_rate) AS Avg_Growth_Rate
FROM world_population_data
GROUP BY Area_Category;

-- 27. Change in Population in the Last 50 Years:
SELECT country, 
       `2023_population` - `1970_population` AS Population_Change 
FROM world_population_data;

-- 28. Countries with Population Growth Rate Above Average:
SELECT country, growth_rate 
FROM world_population_data 
WHERE growth_rate > (SELECT AVG(growth_rate) FROM world_population_data);

-- 29. Density vs. Population Growth Rate Analysis:
SELECT country, density, growth_rate 
FROM world_population_data 
WHERE density IS NOT NULL AND growth_rate IS NOT NULL
ORDER BY density DESC, growth_rate DESC;

-- 30. Average Population and Area by Continent:
SELECT continent, 
       AVG(`2023_population`) AS Avg_Population, 
       AVG(area) AS Avg_Area 
FROM world_population_data 
GROUP BY continent;

-- 31. Aggregate Growth Rate from 2000 to 2023 by Continent:
SELECT continent, 
       AVG((`2023_population` - `2000_population`) / `2000_population` * 100) AS Avg_Growth_Rate_2000_to_2023
FROM world_population_data
GROUP BY continent;

-- 32. Historical Population Change for Each Continent:
SELECT continent,
       SUM(`2023_population`) - SUM(`1970_population`) AS Population_Change_1970_to_2023
FROM world_population_data
GROUP BY continent;

-- 33. Countries with the Highest Population Growth Rate in Specific Decades: 
SELECT country,
       `2020_population` - `2010_population` AS Growth_Rate_2010_to_2020,
       `2010_population` - `2000_population` AS Growth_Rate_2000_to_2010
FROM world_population_data
ORDER BY Growth_Rate_2010_to_2020 DESC
LIMIT 10;
