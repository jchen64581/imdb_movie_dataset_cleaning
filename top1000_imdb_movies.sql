SELECT * FROM top1000_imdb_movies.top1000_movies_by_popularity;
SELECT DISTINCT genre FROM top1000_movies_by_popularity;

SELECT * FROM top1000_movies_by_popularity;
SELECT genre from top1000_movies_by_popularity
WHERE genre LIKE '%Sport%';

ALTER TABLE top1000_movies_by_popularity
ADD action varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD adventure varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD animation varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD biography varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD comedy varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD crime varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD documentary varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD drama varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD family varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD Fantasy varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD Film_Noir varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD history_ varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD horror varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD music varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD musical varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD mystery varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD romance varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD sci_Fi varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD short_Film varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD sport varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD superhero varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD thriller varchar(255);


ALTER TABLE top1000_movies_by_popularity
ADD war varchar(255);

ALTER TABLE top1000_movies_by_popularity
ADD western varchar(255);

SELECT * FROM top1000_movies_by_popularity;

ALTER TABLE top1000_movies_by_popularity
DROP COLUMN genre_action,
DROP COLUMN genre_animation;

SET SQL_SAFE_UPDATES = 0;

UPDATE top1000_movies_by_popularity
SET action =
	CASE 
		WHEN genre LIKE '%Action%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET adventure =
	CASE 
		WHEN genre LIKE '%Adventure%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET animation =
	CASE 
		WHEN genre LIKE '%Animation%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET biography =
	CASE 
		WHEN genre LIKE '%Biography%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET comedy =
	CASE 
		WHEN genre LIKE '%Comedy%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET crime =
	CASE 
		WHEN genre LIKE '%Crime%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET documentary =
	CASE 
		WHEN genre LIKE '%Documentary%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET drama =
	CASE 
		WHEN genre LIKE '%Drama%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET family =
	CASE 
		WHEN genre LIKE '%Family%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET Fantasy =
	CASE 
		WHEN genre LIKE '%Fantasy%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET Film_Noir =
	CASE 
		WHEN genre LIKE '%Film-Noir%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET history_ =
	CASE 
		WHEN genre LIKE '%History%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET horror =
	CASE 
		WHEN genre LIKE '%Horror%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET music =
	CASE 
		WHEN genre LIKE '%Music%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET musical =
	CASE 
		WHEN genre LIKE '%Musical%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET mystery =
	CASE 
		WHEN genre LIKE '%Mystery%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET romance =
	CASE 
		WHEN genre LIKE '%Romance%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET sci_Fi =
	CASE 
		WHEN genre LIKE '%Sci-Fi%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET short_Film =
	CASE 
		WHEN genre LIKE '%Short-Film%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET sport =
	CASE 
		WHEN genre LIKE '%Sport%' THEN 1
        ELSE 0
	END;

UPDATE top1000_movies_by_popularity
SET superhero =
	CASE 
		WHEN genre LIKE '%Superhero%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET thriller =
	CASE 
		WHEN genre LIKE '%Thriller%' THEN 1
        ELSE 0
	END;
UPDATE top1000_movies_by_popularity
SET war =
	CASE 
		WHEN genre LIKE '%War%' THEN 1
        ELSE 0
	END;
    
UPDATE top1000_movies_by_popularity
SET western =
	CASE 
		WHEN genre LIKE '%Western%' THEN 1
        ELSE 0
	END;
SELECT * FROM top1000_movies_by_popularity;

-- fix year format
UPDATE top1000_movies_by_popularity
SET year =  YEAR(STR_TO_DATE(LEFT(RIGHT(year, 5),4),"%Y"));
-- (SELECT YEAR(STR_TO_DATE(year, "%Y"))
-- FROM
-- (
-- SELECT 
-- 	LEFT(RIGHT(year, 5),4) AS year
-- FROM top1000_movies_by_popularity
-- ) AS year_string;
-- )

-- trim 'min' for movie_length
SELECT TRIM(LEFT(movie_length,3)) AS good_movie_length 
FROM top1000_movies_by_popularity;

UPDATE top1000_movies_by_popularity
SET movie_length = TRIM(LEFT(movie_length,3));
SELECT * FROM top1000_movies_by_popularity;

-- cast movie_length type to int
UPDATE top1000_movies_by_popularity
SET movie_length = CAST(movie_length AS UNSIGNED);
SELECT * FROM top1000_movies_by_popularity;

-- drop index column
ALTER TABLE top1000_movies_by_popularity
DROP COLUMN MyUnknownColumn;

SELECT * FROM top1000_movies_by_popularity;

-- SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
--   WHERE table_name = 'top1000_movies_by_popularity';
