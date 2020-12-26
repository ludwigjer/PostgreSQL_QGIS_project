
select dh.name, dpd.yelp_postc,ST_Distance(ST_Centroid(dpd.wkb_geometry),dh.wkb_geometry) as distanceToCenter
from dublin_hospital as dh,dublin_postcode_dissolve as dpd
where dh.yelp_postc = dpd.yelp_postc
order by distanceToCenter desc;


--Dublin_fire_station_delete_area_outside_dublin
delete from dublin_fire_station where pkid in
(select dfs.pkid from dublin_area as da, dublin_fire_station as dfs
where not ST_Contains(da.wkb_geometry,dfs.wkb_geometry));
--Dublin_Doctor_Clinic_delete_area_outside_dublin
delete from dublin_doctor_clinic where pkid in
(select ddc.pkid from dublin_area as da, dublin_doctor_clinic as ddc
where not ST_Contains(da.wkb_geometry,ddc.wkb_geometry));
--Dublin_Hospital_delete_area_outside_dublin
delete from dublin_hospital where pkid in
(select dh.pkid from dublin_area as da, dublin_hospital as dh
where not ST_Contains(da.wkb_geometry,dh.wkb_geometry) or amenity !='hospital');
--dublin_industrial_warehouse_buildings_delete_area_outside_dublin
delete from dublin_industrial_warehouse_buildings where pkid in
(select diwb.pkid from dublin_area as da, dublin_industrial_warehouse_buildings as diwb
where not ST_Contains(da.wkb_geometry,diwb.wkb_geometry));

--Dublin_postcode_dissolve_update
update dublin_postcode_dissolve set area = ST_Area(wkb_geometry)/1000000;

with PolygonQuery1 as (
	select dpd.pkid, count(*) as PointsInZone
	from dublin_postcode_dissolve as dpd,dublin_fire_station as dfs
	where ST_Contains(dpd.wkb_geometry,dfs.wkb_geometry)
	group by dpd.pkid
)
Update dublin_postcode_dissolve
set number_of_fire_station = PolygonQuery1.PointsInZone,
density_of_fire_station =  PolygonQuery1.PointsInZone/area
from PolygonQuery1
where dublin_postcode_dissolve.pkid = PolygonQuery1.pkid;


with PolygonQuery2 as (
	select dpd.pkid, count(*) as PointsInZone
	from dublin_postcode_dissolve as dpd,dublin_doctor_clinic as ddc
	where ST_Contains(dpd.wkb_geometry,ddc.wkb_geometry)
	group by dpd.pkid
)
Update dublin_postcode_dissolve
set number_of_doctor_clinic = PolygonQuery2.PointsInZone,
density_of_doctor_clinic =  PolygonQuery2.PointsInZone/area
from PolygonQuery2
where dublin_postcode_dissolve.pkid = PolygonQuery2.pkid;

with PolygonQuery3 as (
	select dpd.pkid, count(*) as PointsInZone
	from dublin_postcode_dissolve as dpd,dublin_hospital as dh
	where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry)
	group by dpd.pkid
)
Update dublin_postcode_dissolve
set number_of_hospital = PolygonQuery3.PointsInZone,
density_of_hospital =  PolygonQuery3.PointsInZone/area
from PolygonQuery3
where dublin_postcode_dissolve.pkid = PolygonQuery3.pkid;

with PolygonQuery4 as (
	select dpd.pkid, count(*) as PointsInZone
	from dublin_postcode_dissolve as dpd,dublin_industrial_warehouse_buildings as diw
	where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry)
	group by dpd.pkid
)
Update dublin_postcode_dissolve
set number_of_industrial_warehouse = PolygonQuery4.PointsInZone,
density_of_industrial_warehouse = PolygonQuery4.PointsInZone/area
from PolygonQuery4
where dublin_postcode_dissolve.pkid = PolygonQuery4.pkid;

Select * from dublin_postcode_dissolve order by pkid;

