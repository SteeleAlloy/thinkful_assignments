--Question 1:What was the hottest day in our data set? Where was that?
select date, zip
,max(maxtemperaturef) max_temp
from weather
group by date, zip
order by max(maxtemperaturef) desc limit 1


--Question 2:How many trips started at each station?
select start_station station_name
, count(trip_id) number_of_trips
from trips
group by start_station


--Question 3: What's the shortest trip that happened?
select trip_id 
from trips
order by duration limit 1 

--Question 4:What is the average trip duration, by end station?
select end_station, 
round(avg(duration),0) avg_duration
from trips
group by end_station
