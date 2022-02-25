USE top1000_imdb_movies;

SELECT * FROM top1000_movies;

-- extract 4 digits year from the year column
SELECT LEFT(RIGHT(year, 5),4) AS year 
FROM top1000_movies;

-- enable safe mode
SET SQL_SAFE_UPDATES = 0;

UPDATE top1000_movies
SET year =  LEFT(RIGHT(year, 5),4);


-- extract movie runtime from movie_length
SELECT TRIM(SUBSTRING(movie_length,1,3)) AS movie_length 
FROM top1000_movies;

UPDATE top1000_movies
SET movie_length =  TRIM(SUBSTRING(movie_length,1,3));


-- remove thousand seperator from votes for further cleaning
SELECT REPLACE(votes, ',', '') 
FROM top1000_movies;

UPDATE top1000_movies
SET votes =  REPLACE(votes, ',', '');


-- check data type for all columns
SELECT column_name, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'top1000_movies';
-- Undesired type/Type mismatch: as we can see, data type for year, movie_length, and votes are all string, which do not make sense, they should be cast to int type


-- change the data type
ALTER TABLE top1000_movies    
MODIFY votes int,
MODIFY movie_length int,
MODIFY year YEAR(4); 

-- standarize genre column, create columns for different genres
ALTER TABLE top1000_movies
ADD action int,
ADD adventure int,
ADD animation int,
ADD biography int,
ADD comedy int,
ADD crime int,
ADD documentary int,
ADD drama int,
ADD family int,
ADD Fantasy int,
ADD Film_Noir int,
ADD history int,
ADD horror int,
ADD music int,
ADD musical int,
ADD mystery int,
ADD romance int,
ADD sci_Fi int,
ADD short_Film int,
ADD sport int,
ADD superhero int,
ADD thriller int,
ADD war int,
ADD western int;

-- update table, movie with the corresponding genre will have the value 1, else 0
UPDATE top1000_movies
SET action =
	CASE 
		WHEN genre LIKE '%Action%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET adventure =
	CASE 
		WHEN genre LIKE '%Adventure%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET animation =
	CASE 
		WHEN genre LIKE '%Animation%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET biography =
	CASE 
		WHEN genre LIKE '%Biography%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET comedy =
	CASE 
		WHEN genre LIKE '%Comedy%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET crime =
	CASE 
		WHEN genre LIKE '%Crime%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET documentary =
	CASE 
		WHEN genre LIKE '%Documentary%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET drama =
	CASE 
		WHEN genre LIKE '%Drama%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET family =
	CASE 
		WHEN genre LIKE '%Family%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET Fantasy =
	CASE 
		WHEN genre LIKE '%Fantasy%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET Film_Noir =
	CASE 
		WHEN genre LIKE '%Film-Noir%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET history =
	CASE 
		WHEN genre LIKE '%History%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET horror =
	CASE 
		WHEN genre LIKE '%Horror%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET music =
	CASE 
		WHEN genre LIKE '%Music%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET musical =
	CASE 
		WHEN genre LIKE '%Musical%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET mystery =
	CASE 
		WHEN genre LIKE '%Mystery%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET romance =
	CASE 
		WHEN genre LIKE '%Romance%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET sci_Fi =
	CASE 
		WHEN genre LIKE '%Sci-Fi%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET short_Film =
	CASE 
		WHEN genre LIKE '%Short-Film%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET sport =
	CASE 
		WHEN genre LIKE '%Sport%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies
SET superhero =
	CASE 
		WHEN genre LIKE '%Superhero%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET thriller =
	CASE 
		WHEN genre LIKE '%Thriller%' THEN 1
        ELSE 0
	END;
UPDATE top1000_movies
SET war =
	CASE 
		WHEN genre LIKE '%War%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies
SET western =
	CASE 
		WHEN genre LIKE '%Western%' THEN 1
        ELSE 0
	END;

SELECT * FROM top1000_movies;

-- drop unused columns
ALTER TABLE top1000_movies
DROP COLUMN MyUnknownColumn,
DROP COLUMN genre;

SELECT * FROM top1000_movies;