--Dublin_Hospital_update
update dublin_hospital as dh
set yelp_postc ='1'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '1';
update dublin_hospital as dh
set yelp_postc ='2'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '2';
update dublin_hospital as dh
set yelp_postc ='3'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '3';
update dublin_hospital as dh
set yelp_postc ='4'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '4';
update dublin_hospital as dh
set yelp_postc ='5'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '5';
update dublin_hospital as dh
set yelp_postc ='6'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '6';
update dublin_hospital as dh
set yelp_postc ='6w'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '6w';
update dublin_hospital as dh
set yelp_postc ='7'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '7';
update dublin_hospital as dh
set yelp_postc ='8'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '8';
update dublin_hospital as dh
set yelp_postc ='9'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '9';
update dublin_hospital as dh
set yelp_postc ='10'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '10';
update dublin_hospital as dh
set yelp_postc ='11'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '11';
update dublin_hospital as dh
set yelp_postc ='12'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '12';
update dublin_hospital as dh
set yelp_postc ='13'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '13';
update dublin_hospital as dh
set yelp_postc ='14'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '14';
update dublin_hospital as dh
set yelp_postc ='15'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '15';
update dublin_hospital as dh
set yelp_postc ='16'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '16';
update dublin_hospital as dh
set yelp_postc ='17'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '17';
update dublin_hospital as dh
set yelp_postc ='18'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '18';
update dublin_hospital as dh
set yelp_postc ='North County Dublin'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = 'North County Dublin';
update dublin_hospital as dh
set yelp_postc ='20'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '20';
update dublin_hospital as dh
set yelp_postc ='Phoenix Park'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = 'Phoenix Park';
update dublin_hospital as dh
set yelp_postc ='22'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '22';
update dublin_hospital as dh
set yelp_postc ='South County Dublin'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = 'South County Dublin';
update dublin_hospital as dh
set yelp_postc ='24'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,dh.wkb_geometry) and dpd.yelp_postc = '24';
update dublin_hospital
set yelp_postc ='18'
where name = 'St. Columcille''s Hospital';
update dublin_hospital
set yelp_postc ='9'
where name = 'Beaumont Hospital';
update dublin_hospital
set yelp_postc ='20'
where name = 'Hermitage Medical Clinic';
select * from dublin_hospital;



--dublin_industrial_warehouse_buildings_update
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='1'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '1';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='2'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '2';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='3'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '3';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='4'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '4';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='5'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '5';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='6'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '6';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='6w'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '6w';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='7'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '7';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='8'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '8';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='9'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '9';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='10'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '10';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='11'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '11';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='12'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '12';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='13'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '13';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='14'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '14';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='15'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '15';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='16'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '16';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='17'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '17';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='18'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '18';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='North County Dublin'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = 'North County Dublin';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='20'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '20';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='Phoenix Park'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = 'Phoenix Park';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='22'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '22';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='South County Dublin'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = 'South County Dublin';
update dublin_industrial_warehouse_buildings as diw
set yelp_postc ='24'
from dublin_postcode_dissolve as dpd
where ST_Contains(dpd.wkb_geometry,diw.wkb_geometry) and dpd.yelp_postc = '24';


CREATE VIEW distanceToHospital_View AS
  WITH DTH AS
  (select dh.name as dh_name, diw.pkid as diw_pkid,
  ST_Distance(diw.wkb_geometry,dh.wkb_geometry) as distanceToHospital,
  row_number() OVER
  (PARTITION BY diw.pkid ORDER by ST_Distance(diw.wkb_geometry,dh.wkb_geometry))
  FROM
  dublin_hospital as dh,dublin_industrial_warehouse_buildings as diw)
  select dh_name, diw_pkid, distanceToHospital from DTH where row_number = 1;

update dublin_industrial_warehouse_buildings as diw
set distance_to_hospital = dth_view.distancetohospital
from distanceToHospital_View as dth_view
where diw.pkid=dth_view.diw_pkid;

CREATE VIEW distanceToFireStation_View AS
  WITH DTH AS
  (select dfs.pkid as dfs_pkid, diw.pkid as diw_pkid,
  ST_Distance(diw.wkb_geometry,dfs.wkb_geometry) as distanceToFireStation,
  row_number() OVER
  (PARTITION BY diw.pkid ORDER by ST_Distance(diw.wkb_geometry,dfs.wkb_geometry))
  FROM
  dublin_fire_station as dfs,dublin_industrial_warehouse_buildings as diw)
  select dfs_pkid, diw_pkid, distanceToFireStation from DTH where row_number = 1;

update dublin_industrial_warehouse_buildings as diw
set distance_to_fire_station = dtf_view.distanceToFireStation
from distanceToFireStation_View as dtf_view
where diw.pkid=dtf_view.diw_pkid;

select * from dublin_industrial_warehouse_buildings;
