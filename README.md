# World Population Data Analysis Using SQL

## Overview

The world_population database contains information about the population of various countries across different years, along with data about their geographical area, density, and growth rates. This project includes a series of SQL queries designed to analyze population trends, growth rates, and other demographic statistics.

## Dataset

The dataset `world_population_data` contains the following columns:
- `rank`: Rank of the country by population
- `cca3`: 3-letter country code
- `country`: Name of the country
- `continent`: Continent of the country
- `2023_population`: Population in 2023
- `2022_population`: Population in 2022
- `2020_population`: Population in 2020
- `2015_population`: Population in 2015
- `2010_population`: Population in 2010
- `2000_population`: Population in 2000
- `1990_population`: Population in 1990
- `1980_population`: Population in 1980
- `1970_population`: Population in 1970
- `area`: Area in square kilometers
- `density`: Population density per square kilometer
- `growth_rate`: Annual population growth rate
- `world_percentage`: Percentage of world population

## Analysis

The project includes various SQL queries for:
- **Basic Analysis:** Total records, average population, minimum and maximum values, unique continents, etc.
- **Intermediate Analysis:** Population growth rates, density distribution, historical trends, etc.
- **Advanced Analysis:** Correlation analysis, comparative metrics, ranking by density, etc.

## Setup Instructions

1. **Create the Database:**
   ```sql
   CREATE DATABASE world_population;

2. **Use the Database:**
   ```sql
   USE world_population;

3. **Create the Table:**
   ```sql
   CREATE TABLE world_population_data (
    rank INT,
    cca3 VARCHAR(3),
    country VARCHAR(255),
    continent VARCHAR(255),
    `2023_population` BIGINT,
    `2022_population` BIGINT,
    `2020_population` BIGINT,
    `2015_population` BIGINT,
    `2010_population` BIGINT,
    `2000_population` BIGINT,
    `1990_population` BIGINT,
    `1980_population` BIGINT,
    `1970_population` BIGINT,
    area_km2 BIGINT,
    density_km2 BIGINT,
    growth_rate FLOAT,
    world_percentage FLOAT
);

4. **Import the Dataset:**
- Use your preferred method to import the dataset into the `world_population_data` table.