-- DELETE FROM sqlite_master WHERE TYPE IN ('view', 'table', 'index', 'trigger');

-- # create the database
-- year,month,day,hour,minute,second,latitude,longitude,depth,mw_reported,seismic_moment,strike,dip,rake,mw_calculated_kanamuri,mwg_das_magnitude
DROP TABLE IF EXISTS earthquakes;
CREATE table earthquakes(
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL,
    hour INTEGER NOT NULL,
    minute INTEGER NOT NULL,
    second INTEGER NOT NULL,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL,
    depth REAL NOT NULL,
    mw_reported REAL NOT NULL,
    seismic_moment REAL NOT NULL,
    strike REAL NOT NULL,
    dip	REAL NOT NULL,
    rake REAL NOT NULL,
    mw REAL NOT NULL,
    mwg REAL NOT NULL
);

-- # show the schema
.schema --indent earthquakes

-- # import the csv data
.mode csv
.import '| tail -n +2 earthquakes.csv' earthquakes
-- .import --csv --skip 1 earthquakes.csv earthquakes

-- # show the tables
.tables
PRAGMA table_info(earthquakes);

-- # show the data
.headers on
.mode column
select * from earthquakes limit 10;
