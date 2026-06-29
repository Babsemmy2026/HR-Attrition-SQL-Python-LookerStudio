USE hr_analytics;

Describe employees;

SELECT *
FROM employees;

Alter table employees
Change `ï»¿Age` Age INT;

-- Check for missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(Age) AS age_count,
    COUNT(MonthlyIncome) AS income_count,
    COUNT(Attrition) AS attrition_count,
    COUNT(JobRole) AS jobrole_count
FROM employees;

-- Check for duplicates
SELECT
    EmployeeNumber,
    COUNT(*) AS occurrences
FROM employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Verify categorical variables
SELECT DISTINCT Attrition
FROM employees;

SELECT DISTINCT Department
FROM employees;

SELECT DISTINCT MaritalStatus
FROM employees;

SELECT DISTINCT OverTime
FROM employees;

-- Check numeric ranges
SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age
FROM employees;

SELECT
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome) AS max_income
FROM employees;

