<h1> Starbucks Location ETL & API Creation with Flask </h1> 

We sourced worldwide Starbucks location <a href="https://www.kaggle.com/starbucks/store-locations"> data</a> from Kaggle.com in csv format. We then cleaned the data in <a href="https://github.com/tedi529/ETL-Project/blob/master/Starbucks%20ET.ipynb"> this</a> notebook only including locations in the United States and separated the postcode column into two: one with the 5 digit zipcode and another with the four extra digits. We kept only the 5 digit zipcode and loaded the data into a Postgres database.

We used the citipy python library and the reverse_geocoder python library to load the nearest US city locations based on the latitute/ longitude combination found in our original csv. We found that for a number of latitute/longitude combinations, the two libraries listed different cities, so we included all possible city outputs in our final query. We cleaned the data in <a href="https://github.com/tedi529/ETL-Project/blob/master/starbucks_cities.ipynb"> this</a> notebook, and loaded the data into Postgres. The Postgres database schema can be found in our <a href="https://github.com/tedi529/ETL-Project/blob/master/schema.sql"> schema.sql</a> file. We joined the tables and created a Flask API in which a user can input a US city and state, and get the addresses of every Starbucks in that city. The Flask API is created in our <a href="https://github.com/tedi529/ETL-Project/blob/master/app.py"> app.py</a> file.

The following is the Welcome Page of the Flask API.
<img src ="https://github.com/tedi529/ETL-Project/blob/master/Demo%20Screenshots/landing.PNG"> 

The following are screenshots of the outputs of our API passing in the city of Miami, Florida.
<img src ="https://github.com/tedi529/ETL-Project/blob/master/Demo%20Screenshots/API_output.PNG"> 
