create database Airbnb_listing_analysis;
use Airbnb_listing_analysis;
select * from customer;

-- Q1. Show all Airbnb listings
SELECT *
FROM customer;


-- Q2. Find all unique cities
SELECT DISTINCT city
FROM customer;

-- Q3. Count total listings per city
SELECT city, COUNT(*) AS total_listings
FROM customer
GROUP BY city;

-- Q4. Find average price of listings in each city
SELECT city, AVG(price) AS avg_price
FROM customer
GROUP BY city;

-- Q5. Find most expensive listing
SELECT *
FROM customer
ORDER BY price DESC
LIMIT 1;


-- Q6. Find cheapest listing in each city
SELECT city, MIN(price) AS min_price
FROM customer
GROUP BY city;


-- Q7. Count listings by room type
SELECT room_type, COUNT(*) AS total_listings
FROM customer
GROUP BY room_type;


-- Q8. Find average price by property type
SELECT property_type, AVG(price) AS avg_price
FROM customer
GROUP BY property_type;


-- Q9. Find listings with more than 100 reviews
SELECT *
FROM customer
WHERE number_of_reviews > 100;


-- Q10. Find top 5 most reviewed listings
SELECT *
FROM customer
ORDER BY number_of_reviews DESC
LIMIT 5;


-- Q11. Find listings with review score greater than 90
SELECT *
FROM customer
WHERE review_score > 90;


-- Q12. Find average review score per city
SELECT city, AVG(review_score) AS avg_review_score
FROM customer
GROUP BY city;


-- Q13. Find listings available for more than 300 days
SELECT *
FROM customer
WHERE availability_365 > 300;


-- Q14. Find average availability per city
SELECT city, AVG(availability_365) AS avg_availability
FROM customer
GROUP BY city;

-- Q15. Find hosts with more than 5 years of experience
SELECT *
FROM customer
WHERE host_years > 5;


-- Q16. Find average price for experienced hosts (>5 years)
SELECT AVG(price) AS avg_price_experienced_hosts
FROM customer
WHERE host_years > 5;

-- Q17. Find neighbourhoods with more than 10 listings
SELECT neighbourhood, COUNT(*) AS total_listings
FROM customer
GROUP BY neighbourhood
HAVING COUNT(*) > 10;

-- Q18. Rank listings by price within each city
SELECT city, neighbourhood, price,
RANK() OVER (PARTITION BY city ORDER BY price DESC) AS price_rank
FROM customer;

-- Q19. Find second highest priced listing in each city
SELECT *
FROM (
    SELECT *, 
    DENSE_RANK() OVER (PARTITION BY city ORDER BY price DESC) AS rnk
    FROM customer
) t
WHERE rnk = 2;

-- Q20. Create a view for city-wise average price and reviews
CREATE VIEW city_summary AS
SELECT city,
       AVG(price) AS avg_price,
       AVG(number_of_reviews) AS avg_reviews
FROM customer
GROUP BY city;