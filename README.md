# End to End Data Analysis: A Case Study in Navigating Ambiguous Data

**<h3>Project Summary & Key Skills Demonstrated</h3>**
<div align="justify">This project demonstrates a complete, end to end data analysis workflow, simulating a real world challenge where empirical data contradicts initial business assumptions. Tasked with analyzing a minute by minute energy dataset, the project strategically pivots from a standard cost saving analysis into a rigorous case study on analytical problem solving, data integrity validation, and adaptability.</div>
<div align="justify">The final deliverables include a robust data pipeline in PostgreSQL, a comprehensive set of investigative SQL queries, and an interactive Tableau dashboard focused on visualizing the only reliable insights from the dataset: the consumption patterns.

<p></p>

[View the Interactive Dashboard on Tableau Public](https://public.tableau.com/views/Electric_17518138121650/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

<h4>Key Skills Showcased:</h4>

* **Problem Solving & Critical Thinking:** Identified that initial assumptions about the data's pricing structure were incorrect and systematically proved it through a series of targeted SQL queries.
* **Advanced SQL & Data Modeling:** Built a robust data pipeline in PostgreSQL, transforming raw data into a clean, enriched, and reliable analytical model within a single, efficient database [VIEW](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/sql-scripts/1_create_analytics_view.sql).
* **Exploratory Data Analysis (EDA):** Applied various aggregation and investigation techniques to reverse engineer the true nature of the dataset, a crucial skill for any data professional.
* **Data Visualization & Storytelling:** Communicated the entire investigative process and presented final insights on consumption patterns (rather than price) in a clear, interactive Tableau dashboard.

<br>

**<h3>The Project's Story: A Data Detective's Journey</h3>**
Every data project is an investigation. This is the story of this project's key findings.

<h4>Chapter 1: The Initial Business Hypothesis</h4>

The project was initially designed with a clear business objective: to quantify the potential cost savings for a consumer by simulating a **20% load shift** from peak consumption hours (e.g., 5 PM - 9 PM) to off peak hours. This hypothesis, rooted in the assumption of a variable pricing structure, served as the starting point for the entire investigation.

<h4>Chapter 2: The Puzzling Discovery</h4>

A series of validation  queries [VIEW](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/sql-scripts/2_exploratory_queries.sql) were run to understand the pricing structure. The results were highly unexpected:

1. **No Time Based Pattern:** The average price was virtually identical across all 24 hours of the day.
2. **No Day Type Influence:** Pricing patterns did not differ between weekdays, weekends, or public holidays.
3. **Unnatural Monthly Stability:** The average monthly prices showed almost no seasonal fluctuation, which is inconsistent with real world energy market behavior.

**Visual Evidence:** The query below was run to check the average price per hour. The result, as shown in the screenshot, was nearly flat, contradicting the Time of Use hypothesis.

```
-- Query to analyze the average price distribution per hour
SELECT
    EXTRACT(HOUR FROM date_time) AS hour,
    AVG(price_tou) AS avg_price
FROM
    energy_data.CLEAN_ENERGY_DATA
GROUP BY
    hour
ORDER BY
    hour;
```
![avg price by hour result](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/visualizations/avg_price_by_hour_result.png)

<h4>Chapter 3: The Critical Conclusion & Strategic Pivot</h4>
The evidence strongly indicated that the pricing data within this dataset is synthetic or randomly generated, not representative of a real world tariff structure.

Faced with this finding, the project's objective was strategically pivoted. It became a demonstration of how to handle ambiguous data, focusing on delivering value by analyzing the reliable parts of the dataset: **the consumption data.**

<br>

**<h3>Final Conclusion & Key Takeaways</h3>**
This project transformed from a cost saving analysis into a data investigation case study, highlighting a critical real world skill: navigating and drawing value from imperfect data.
* **Key Finding 1 (Data Integrity):** It was statistically demonstrated that the pricing data is likely synthetic. This underscores the critical importance of data validation before deriving business insights. An analyst must trust but always verify their data.
* **Key Finding 2 (Consumption Patterns):** Despite the flawed pricing data, the consumption data revealed a consistent and valuable pattern: a clear **peak energy usage period between 5 PM and 9 PM** daily. This insight is the most reliable takeaway and would be the foundation for any real world energy saving strategy.
* **Project Value (Demonstrated Skills):** This project showcases core analytical competencies: the **adaptability** to pivot strategy when faced with unexpected data, the **analytical rigor** to systematically test hypotheses with SQL, and the **integrity** to base final conclusions only on validated, reliable data.

<br>

**<h3>Technical Architecture & Workflow</h3>**
This project utilizes an industry standard workflow, separating backend data processing from frontend visualization.

1. **Backend (PostgreSQL):** All ETL (Extract, Transform, Load) processes including data cleaning, deduplication, anomaly handling, and feature engineering are encapsulated within a single, comprehensive SQL [VIEW](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/sql-scripts/1_create_analytics_view.sql). This creates an efficient and maintainable "Single Source of Truth".
2. **Frontend (Tableau Public):** To accommodate the platform's limitations, the final, analytics ready dataset was exported from the PostgreSQL into a [.csv](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/data/analytics_energy_data.csv) file. This clean file serves as the source for the interactive dashboard built in Tableau Public.

<br>

**<h3>Tools and Technologies</h3>**
* **Database:** PostgreSQL
* **Data Transformation & Analysis:** SQL (using CTEs and Window Functions)
* **Data Visualization & Dashboard:** Tableau Public

<br>

**<h3>Dashboard & Key Visualizations [LINK](https://public.tableau.com/views/Electric_17518138121650/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)</h3>**
The final dashboard focuses on providing a clear overview of **energy consumption patterns**, as the pricing data was found to be unreliable for tariff analysis.

![dashboard preview](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/visualizations/dashboard_preview.png)
<h4>Key Visualizations:</h4>

- **Consumption Heatmap:** Visualizes the "hottest" times for energy usage by hour and day of the week.
- **Monthly Consumption Trend:** A bar chart showing total energy usage month over month.
- **Total Cost Comparison:** A simple comparison of the total annual cost based on the three (likely random) pricing columns provided.

</div>

