USE hr_analytics;

-- 1. Overall attrition rate
SELECT
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
    2) AS attrition_rate
FROM employees;			-- 16.12

-- 2. Attrition by department
SELECT
    department,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY department
ORDER BY attrition_rate DESC; -- Sales dept 20.63

-- 3. Overtime vs attrition
SELECT overtime,
		ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY overtime; -- overtime 30.53

-- Distribution of attrition across salary levels
SELECT
    attrition,
    CASE
        WHEN monthlyincome < 3000 THEN 'Low'
        WHEN monthlyincome < 7000 THEN 'Medium'
        ELSE 'High'
    END AS income_band,
    COUNT(*) AS employees
FROM employees
GROUP BY attrition, income_band;

SELECT
    CASE
        WHEN monthlyincome < 3000 THEN 'Low'
        WHEN monthlyincome < 7000 THEN 'Medium'
        ELSE 'High'
    END AS income_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS leavers,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY income_band
ORDER BY attrition_rate DESC;

-- 4. Average income by attrition
SELECT
    attrition,
    ROUND(AVG(monthlyincome),2) AS avg_income
FROM employees
GROUP BY attrition; -- Attrition €4787

-- 5. Attrition by job satisfaction
SELECT
    jobsatisfaction,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction; -- 1, 22.84

-- 6. Which job roles experience the highest turnover
SELECT jobrole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY jobrole
ORDER BY attrition_rate DESC;  -- Sales rep 39.76

-- 7. Are newer employees more likely to leave?
SELECT
    CASE
        WHEN yearsatcompany <= 2 THEN '0-2 Years'
        WHEN yearsatcompany <= 5 THEN '3-5 Years'
        WHEN yearsatcompany <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS tenure_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY tenure_group
ORDER BY tenure_group;   -- 0-2yrs 29.82

-- 8. How does job satisfaction affect attrition?
SELECT
    jobsatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction; -- 1, 22.84

-- 9. Which employees report poor work-life balance?
SELECT
    department,
    COUNT(*) AS employees_with_poor_wlb
FROM employees
WHERE worklifebalance = 1
GROUP BY department
ORDER BY employees_with_poor_wlb DESC;    -- R&D 60

-- Work-Life Balance by Job Role
SELECT
    jobrole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN worklifebalance = 1 THEN 1 ELSE 0 END) AS poor_wlb_count,
    ROUND(SUM(CASE WHEN worklifebalance = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_wlb_percentage
FROM employees
GROUP BY jobrole
ORDER BY poor_wlb_percentage DESC;     -- lab tech 7.72

-- Relationship Between Work-Life Balance and Attrition
SELECT
    worklifebalance,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY worklifebalance
ORDER BY worklifebalance;

-- 10. Does performance rating influence retention? 
SELECT
    performancerating,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY performancerating
ORDER BY performancerating;    -- 3,4 (16.8, 16.37)

-- 11. Which age groups experience the highest attrition? 
SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY attrition_rate DESC;   -- <30 = 22.91

-- 12. Does marital status affect attrition? 
SELECT maritalstatus,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY maritalstatus
ORDER BY attrition_rate DESC; -- single 25.53

-- 13. Which education levels have the highest turnover? 
SELECT
    education,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY education
ORDER BY attrition_rate DESC;   -- 1, 18.24

SELECT
    CASE education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS education_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY education
ORDER BY attrition_rate DESC;    -- below college 18.24

-- Which education field has the highest rate of employees leaving, relative to its size?
SELECT
    EducationField,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 1.0 / COUNT(*) AS attrition_rate
FROM employees
GROUP BY EducationField
ORDER BY attrition_rate DESC;
