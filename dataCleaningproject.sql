-- Data cleaning

select *
from layoffs;

-- Step 1. Remove duplicates if any
-- Step 2. Standardize the Data so all data is at it should be presented
-- Step 3. Look at Null value or blank values
-- Step 4. Remove columns that aren't necessary(last step)

#create staging miljø for at teste af, så man ikke risikerer at miste rådata fra original database

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;
#tom database

insert layoffs_staging
select *
from layoffs;

#step 1 remove duplicates

select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num  
from layoffs_staging;

with duplicate_cte as
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num  
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

#check duplicates
select *
from layoffs_staging
where company = 'Vacasa';

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;
#nu har vi en ny tabel der er tom med row_num

#næste step er at indsætte data ind i tabellen
insert into layoffs_staging2
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num  
from layoffs_staging;

#her kan vi se dubletter
select *
from layoffs_staging2
where row_num > 1;

#nu sletter vi dubletter
delete
from layoffs_staging2
where row_num > 1;