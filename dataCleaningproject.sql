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

SET SQL_SAFE_UPDATES = 0;
#nu sletter vi dubletter
delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2;

-- Standardizing data
#trim for at fjerne mellemrum

SELECT company, TRIM(company)
FROM layoffs_staging2;

update layoffs_staging2
set company = trim(company);

#nu kigger vi på industry
SELECT distinct industry
FROM layoffs_staging2
order by 1;

#kigger på location
select distinct location
from layoffs_staging2
order by 1;

#look at country
select distinct country
from layoffs_staging2
order by 1; 
#her er der to united states hvoraf den ene er med punktum

select country
from layoffs_staging2
where country like 'United States%'
order by 1;

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

#looking at date i stedet for text til date?
select `date`
from layoffs_staging2;

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

select *
from layoffs_staging2;

-- step 3. fjerne null og blank

select *
from layoffs_staging2
where total_laid_off is null;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select distinct industry
from layoffs_staging2;

select *
from layoffs_staging2
where industry is null
or industry = '';





#create a join
select *
from layoffs_staging2 table1
join layoffs_staging2 table2
	on table1.company = table2.company
    and table1.location = table2.location
where (table1.industry is null or table1.industry = '')
and table2.industry is not null;

update layoffs_staging2 table1
join layoffs_staging2 table2
	on table1.company = table2.company
set table1.industry = table2.industry
where (table1.industry is null or table1.industry = '')
and table2.industry is not null;

select *
from layoffs_staging2;


select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; #her fjerne vi støj fra datatabellen

select *
from layoffs_staging2;

#nu fjerner vi row_num fordi det ikke er nødvendigt længere
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;