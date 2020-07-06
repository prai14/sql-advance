# sql-advance

select CITY, length( CITY )
from STATION 
where length( CITY ) = ( select min( length( CITY ) ) from station ) order by CITY limit 1;

select CITY, length( CITY )
from STATION 
where length( CITY ) = ( select max( length( CITY ) ) from station ) order by CITY limit 1;


select CITY, length( CITY )
from STATION 
where id = (
    select id
    from STATION
    order by length(CITY) desc
    limit 1
);

select CITY, length( CITY )
from STATION 
where id = (
    select id
    from STATION where length(city) = (select min(length(city)) from station) order by CITY limit 1;
    limit 1
);

   
SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[aeiou]';
SELECT DISTINCT CITY FROM STATION WHERE CITY regexp '.[aeiouAEIOU]$';
SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[aeiou].*[aeiou]$';
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT RLIKE '^[aeiou]';
SELECT DISTINCT CITY FROM STATION WHERE CITY not rlike '.[aeiouAEIOU]$';
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT RLIKE '^[aeiou]' || CITY not rlike '.[aeiouAEIOU]$';


https://nifannn.github.io/2017/10/24/SQL-Notes-Hackerrank-Challenges/
