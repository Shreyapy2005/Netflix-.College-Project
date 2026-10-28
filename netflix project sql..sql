create database netflix_db;

use netflix_db;
select *
from netflix_data
limit 10;
-- count show_id

select count(*) as show_id from netflix_data;

-- i will count how many types are there 

select type, count(*) as total_count
from netflix_data
group by type;

-- i will see which movie or tv show reach the highest rating
select title, type, rating 
from netflix_data 
where rating = (
select max(rating)
from netflix_data
);

-- country wise  which movie or tv show see maximum
select country, type, count(*) as total_titles
from netflix_data
where country is not null
group by country, type
order by country, total_titles desc;

-- top 10 country to watch movie

select country, count(*) as total_movies
from netflix_data 
where type = 'movie'
and country is not null 
group by country
order by total_movies desc limit 10;

-- movie vs tv show
select type, count(*) as total
from netflix_data
group by type;


