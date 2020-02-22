<h1> Starbucks Location API </h1> 

We propose using the ETL process to extract Starbuck’s coffee chain locations and store them into a Postgres Database.  

We will use a CSV file for US Starbucks locations and the citipy python library to load the nearest US city locations based on the latitute/ longitude combination. We will load and join these two databases in Postgres and create a Flask API in which a user can input a US city and state, and get the addresses of every Starbucks in that city.
