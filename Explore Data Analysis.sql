-- Explore Data Analysis

select *
from layoffs_staging2;

#kigger på max total_laid_off og percentage_laid_off
select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

#kigger på de firmaer som gik nedenom og hjem
select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

#kigge for perioden denne tabel dækker over = 2022-12-06 - 2023-03-06
select min(`date`), max(`date`)
from layoffs_staging2;

#kigge på hvilken industri som har været hårdest ramt
select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

#kigge på hvilke lande som har været hårdest ramt
select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

#kigger på hvilke år der blev fyret mange
select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

#stage of the company
select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 1 desc;

-- Rolling total layoff
select *
from layoffs_staging2;

SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off,
SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;


#year
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

#avanceret rangering, DENSE_RANK() som giver 1,2.,x. pladsen for hvert år
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE ranking <= 5;