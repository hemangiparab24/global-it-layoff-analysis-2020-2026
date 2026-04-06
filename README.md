
# 🧾 Global IT Layoff Analysis – 2020 to 2026

_Analyzing global tech layoff trends to uncover patterns, impacted industries, companies, and geographies using Python, SQL, and Power BI._

---

## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#business-problem">Business Problem</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools & Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#data-cleaning--preparation">Data Cleaning & Preparation</a>
- <a href="#sql-analysis">SQL Analysis</a>
- <a href="#key-findings">Key Findings</a>
- <a href="#dashboard">Dashboard</a>
- <a href="#how-to-run-this-project">How to Run This Project</a>
- <a href="#final-recommendations">Final Recommendations</a>
- <a href="#author--contact">Author & Contact</a>

---
<h2><a class="anchor" id="overview"></a>Overview</h2>

This project analyzes 3,620+ global IT layoff events from March 2020 to March 2026. It covers data cleaning with Python (Pandas), deep analysis with SQL (PostgreSQL), and an interactive 4-page Power BI dashboard. The goal is to extract real-world insights that help job seekers, HR professionals, and policymakers understand the tech layoff crisis.

---
<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>

The tech industry witnessed one of the largest mass layoff waves in history between 2022 and 2024. This project aims to answer:
- Which companies laid off the most people?
- Which industries and geographies were hit hardest?
- When did the crisis peak and is it recovering?
- Did well-funded companies still lay off employees?
- Which company stages (Post-IPO, Seed, Series B) were most affected?

---
<h2><a class="anchor" id="dataset"></a>Dataset</h2>

- [Dataset](Data/layoffs.csv)
- [Cleaned Dataset](Data/layoffs_cleaned.csv)
- Source: Layoffs.fyi Dataset on Kaggle
- Records: 3,620+ layoff events
- Time Range: March 2020 — March 2026
- Columns: company, total_laid_off, date, percentage_laid_off, industry, stage, funds_raised, country, year, month, month_name, year_month

---

<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- **Python (Pandas):** Data cleaning & transformation
- **PostgreSQL:** Data storage & SQL analysis
- **Power BI:** Interactive 4-page dashboard
- **Jupyter Notebook:** Exploratory analysis & documentation
- **Git & GitHub:** Version control


---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
global-it-layoff-analysis/
│
├── README.md
├── .gitignore
│
├── Data/
│   ├── layoffs.csv                  
│   └── layoffs_cleaned.csv          
│
├── Notebooks/
│   └── data_cleaning.ipynb          
│
├── SQL_Scripts/
│   └── layoff_analysis.sql          
│
├── dashboard/
│   └── IT_Layoffs_Analysis.pbix     
│
└── └── images/
    ├── 1. Overview of Layoff Data.png
    ├── 2. Impact on Company and Industry.png
    ├── 3. Layoff trend over timeline and geography.png
    └── 4. Deep dive into layoff pattern.png
        
