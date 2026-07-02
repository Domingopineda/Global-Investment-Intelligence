-- those are the columns in the WB_GDP table, that are relevant to the query
SELECT [TIME_PERIOD], [OBS_VALUE], [REF_AREA], [REF_AREA_LABEL]
FROM [WB_GDP]


-- The query below counts the number of rows in the WB_GDP table where any of the specified columns are NULL
SELECT COUNT(*)
FROM [WB_GDP]
WHERE [TIME_PERIOD] IS NULL OR [OBS_VALUE] IS NULL OR [REF_AREA] IS NULL OR [REF_AREA_LABEL] IS NULL;

-- The query below calculates the average GDP growth rate for each time period in the WB_GDP table
SELECT [TIME_PERIOD], AVG([OBS_VALUE]) AS GLOBAL_AVG_GROWTH_RATE
FROM [WB_GDP]
GROUP BY [TIME_PERIOD]
ORDER BY [TIME_PERIOD] ASC;

-- The query below calculates the average GDP growth rate for each country in the WB_GDP table
SELECT [REF_AREA_LABEL], AVG([OBS_VALUE]) AS AVG_GROWTH_RATE
FROM [WB_GDP]
GROUP BY [REF_AREA_LABEL]
ORDER BY AVG_GROWTH_RATE DESC;

-- The query below calculates the average GDP growth rate and volatility for each country in the WB_GDP table
SELECT [REF_AREA_LABEL], AVG([OBS_VALUE]) AS AVG_GROWTH_RATE, STDEV([OBS_VALUE]) AS Volatility
FROM [WB_GDP]
GROUP BY [REF_AREA_LABEL]
ORDER BY Volatility;

-- The query below calculates how the covid-19 pandemic affected the GDP growth rate of each country in the WB_GDP
SELECT [REF_AREA_LABEL], AVG([OBS_VALUE]) AS AVG_OBS_VALUE
FROM [WB_GDP]
WHERE [TIME_PERIOD] = 2020
GROUP BY [REF_AREA_LABEL]
ORDER BY AVG_OBS_VALUE ASC;

-- The query below calculates the average GDP growth rate for each country after the covid-19 pandemic in the WB_GDP
SELECT [REF_AREA_LABEL], AVG([OBS_VALUE]) AS AVG_OBS_VALUE
FROM [WB_GDP]
WHERE [TIME_PERIOD] = 2021
GROUP BY [REF_AREA_LABEL]
ORDER BY AVG_OBS_VALUE DESC;


