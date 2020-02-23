from flask import Flask, render_template

# Import sqlalchemy to connect to database
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine

from config import password

#################################################
# Database Setup
#################################################
postgres_str = ('postgresql://postgres:{password}@localhost:5432/starbucks_etl'.format(password=password))

engine = create_engine