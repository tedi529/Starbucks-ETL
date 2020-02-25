-- Create tables for raw data to be loaded into
CREATE TABLE store_location(
    store_number VARCHAR(50) PRIMARY KEY,
    store_name TEXT,
    street_address TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    zipcode VARCHAR(5),
    longitude float,
    latitude float
);

CREATE TABLE store_city(
    store_number VARCHAR(50) PRIMARY KEY,
    citipy_city TEXT,
    reverse_geocoder_city TEXT
);

ALTER TABLE store_city ADD CONSTRAINT fk_store_number FOREIGN KEY (store_number)
REFERENCES store_location(store_number);
