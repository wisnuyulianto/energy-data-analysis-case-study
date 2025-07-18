# End to End Data Analysis: A Case Study in Navigating Ambiguous Data

**<h3>Project Summary & Key Skills Demonstrated</h3>**
<div align="justify">This project showcases a complete data analysis workflow, pivoting from a standard cost-saving analysis into a rigorous case study on data integrity validation and analytical problem-solving after discovering the dataset's pricing data was likely synthetic.</div>
<div align="justify">The final deliverables include a robust data pipeline in PostgreSQL, a comprehensive set of investigative SQL queries, and an interactive Tableau dashboard focused on visualizing the only reliable insights from the dataset: the consumption patterns.

<p></p>

[View the Interactive Dashboard on Tableau Public](https://public.tableau.com/views/Electric_17518138121650/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

<h4>Key Skills Demonstrated</h4>
This project is a practical demonstration of critical real-world analytical skills:

* **Problem Solving & Critical Thinking:** Identified that initial assumptions about the data's pricing structure were incorrect and systematically proved it through a series of targeted SQL queries.
* **Data Integrity & Validation:** Showcased the crucial importance of validating data before deriving business insights. An analyst must trust but always verify their data.
* **Adaptability & Strategic Pivoting:** When faced with ambiguous data, the project's objective was strategically pivoted to focus on delivering value by analyzing the reliable parts of the dataset: the consumption data.
* **Advanced SQL & Data Modeling:** Built a robust data pipeline in PostgreSQL, transforming raw data into a clean and reliable analytical model within a single, efficient database [VIEW](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/sql-scripts/1_create_analytics_view.sql).
* **Data Visualization & Storytelling:** Communicated the entire investigative process and presented final, reliable insights on consumption patterns in a clear, interactive Tableau dashboard.

<br>

**<h3>The Project's Story: A Data Detective's Journey</h3>**
Every data project is an investigation. This is the story of this project's key findings.

<h4>Chapter 1: The Initial Business Hypothesis</h4>

The project began with a clear objective: to quantify potential cost savings for a consumer by simulating a 20% load shift from peak (5 PM to 9 PM) to off peak hours, assuming a variable, time of use pricing structure.

<h4>Chapter 2: The Puzzling Discovery</h4>

A series of validation queries in SQL [VIEW](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/sql-scripts/2_exploratory_queries.sql) were run to understand the pricing structure. The results were highly unexpected:

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
![price validation result](https://github.com/wisnuyulianto/energy-data-analysis-case-study/blob/main/visualizations/price_validation.png)

<h4>Chapter 3: The Strategic Pivot & Final Conclusion:</h4>
The evidence strongly indicated that the pricing data was synthetic. Faced with this finding, the project's focus was pivoted to analyze the only reliable data available: **energy consumption**.

<br>

**<h3>Final Insight & Key Takeaways</h3>**
Despite the flawed pricing data, the consumption data revealed a consistent and valuable pattern: a clear peak energy usage period between 5 PM and 9 PM daily. This validated insight is the most reliable takeaway and would be the foundation for any real world energy saving strategy.
<br>
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