```

---
<h2><a class="anchor" id="data-cleaning--preparation"></a>Data Cleaning & Preparation</h2>

Performed in Python using Pandas:

Removed duplicate records
- Fixed date column: converted to datetime format
- Extracted year, month, month_name, year_month from date
- Cleaned text columns: stripped whitespace, fixed casing
- Fixed known dirty values (e.g. "United States." → "United States")
- Removed columns with no analytical value (source, location, date_added)
- Filled null values: total_laid_off & funds_raised → 0, text columns → "Unknown"
- Dropped rows where both total_laid_off and percentage_laid_off were null
---
<h2><a class="anchor" id="sql-analysis-eda"></a>SQL Analysis</h2>

10 analytical queries written in PostgreSQL covering:

- Overall layoff overview (total people, avg %, date range)
- Layoffs by year
- Top 10 companies with most layoffs
- Layoffs by industry
- Layoffs by country
- Monthly layoff trend
- Layoffs by company stage
- Top 5 companies per year (using RANK window function)
- Rolling total of layoffs by month
- Funds raised vs layoffs relationship

---
<h2><a class="anchor" id="key-findings"></a>Key Findings</h2>

- 843,580+ people lost jobs across 3,620+ layoff events from 2020 to 2026
- 2023 was the worst year:- 264,000 layoffs driven by Amazon, Google and Microsoft simultaneously
- January is the most dangerous month:- companies cut budgets at the start of every year
- USA accounts for 80%+ of all global IT layoffs:- the crisis was primarily American
- Consumer & Retail industries were hit the hardest by total layoff numbers
- Post-IPO companies (Amazon, Google, Meta) were responsible for the majority of job cuts
- 100+ companies completely shut down:- percentage_laid_off = 1.0 (100% workforce gone)
- January 2023 was the single peak event:- Amazon, Google, Microsoft & Salesforce all announced mass layoffs in the same month
🇮🇳 India had 66,000+ layoffs:- 2nd most affected country after USA
- Money did NOT save companies:- even highly funded startups laid off massively or shut down entirely

---
<h2><a class="anchor" id="dashboard"></a>Dashboard</h2>

4-page interactive Power BI dashboard:

- **1.Overview of Global IT Layoffs:** KPI cards (total laid off, events, avg %, companies), layoffs by year bar chart, monthly trend line chart, industry donut chart
- **2.Impact on Companies & Industries:** Top 10 companies horizontal bar, layoffs by company stage, companies that completely shutdown table, worst single layoff events table
- **3.Layoff Trends Over Time & Geography:** World map by country, monthly rolling total line chart, most dangerous months bar chart, India vs USA vs UK grouped bar
- **4.Deep Dive Into Layoff Patterns:** Funds raised vs layoffs scatter plot, industry recovery clustered bar (2020 vs 2022 vs 2023 vs 2024), top 5 companies per year table, layoff % by industry bar chart

![Global IT Layoff Analysis](Images/1.Overview Layoff Data.png)
![Global IT Layoff Analysis](Images/2.Impact on Company and Industry.png)
![Global IT Layoff Analysis](Images/3.Layoff trend over timeline and geography.png)
![Global IT Layoff Analysis](Images/4.Deep dive into layoff pattern.png)

---
<h2><a class="anchor" id="how-to-run-this-project"></a>How to Run This Project</h2>

1. Clone the repository:
```bash
git clone https://github.com/hemangiparab24/global-it-layoff-analysis-2020-2026
```
2.  Run data cleaning notebook
```bash
jupyter notebook notebooks/data_cleaning.ipynb
```
3.  Set up PostgreSQL database
```bash
CREATE DATABASE layoffs_db;
```
4.   Import cleaned CSV into PostgreSQL
```bash
COPY layoffs
FROM '/path/to/layoffs_cleaned.csv'
DELIMITER ','
CSV HEADER;
```
5.  Run SQL analysis
```bash
   psql -d layoffs_db -f sql/layoff_analysis.sql
```
   
6. Open Power BI Dashboard
- `Open Dashboard/IT_Layoffs_Analysis.pbix` in Power BI Desktop
- Connect to your PostgreSQL database
```



---
<h2><a class="anchor" id="final-recommendations"></a>Final Recommendations</h2>

- **For Job Seekers:** Avoid joining Post-IPO tech companies during Q4/Q1 budget cycles. Target Series A-B stage companies in non-consumer industries for more stable employment
- **For HR Professionals:** Monitor January layoff cycles carefully. Q1 is consistently the most dangerous period — plan retention strategies well before year end
- **For Investors:** Diversify away from Consumer and Retail tech sectors which showed the highest total layoffs. Healthcare and Hardware showed lower percentage workforce cuts
- **For Policymakers:** India being the 2nd most affected country despite being an offshore hub shows the need for stronger tech workforce protection policies
- **For Companies:** Over-hiring during boom periods leads to painful mass corrections. Sustainable hiring practices that avoid dramatic scale-up and scale-down cycles are essential


---
<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>

**Hemangi Parab**  
Data Analyst  
📧 Email: hemangiparab05@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/hemangi-parab-541b67313/)  

