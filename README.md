# HR-Attrition-SQL-Python-LookerStudio
Portfolio project demonstrating SQL, Python, statistical testing, and dashboard development to analyze employee attrition and retention.

# 📊 HR Analytics: Employee Attrition & Retention Analysis

## Overview

Employee attrition is a critical challenge for organizations, leading to increased recruitment costs, productivity loss, and knowledge gaps. This project analyzes employee data to identify the key factors associated with attrition and provides data-driven recommendations to improve employee retention.

Using **SQL**, **Python**, and **Looker Studio**, I cleaned, analyzed, statistically validated, and visualized HR data to uncover actionable workforce insights.

---

## Business Problem

Organizations need to understand why employees leave in order to improve retention strategies and reduce turnover costs.

This project answers the following business questions:

* Which departments experience the highest attrition?
* Which job roles have the highest employee turnover?
* Does overtime significantly affect attrition?
* Does monthly income influence employee retention?
* How does job satisfaction impact attrition?
* Which age groups and tenure groups are most likely to leave?
* Does marital status affect employee retention?
* Which education levels experience the highest turnover?

---

## Objectives

* Clean and prepare HR data for analysis.
* Explore employee attrition patterns using SQL.
* Validate key findings using statistical testing in Python.
* Build an interactive HR dashboard for decision-makers.
* Generate actionable recommendations to improve retention.

---

## Dataset

**Source:** IBM HR Analytics Employee Attrition Dataset (Publicly Available)

The dataset contains:

* 1,470 employee records
* 35 HR-related variables but only used 15

Key variables include:

* Age
* Department
* Job Role
* Monthly Income
* Attrition
* Job Satisfaction
* Work-Life Balance
* Overtime
* Performance Rating
* Years at Company
* Education
* Marital Status

---

## Tech Stack

* **SQL (MySQL Workbench)** – Data cleaning and exploratory analysis
* **Python** – Statistical testing and data analysis
* **Pandas** – Data manipulation
* **SciPy** – Chi-Square Test and Independent T-Test
* **Looker Studio** – Interactive dashboard development
* **Git & GitHub** – Version control and project documentation

---

## Project Workflow

### 1. Data Preparation

* Imported CSV data into SQL
* Standardized column names
* Verified data types
* Checked missing values
* Validated categorical variables
* Prepared data for analysis

---

### 2. Exploratory Data Analysis (SQL)

SQL queries were used to analyze:

* Attrition by department
* Attrition by job role
* Attrition by age group
* Attrition by tenure
* Attrition by education level
* Attrition by marital status
* Monthly income distribution
* Job satisfaction
* Work-life balance

---

### 3. Statistical Analysis (Python)

To validate observed patterns, two statistical tests were performed.

### Chi-Square Test

**Question:**
Does overtime significantly affect employee attrition?

**Result**

* p-value = 8.16 × 10⁻²¹
* Decision: Reject H₀
* Conclusion: Significant relationship between overtime and attrition.

---

### Independent Two-Sample T-Test

**Question:**
Does monthly income differ between employees who stayed and those who left?

**Result**

* p-value < 0.05
* Decision: Reject H₀
* Conclusion: Employees who left had significantly lower monthly income.

---

## Dashboard

An interactive dashboard was built in Looker Studio to present business insights.

### Executive Overview

Displays:

* Attrition Rate
* Average Monthly Income
* Average Years at Company
* Employee Count

---

### HR Attrition Dashboard

Analyzes:

* Department vs Attrition
* Overtime vs Attrition
* Avg Monthly income vs Attrition
* Tenure vs Attrition

---

### Analytical Dashboard

Explores attrition by:

* Job role
* Job Satisfaction
* Age group
* Marital status

---

### Statistical Validation

Summarizes:

* Chi-Square Test
* Independent T-Test
* Statistical conclusions
* Key analytical insights

---

## Key Findings

* Employees working overtime were significantly more likely to leave.
* Lower monthly income was associated with higher attrition.
* Sales experienced the highest employee turnover.
* Sales Executive roles recorded the highest attrition.
* Employees with fewer years at the company were more likely to resign.
* Single employees experienced higher attrition than married employees.
* Job satisfaction and work-life balance showed noticeable relationships with employee retention.

---

## Business Recommendations

Based on the findings:

* Reduce excessive overtime through workload balancing.
* Review compensation for high-turnover employee groups.
* Strengthen onboarding and mentoring for new employees.
* Focus retention initiatives on high-risk departments and job roles.

---

## Project Structure

```text
HR-Attrition-Analysis/
│
├── data/
│   └── employees.csv
│
├── sql/
│   ├── data_cleaning.sql
│   ├── exploratory_analysis.sql
│
├── python/
│   ├── statistical_analysis.py
│
├── dashboard/
│   ├── HR_Analytics_Dashboard.pdf
│   ├── dashboard_screenshots/
│
├── presentation/
│   └── HR_Analytics_Presentation.pdf
│
└── README.md
```

---

## Skills Demonstrated

* Data Cleaning
* SQL Querying
* Exploratory Data Analysis (EDA)
* Statistical Analysis
* Hypothesis Testing
* Data Visualization
* Dashboard Design
* Business Storytelling
* HR Analytics
* GitHub Documentation

---

## Future Improvements

* Build a machine learning model to predict employee attrition.
* Develop an employee attrition risk score.
* Connect the dashboard to a live SQL database.
* Add trend analysis and forecasting.
* Enhance dashboard interactivity with additional filters and drill-down capabilities.

---

## Author

**Barbara**

Aspiring Data Analyst with a passion for transforming data into actionable business insights using SQL, Python, and data visualization tools.

If you found this project interesting or have feedback, feel free to connect or reach out.
