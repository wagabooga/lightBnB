-- User Login
-- Get details about a single user.
-- Select their id, name, email, and password.
-- Select a single user using their email address. Use tristanjacobs@gmail.com for now.
SELECT id, name, email, password
FROM users
WHERE email = 'tristanjacobs@gmail.com';


-- Average Length Of Reservation
-- Our product managers want a query to see the average duration of a reservation.
-- Get the average duration of all reservations.
SELECT avg(end_date - start_date) as average_duration
FROM reservations;


-- Property Listings By City
-- When the users come to our home page, they are going to see a list of properties. They will be able to view the properties and filter them by location. 
-- They will be able to see all data about the property, including the average rating.
-- Show all details about properties located in Vancouver including their average rating.
-- Select all columns from the properties table for properties located in Vancouver, and the average rating for each property.
-- Order the results from lowest cost_per_night to highest cost_per_night.
-- Limit the number of results to 10.
-- Only show listings that have a rating >= 4 stars.
-- To build this incrementally, you can start by getting all properties without the average rating first.
SELECT properties.*, avg(property_reviews.rating) as average_rating
FROM properties
JOIN property_reviews ON properties.id = property_id
WHERE city LIKE '%ancouv%'
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night
LIMIT 10;

-- Most Visited Cities
-- Our product managers want a query to see a list of the most visited cities.
-- Get a list of the most visited cities.
-- Select the name of the city and the number of reservations for that city.
-- Order the results from highest number of reservations to lowest number of reservations.
SELECT properties.city, count(reservations) as total_reservations
FROM reservations
JOIN properties ON property_id = properties.id
GROUP BY properties.city
ORDER BY total_reservations DESC;

-- All My Reservations
-- When a user is logged in, they will have an option to view all of their reservations. 
-- This page will show details about a reservation and details about the property associated with the reservation.
-- Show all reservations for a user.
-- Select all columns from the reservations table, all columns from the properties table, and the average rating of the property.
-- The reservations will be for a single user, so use 1 for the user_id.
-- Order the results from the earliest start_date to the most recent start_date.
-- These will end up being filtered by either "Upcoming Reservations" or "Past Reservations", so only get reservations where the end_date is in the past.
-- Use now()::date to get today's date.
-- Limit the results to 10.
SELECT properties.*, reservations.*, avg(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1
AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;