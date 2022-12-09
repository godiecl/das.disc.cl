import sqlite3

conn = sqlite3.connect("earthquakes.db")
# Lead the spatialite extension:
conn.enable_load_extension(True)
conn.load_extension("/usr/lib/x86_64-linux-gnu/mod_spatialite.so")
# Initialize spatial metadata for this database:
conn.execute("select InitSpatialMetadata(1)")
# Add a geometry column called point_geom to our earthquakes table:
conn.execute(
        "SELECT AddGeometryColumn('earthquakes', 'point', 4326, 'POINT', 2);"
        )
# Now update that geometry column with the lat/lon points
conn.execute(
    """
    UPDATE earthquakes SET
    point = GeomFromText('POINT('||"longitude"||' '||"latitude"||')',4326);
    """
    )
# Now add a spatial index to that column
conn.execute(
        'select CreateSpatialIndex("earthquakes", "point");'
        )
# If you don't commit your changes will not be persisted:
conn.commit()
conn.close()
