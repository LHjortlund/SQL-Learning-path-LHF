SQL Data Cleaning & Exploratory Data Analysis
This project is part of my portfolio to demonstrate my SQL skills. It documents the process of taking a raw, messy dataset ("World Layoffs") and transforming it into clean, usable data for analysis.

Project Overview
The goal was to clean a dataset containing information about company layoffs globally and then perform an exploratory data analysis (EDA) to find trends and patterns.

Database: MySQL

Dataset: World Layoffs (2022-2023)

Original Tutorial: Alex The Analyst

Key Steps Taken
1. Data Cleaning
The raw data contained duplicates, missing values, and inconsistent formatting. I performed the following steps:

Duplicate Removal: Used ROW_NUMBER() and CTEs (Common Table Expressions) to identify and remove duplicate records.

Standardization:

Trimmed extra spaces from company names.

Standardized industry names (e.g., merging "Crypto Currency" and "Crypto").

Fixed country names (removed trailing periods in "United States").

Converted the date column from text to DATE format using STR_TO_DATE.

Null Values & Blank Data:

Populated missing industry data using a Self Join to find matching company records.

Removed rows/columns that were irrelevant for the final analysis.

2. Exploratory Data Analysis (EDA)
After cleaning, I explored the data to answer key questions:

Rolling Totals: Calculated the cumulative number of layoffs month-by-month using SUM() OVER(ORDER BY ...).

Top Companies: Identified which companies laid off the most employees per year using DENSE_RANK().

Yearly Trends: Analyzed total layoffs grouped by year.

🛠️ SQL Skills Demonstrated
This project utilizes intermediate to advanced SQL concepts, including:

Window Functions: ROW_NUMBER(), DENSE_RANK(), SUM() OVER()

CTEs: Creating temporary result sets for complex calculations.

Joins: Self Joins to populate missing data.

Data Transformation: CAST, STR_TO_DATE, TRIM.

Aggregation: GROUP BY, ORDER BY.
