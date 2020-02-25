-- Joins tables
SELECT l.store_number, l.store_name, l.street_address, l.city, c.citipy_city, c.reverse_geocoder_city,l.state, l.zipcode,l.latitude,l.longitude
FROM store_location l
JOIN store_city c
ON l.store_number = c.store_number;

-- find city = citipy_city
SELECT l.store_number, l.store_name, l.street_address, l.city, c.citipy_city, c.reverse_geocoder_city, l.state, l.zipcode,l.latitude,l.longitude
FROM store_location l
JOIN store_city c
ON l.store_number = c.store_number
WHERE l.city = c.citipy_city

-- find city = reverse_geocoder_city
SELECT l.store_number, l.store_name, l.street_address, l.city, c.citipy_city, c.reverse_geocoder_city, l.state, l.zipcode,l.latitude,l.longitude
FROM store_location l
JOIN store_city c
ON l.store_number = c.store_number
WHERE l.city = c.reverse_geocoder_city

-- find deltas
SELECT l.store_number, l.store_name, l.street_address, l.city, c.citipy_city, c.reverse_geocoder_city, l.state, l.zipcode,l.latitude,l.longitude
FROM store_location l
JOIN store_city c
ON l.store_number = c.store_number
WHERE (l.city <> c.reverse_geocoder_city  OR
	   l.city <> c.citipy_city)
	   
SELECT l.store_number, l.store_name, l.street_address, l.city, c.citipy_city, c.reverse_geocoder_city, l.state, l.zipcode,l.latitude,l.longitude
FROM store_location l
JOIN store_city c
ON l.store_number = c.store_number
WHERE (l.city <> c.reverse_geocoder_city  AND
	   l.city <> c.citipy_city)	   
