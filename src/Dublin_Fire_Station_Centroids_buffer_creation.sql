DROP TABLE IF EXISTS dublin_Fire_Station_Centroids;
CREATE TABLE dublin_Fire_Station_Centroids as 
( select ST_Centroid(wkb_geometry) as theCentroid,pkid 
 from dublin_fire_station);
ALTER TABLE dublin_Fire_Station_Centroids ADD PRIMARY KEY (pkid);
CREATE INDEX "FireStationCentroid" ON dublin_Fire_Station_Centroids USING GIST (theCentroid);
select * from dublin_Fire_Station_Centroids

DROP TABLE IF EXISTS  dublin_Fire_Station_buffer CASCADE;
CREATE TABLE  dublin_Fire_Station_buffer
  AS
SELECT pkid as id,ST_Buffer(theCentroid,1000) as geom from dublin_Fire_Station_Centroids;
SELECT * from dublin_Fire_Station_buffer;