/*

Google Data Analytics Case Study - Cyclistic
 
Cyclistic is a fictional company. For purposes of this case study,
we used public data from Motivate International Inc.
Data: https://divvy-tripdata.s3.amazonaws.com/index.html

Data used was from June 2020 to May 2021.

Prior to uploading in BigQuery, we used Excel to add additional columns:
* ride_length
* day_of_week
* month
* ride_seconds

*/

-- Reviewing data

SELECT 
    member_casual, COUNT(*)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    member_casual;

SELECT 
    rideable_type, COUNT(*)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    rideable_type;

SELECT 
    day_of_week, COUNT(*)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    day_of_week
ORDER BY 
    day_of_week;

SELECT 
    AVG(ride_seconds)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`;

-- Looking into membership vs. day of week

SELECT 
    day_of_week, member_casual, COUNT(*)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    day_of_week, member_casual
ORDER BY 
    day_of_week, member_casual;

-- Ride type vs. membership

SELECT 
    rideable_type, member_casual, COUNT(*)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    rideable_type, member_casual
ORDER BY 
    rideable_type, member_casual;

--- Comparing membership to ride length

SELECT 
    member_casual, AVG(ride_seconds)/60 AS ride_minutes
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    member_casual;

SELECT 
    member_casual, CEILING(ride_seconds/60) AS ride_minutes, COUNT(*)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY
    member_casual, ride_minutes
ORDER BY 
    member_casual, ride_minutes;

--- Average ride length per day of week

SELECT 
    member_casual, day_of_week, AVG(ride_seconds)/60 AS ride_minutes
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    member_casual, day_of_week
ORDER BY 
    member_casual, day_of_week;

--- Breakdown per month

SELECT 
    month, member_casual, COUNT(*)
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`
GROUP BY 
    month, member_casual
ORDER BY 
    month, member_casual;

--- Extracting data to be used in Tableau

SELECT 
    member_casual, month, CEILING(ride_seconds/60) AS ride_minutes, day_of_week
FROM 
    `case-study-cyclistic-318822.cyclistic_data.trip-data`;

/*
Tableau dashboard: https://public.tableau.com/app/profile/voltaire.recto/viz/GoogleDataAnalyticsCaseStudy-Cyclistic/GoogleDataAnalyticsCaseStudy-Cyclistic

Google Slides presentation: https://docs.google.com/presentation/d/18a3DaEpWP3GWNzCoUVNsdeX7caVDgAaJaFj1JDcvuK8
*/
