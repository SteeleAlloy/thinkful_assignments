-- Question 1: A. What's the most expensive listing? B. What else can you tell me about the listing?
-- The most expensive listing is $10,000 per night, has 3 total reviews, the host has 4 listings in total, and it has a minimum number of 2 nights for a stay.
SELECT *
FROM
	sfo_listings
ORDER BY price DESC limit 1;

-- Question 2: What neighborhoods seem to be the most popular?
SELECT neighbourhood
	, round(avg(number_of_reviews)) avg_reviews
FROM sfo_listings
GROUP BY neighbourhood
ORDER BY avg_reviews DESC

-- Question 3: What time of year is the cheapest time to go to San Francisco? What about the busiest?
SELECT calender_date,
	price
FROM sfo_calendar
ORDER BY price 
FETCH first 10 rows only
