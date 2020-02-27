from flask import Flask, render_template, jsonify

# Import sqlalchemy to connect to database
import pandas as pd
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine


from config import password, user

#################################################
# Database Setup
#################################################

# Flask setup 
app = Flask(__name__)
postgres_str = ('postgresql://{user}:{password}@localhost:5432/starbucks_etl'.format(password=password,
                                                                                     user=user))
engine = create_engine(postgres_str)

#################################################
# Create API Endpoints
#################################################

@app.route("/")
def welcome():
    return render_template("index.html")

@app.route("/api/<city>/<state>")
def address_output(city, state):
    # Create session link from Python to database
    session = Session(engine)   

    """Return list of all addresses in queried city"""
    results = pd.read_sql_query(f'''SELECT l.street_address
                                    FROM store_location l
                                    JOIN store_city c
                                    ON l.store_number = c.store_number
                                    WHERE(UPPER(l.city) = UPPER('{city}') 
                                    OR UPPER(c.citipy_city) = UPPER('{city}') 
                                    OR UPPER(c.reverse_geocoder_city) = UPPER('{city}'))
                                    AND UPPER(l.state) = UPPER('{state}');''', engine)

    session.close()
    return jsonify(results.to_dict (orient='records'))

    return render_template("api.html",results=results)

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@app.errorhandler(500)
def handle_exception(e):
    if isinstance(e, HTTPException):
        return e
    return render_template('500.html'), 500


if __name__ == "__main__":
    app.run(debug=True)