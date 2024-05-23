-- A QUERY TO FIND ANY MISSING/NULL VALUE
SELECT *
FROM [dbo].[Corona Virus Dataset]
WHERE [Deaths] IS NULL

SELECT *
FROM [dbo].[Corona Virus Dataset]

SELECT *
FROM [dbo].[Corona Virus Dataset]
WHERE [Date] IS NOT NULL


-- A QUERY TO CHECK TOTAL NUMBER OF ROWS
SELECT COUNT(*) AS TotalRows
FROM [dbo].[Corona Virus Dataset]


-- A QUERY TO CHECK WHAT IS THE START AND END DATE
SELECT MIN([Date])AS START_DATE,
MAX ([Date])AS END_DATE
FROM [dbo].[Corona Virus Dataset]


-- QUERY TO KNOW THE NUMBER OF MONTH PRESENT
SELECT COUNT(DISTINCT DATEPART(MONTH,TRY_CONVERT(DATE,[Date]))) AS NUMBER_OF_MONTHS
FROM [dbo].[Corona Virus Dataset]


-- QUERY TO FIND MONTHLY AVERAGE FOR CONFIRMED ,DEATHS AND RECOVERED
SELECT YEAR([Date]) AS YEAR,
MONTH([Date]) AS MONTH,
AVG([Confirmed]) AS MONTHLY_AVERAGE
FROM
[dbo].[Corona Virus Dataset]
GROUP BY
YEAR([Date]), MONTH([Date])
ORDER BY
YEAR, MONTH

SELECT YEAR([Date]) AS YEAR,
MONTH([Date]) AS MONTH,
AVG([Deaths]) AS MONTHLY_DEATHS_AVERAGE
FROM
[dbo].[Corona Virus Dataset]
GROUP BY
YEAR([Date]), MONTH([Date])
ORDER BY
YEAR, MONTH

SELECT YEAR([Date]) AS YEAR,
MONTH([Date]) AS MONTH,
AVG([Recovered]) AS MONTHLY_RECOVERED_AVERAGE
FROM
[dbo].[Corona Virus Dataset]
GROUP BY
YEAR([Date]), MONTH([Date])
ORDER BY
YEAR, MONTH


--QUERY TO FIND THE MOST FREQUENT VALUE FOR CONFIRMED, DEATH AND RECOVERED
SELECT TOP 1
[Confirmed],
COUNT(*) AS FREQUENCY
FROM [dbo].[Corona Virus Dataset]
GROUP BY [Confirmed]
ORDER BY FREQUENCY DESC

SELECT TOP 1
[Deaths],
COUNT(*) AS FREQUENCY
FROM [dbo].[Corona Virus Dataset]
GROUP BY [Deaths]
ORDER BY FREQUENCY DESC

SELECT TOP 1
[Recovered],
COUNT(*) AS FREQUENCY
FROM [dbo].[Corona Virus Dataset]
GROUP BY [Recovered]
ORDER BY FREQUENCY DESC


--Query to find minimum values for confirmed, deaths, recovered per year
SELECT YEAR([Date]) AS YEAR,
MIN([Confirmed]) AS MIN_VALUE
FROM [dbo].[Corona Virus Dataset]
GROUP BY YEAR([Date])
ORDER BY YEAR([Date])

SELECT YEAR([Date]) AS YEAR,
MIN([Deaths])AS MIN_VALUE
FROM [dbo].[Corona Virus Dataset]
GROUP BY YEAR([Date])
ORDER BY YEAR([Date])

SELECT YEAR([Date]) AS YEAR,
MIN([Recovered]) AS MIN_VALUE
FROM [dbo].[Corona Virus Dataset]
GROUP BY YEAR([Date])
ORDER BY YEAR([Date])


--Query to find MAXIMUM for confirmed, deaths, recovered per year
SELECT YEAR([Date]) AS YEAR,
MAX([Confirmed]) AS MAX_VALUE_CONFIRMED
FROM [dbo].[Corona Virus Dataset]
GROUP BY YEAR([Date])
ORDER BY YEAR([Date])

SELECT YEAR([Date]) AS YEAR,
MAX([Deaths]) AS MAX_VALUE_DEATHS
FROM [dbo].[Corona Virus Dataset]
GROUP BY YEAR([Date])
ORDER BY YEAR([Date])

