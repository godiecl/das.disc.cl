#!/bin/bash
# export: xlsx -> csv
docker run -it --rm -v `pwd`:`pwd` -w `pwd` python:slim-buster bash -c "pip3 install pandas openpyxl && python3 xlsx2csv.py"

# remove old database
rm -f earthquakes.db

# export: csv -> sqlite
sqlite3 earthquakes.db < earthquakes.sql

# process: create the spatial index inside sqlite
docker run -it --rm -v `pwd`:`pwd` -w `pwd` datasetteproject/datasette python earthquakes.py

# run the web server
# docker compose down && docker compose up -d
