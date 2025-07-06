CREATE OR REPLACE VIEW energy_data.ANALYTICS_ENERGY_DATA AS
WITH 
-- Step 1: Cast Data Types and Normalize Column Names from the raw source
source_and_casted AS (
    SELECT
        "Date"::timestamp                   AS date_time,
        "Consumption (Wh)"::float4          AS consumption_wh,
        "Day Type"                          AS day_type,
        "Seasonal Factor"::float4           AS seasonal_factor,
        "Standard (Electric Ireland)"::float4 AS price_standard,
        "Dynamic (Electric Ireland)"::float4  AS price_dynamic,
        "ToU (Electric Ireland)"::float4      AS price_tou
    FROM
        energy_data.raw_energy_data
),

-- Step 2: Handle Null (Missing) Values
-- Use COALESCE to replace any NULLs with logical default values, ensuring
-- no calculation errors occur in downstream analysis.
null_handled AS (
    SELECT
        date_time,
        day_type,
        COALESCE(consumption_wh, 0) AS consumption_wh,
        COALESCE(seasonal_factor, 1) AS seasonal_factor,
        COALESCE(price_standard, 0) AS price_standard,
        COALESCE(price_dynamic, 0) AS price_dynamic,
        COALESCE(price_tou, 0) AS price_tou
    FROM
        source_and_casted
),

-- Step 3: Identify and Remove Duplicates
-- Use the ROW_NUMBER() window function to flag duplicate rows based on the
-- unique 'date_time' column. Any row with 'rn' > 1 is a duplicate.
deduplicated AS (
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY date_time ORDER BY date_time) as rn
    FROM
        null_handled
)

-- Final Step: Select Clean Data, Calculate Costs, and Add Analytical Columns
SELECT
    -- Base clean columns
    date_time,
    consumption_wh,
    day_type,
    seasonal_factor,
    price_standard,
    price_dynamic,
    price_tou,
    
    -- Calculated cost per minute columns
    (consumption_wh / 1000.0) * price_standard AS bill_minute_standard,
    (consumption_wh / 1000.0) * price_dynamic  AS bill_minute_dynamic,
    (consumption_wh / 1000.0) * price_tou      AS bill_minute_tou,
    
    -- Derived columns for analysis (Feature Engineering)
    EXTRACT(HOUR FROM date_time) AS hour_of_day,
    EXTRACT(DOW FROM date_time) AS day_of_week_num, -- 0=Sun, 1=Mon, ...
    EXTRACT(MONTH FROM date_time) AS month_of_year,
    TO_CHAR(date_time, 'Day') AS day_name,
    TO_CHAR(date_time, 'Month') AS month_name,
    
    -- Time period categories (based on general consumption patterns, not price)
    CASE
        WHEN EXTRACT(HOUR FROM date_time) BETWEEN 5 AND 10 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM date_time) BETWEEN 11 AND 16 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM date_time) BETWEEN 17 AND 21 THEN 'Evening (Peak)'
        ELSE 'Night'
    END AS time_period
FROM
    deduplicated
WHERE
    rn = 1 -- Select only unique rows
    AND consumption_wh >= 0; -- Filter out data anomalies