SELECT YEAR([Date]) AS YEAR,
MAX([Recovered]) AS MAX_VALUE_RECOVERED
FROM [dbo].[Corona Virus Dataset]
GROUP BY YEAR([Date])
ORDER BY YEAR([Date])


-- QUERY TO DETERMINE The total number of case of confirmed, deaths, recovered each month
SELECT YEAR([Date]) AS YEAR,
MONTH([Date]) AS MONTH,
SUM([Confirmed]) AS TOTAL_CONFIRMED
FROM
[dbo].[Corona Virus Dataset]
GROUP BY
YEAR([Date]), MONTH([Date])
ORDER BY
YEAR, MONTH

SELECT YEAR([Date]) AS YEAR,
MONTH([Date]) AS MONTH,
SUM([Deaths]) AS TOTAL_DEATHS
FROM
[dbo].[Corona Virus Dataset]
GROUP BY
YEAR([Date]), MONTH([Date])
ORDER BY
YEAR, MONTH

SELECT YEAR([Date]) AS YEAR,
MONTH([Date]) AS MONTH,
SUM([Recovered]) AS TOTAL_RECOVERED
FROM
[dbo].[Corona Virus Dataset]
GROUP BY
YEAR([Date]), MONTH([Date])
ORDER BY
YEAR, MONTH


--QUERY Check ON how corona virus spread out with respect to confirmed case
SELECT SUM([Confirmed]) AS TOTAL_CASE,
AVG([Confirmed]) AS AVG_CASES,
VAR([Confirmed]) AS VARIANCE_CASE,
STDEV([Confirmed]) AS STDEV_CASES
FROM
[dbo].[Corona Virus Dataset]


-- QUERY Check ON how corona virus spread out with respect to DEATH case
SELECT YEAR([Date]) AS YEAR,
MONTH([Date]) AS MONTH,
SUM([Deaths]) AS TOTAL_DEATH_CASE,
AVG([Deaths]) AS AVG_DEATH_CASES,
VAR([Deaths]) AS VARIANCE_DEATH_CASE,
STDEV([Deaths]) AS STDEV_DEATH_CASES
FROM
[dbo].[Corona Virus Dataset]
GROUP BY
YEAR ([Date]), MONTH ([Date])
ORDER BY
YEAR,MONTH


-- QUERY Check ON how corona virus spread out with respect to recovered case
SELECT SUM([Confirmed]) AS TOTAL_CASE,
AVG([Recovered]) AS AVG_RECVD_CASES,
VAR([Recovered]) AS VARIANCE_RECOVERED_CASE,
STDEV([Recovered]) AS STDEV_RECVD_CASES
FROM
[dbo].[Corona Virus Dataset]


--QUERY TO Find Country having highest number of the Confirmed case
SELECT [Country/Region],MAX([Confirmed]) AS HIGHEST_CONFIRMED_CASE
FROM [dbo].[Corona Virus Dataset]
GROUP BY [Country/Region]
ORDER BY HIGHEST_CONFIRMED_CASE DESC


-- QUERY TO Find Country having lowest number of the death case
SELECT [Country/Region], MAX([Deaths]) AS LOWEST_DEATH_CASE
FROM [dbo].[Corona Virus Dataset]
GROUP BY [Country/Region]
ORDER BY LOWEST_DEATH_CASE ASC


--QUERY TO Find top 5 countries having highest recovered case
SELECT TOP 5[Country/Region], MAX([Recovered]) AS HIGHEST_RECOVERED_CASES
FROM[dbo].[Corona Virus Dataset]
GROUP BY [Country/Region]
ORDER BY HIGHEST_RECOVERED_CASES DESC

SELECT [Country/Region],
SUM ([Confirmed]) AS TOTAL_CONFIRMED_CASES,
SUM ([Recovered]) AS TOTAL_RECOVERED_CASES,
SUM ([Deaths]) AS TOTAL_DEATH,
CASE
 WHEN SUM([Confirmed]) > 0 THEN (SUM([Recovered]) * 100 / SUM([Confirmed]))
 ELSE 0
 END AS RECOVERY_RATE
 FROM [dbo].[Corona Virus Dataset]
 GROUP BY [Country/Region]
 ORDER BY RECOVERY_RATE DESC
