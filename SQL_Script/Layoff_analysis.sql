CREATE TABLE layoffs (
    company VARCHAR(100),
    total_laid_off INT,
    date DATE,
    percentage_laid_off FLOAT,
    industry VARCHAR(100),
    stage VARCHAR(100),
    funds_raised FLOAT,
    country VARCHAR(100),
    year INT,
    month INT,
    month_name VARCHAR(20),
    year_month VARCHAR(20)
);


SELECT COUNT(*) FROM layoffs;

SELECT * FROM layoffs;


SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'layoffs';



SELECT 
    COUNT(*) AS total_records,
    SUM(total_laid_off) AS total_people_laid_off,
    ROUND(AVG(percentage_laid_off)::NUMERIC, 2) AS avg_percentage_laid_off,
    MIN(date) AS earliest_date,
    MAX(date) AS latest_date
FROM layoffs;

--Layoffs by Year 
SELECT 
    year,
    SUM(total_laid_off) AS total_laid_off,
    COUNT(*) AS total_events,
    ROUND(AVG(percentage_laid_off)::NUMERIC, 2) AS avg_percentage
FROM layoffs
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;

--Top 10 Companies with Most Layoffs
SELECT 
    company,
    SUM(total_laid_off) AS total_laid_off,
    COUNT(*) AS total_events,
    ROUND(AVG(percentage_laid_off)::NUMERIC, 2) AS avg_percentage
FROM layoffs
WHERE total_laid_off IS NOT NULL
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;

-- Layoffs by Industry--
SELECT 
    industry,
    SUM(total_laid_off) AS total_laid_off,
    COUNT(*) AS total_events,
    ROUND(AVG(percentage_laid_off)::NUMERIC, 2) AS avg_percentage
FROM layoffs
WHERE industry IS NOT NULL
AND total_laid_off IS NOT NULL
GROUP BY industry
ORDER BY total_laid_off DESC;

-- Layoffs by Country--
SELECT 
    country,
    SUM(total_laid_off) AS total_laid_off,
    COUNT(*) AS total_events,
    ROUND(AVG(percentage_laid_off)::NUMERIC, 2) AS avg_percentage
FROM layoffs
WHERE total_laid_off IS NOT NULL
GROUP BY country
ORDER BY total_laid_off DESC
LIMIT 15;

--Monthly Layoff Trend--
SELECT 
    year_month,
    SUM(total_laid_off) AS total_laid_off,
    COUNT(*) AS total_events
FROM layoffs
WHERE year_month IS NOT NULL
AND total_laid_off IS NOT NULL
GROUP BY year_month
ORDER BY year_month;

-- Layoffs by Company Stage--
SELECT 
    stage,
    SUM(total_laid_off) AS total_laid_off,
    COUNT(*) AS total_events,
    ROUND(AVG(percentage_laid_off)::NUMERIC, 2) AS avg_percentage
FROM layoffs
WHERE stage IS NOT NULL
AND total_laid_off IS NOT NULL
GROUP BY stage
ORDER BY total_laid_off DESC;

--Top 5 Companies Per Year--
SELECT year, company, total_laid_off
FROM (
    SELECT 
        year,
        company,
        SUM(total_laid_off) AS total_laid_off,
        RANK() OVER (PARTITION BY year ORDER BY SUM(total_laid_off) DESC) AS rnk
    FROM layoffs
    WHERE total_laid_off IS NOT NULL
    AND year IS NOT NULL
    GROUP BY year, company
) ranked
WHERE rnk <= 5
ORDER BY year, total_laid_off DESC;

-- Rolling Total of Layoffs by Month--
SELECT 
    year_month,
    SUM(total_laid_off) AS monthly_layoffs,
    SUM(SUM(total_laid_off)) OVER (ORDER BY year_month) AS rolling_total
FROM layoffs
WHERE year_month IS NOT NULL
AND total_laid_off IS NOT NULL
GROUP BY year_month
ORDER BY year_month;

-- Funds Raised vs Layoffs--
SELECT 
    company,
    ROUND(AVG(funds_raised)::NUMERIC, 2) AS avg_funds_raised_millions,
    SUM(total_laid_off) AS total_laid_off,
    ROUND(AVG(percentage_laid_off)::NUMERIC, 2) AS avg_percentage
FROM layoffs
WHERE funds_raised IS NOT NULL
AND total_laid_off IS NOT NULL
GROUP BY company
ORDER BY avg_funds_raised_millions DESC
LIMIT 15;


TRUNCATE TABLE layoffs;
SELECT * FROM layoffs;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(total_laid_off) AS non_null_rows,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs;