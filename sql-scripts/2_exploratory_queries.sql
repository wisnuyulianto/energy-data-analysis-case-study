-- Query 1: Deeper investigation : What is the price behavior (min, avg, max) per hour for the 'price_tou' column?
-- Finding: The average price was nearly identical across all 24 hours, disproving the time-based hypothesis.
SELECT
    EXTRACT(HOUR FROM date_time) AS hour,
    MIN(price_tou) AS min_price,
    AVG(price_tou) AS avg_price,
    MAX(price_tou) AS max_price
FROM
    energy_data.CLEAN_ENERGY_DATA
GROUP BY
    hour
ORDER BY
    hour;

-- Query 2: Second hypothesis test : Does the price pattern change based on Day Type?
-- Finding: No, the average price per hour was consistent across Weekdays, Weekends, and Holidays.
SELECT
    day_type,
    EXTRACT(HOUR FROM date_time) AS hour,
    AVG(price_tou) AS avg_price
FROM
    energy_data.CLEAN_ENERGY_DATA
GROUP BY
    day_type,
    hour
ORDER BY
    day_type,
    hour;

-- Query 3: Final investigation : Is there any monthly/seasonal volatility?
-- Finding: No, the average monthly prices were almost perfectly stable, which is highly
-- unnatural for real-world energy data, confirming the synthetic nature of the pricing.
SELECT
    TO_CHAR(date_time, 'YYYY-MM') AS year_month,
    AVG(price_standard) AS avg_price_standard,
    AVG(price_dynamic) AS avg_price_dynamic,
    AVG(price_tou) AS avg_price_tou
FROM
    energy_data.CLEAN_ENERGY_DATA
GROUP BY
    year_month
ORDER BY
    year_month;
