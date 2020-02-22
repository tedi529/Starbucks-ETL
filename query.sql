-- Create tables for raw data to be loaded into
CREATE TABLE store_location(
    store_number VARCHAR(50) PRIMARY KEY,
    store_name TEXT,
    street_address TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    zipcode VARCHAR(5),
    longitude INT,
    latitude INT
);

CREATE TABLE store_city(
    store_number VARCHAR(50)
    
    
    
     PRIMARY KEY,
    city TEXT
);

ALTER TABLE store_city ADD CONSTRAINT fk_store_number FOREIGN KEY (store_number)
REFERENCES store_location(store_number);

-- Joins tables
SELECT store_location.store_number, store_location.store_name, store_location.street_address, store_city.city, store_location.state, store_location.zipcode
FROM store_location
JOIN store_city
ON store_location.store_number = store_city.store_number;