-- Question 1: What are the three longest trips on rainy days?
WITH rainydays
AS
(
SELECT 
	DATE(date) rain_date
From weather
WHERE events = 'Rain'
GROUP BY 1
) 
SELECT
	t.trip_id
	, t.duration trip_duration
	, DATE(t.start_date)
FROM 
	trips t
JOIN
    rainydays r
ON
    DATE(t.start_date) = r.rain_date
ORDER BY duration DESC
LIMIT 3
	

-- Question 2: Which station is full most often?
SELECT
	status.station_id
	, stations.name station_name
	,COUNT(CASE WHEN docks_available =0 then 1 end) docks_empty
FROM 
	status
JOIN
	stations
ON stations.station_id = status.station_id
GROUP BY 1,2
ORDER BY empty_count DESC


-- Question 3: Return a list of stations with a count of number of trips starting at that station but ordered by dock count.
SELECT
	start_station
	, dockcount
	, COUNT(*)
FROM
	trips
JOIN
	stations
ON stations.name = trips.start_station
GROUP BY 1,2
ORDER BY 2 DESC

-- Question 4: (Challenge) What's the length of the longest trip for each day it rains anywhere?
WITH rainydays
AS
(
SELECT 
	DATE(date) rain_date
From weather
WHERE events = 'Rain'
GROUP BY 1
) 
, raintrips AS
(SELECT
 	trip_id
 	, duration
 	, DATE(trips.start_date) rain_trips_date
 FROM
 	trips
 JOIN
 	rainydays
 ON rainydays.rain_date = DATE(trips.start_date)
 ORDER BY duration DESC
)
SELECT 
	rain_trips_date
	, max(duration) max_duration
FROM
	raintrips
GROUP BY 1
ORDER BY max_duration DESC
	