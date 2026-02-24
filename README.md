Ecommerce Revenue Intelligence (PostgreSQL)
Executive Summary
This project analyzes 541,909 e-commerce transactions (2010–2011) to extract strategic business insights related to revenue growth, customer concentration, retention behavior, and lifetime value.
The objective is to transform raw transactional data into actionable intelligence that supports data-driven decision-making.
Business Problems Addressed
How does revenue trend month-over-month?
Who are the highest lifetime value customers?
Is revenue concentrated among a small percentage of customers? (Pareto Analysis)
What is the repeat purchase rate?
How strong is customer retention across cohorts?
Which geography drives the majority of revenue?
Key Strategic Insights
1.Revenue Trends
November 2011 generated the highest monthly revenue.
Strong seasonal patterns indicate Q4 sales acceleration.
Business Implication: Revenue forecasting models should incorporate seasonal uplift factors.
2.Revenue Concentration (Pareto Analysis)
20% of customers contribute ~65% of total revenue.
Significant customer concentration risk identified.
Strategic Risk: Heavy dependency on high-value customers increases revenue volatility.
Recommendation: Implement loyalty programs and retention incentives for top-tier customers.
3.Customer Lifetime Value (CLV)
Customer ID 14646 generated the highest lifetime value.
Clear revenue stratification between top-tier and mid-tier customers.
Opportunity: Upsell and cross-sell strategies for mid-tier customers to increase AOV.
4.Customer Retention & Cohort Behavior
First-month retention ranges between 15–37%.
Seasonal reactivation observed in multiple cohorts.
Repeat purchase rate indicates moderate customer loyalty.
Business Insight: Early-stage churn is a critical improvement area.
Recommendation: Focus on onboarding engagement strategies to improve first-month retention.
5.Geographic Revenue Distribution
United Kingdom dominates total revenue contribution.
International markets contribute significantly less.
Strategic Risk: High domestic market dependency.
Opportunity: Expand marketing and distribution into underpenetrated international markets.
Technical Implementation
SQL Concepts Applied
Aggregations (SUM, COUNT, AVG)
GROUP BY, HAVING
Window Functions (RANK, ROW_NUMBER, NTILE)
CTEs (Common Table Expressions)
DATE_TRUNC, EXTRACT
Cohort Retention Modeling
Revenue Segmentation
Project Structure
/data → Raw dataset  
/sql → Data cleaning, analysis, segmentation queries  
/screenshots → Query results & output visuals  
Business Impact Perspective
This project demonstrates:
Analytical thinking beyond SQL querying
Revenue risk identification
Strategic interpretation of customer behavior
Data-to-decision storytelling
It reflects the mindset of a Business Intelligence Analyst rather than a SQL practitioner.
Author
Shivratna Waghmode