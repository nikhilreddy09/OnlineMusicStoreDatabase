use mydb;
CREATE VIEW mydb.information AS
SELECT (customers_customer_id) , songs_song_id , albums_album_id , genre_genre_id , song_name 
FROM customers_has_songs AS chs JOIN songs AS s
ON chs.songs_song_id = s.song_id JOIN albums AS a
ON s.albums_album_id = a.album_id;

SELECT * FROM information  order by customers_customer_id;


DROP PROCEDURE IF EXISTS answer;
DELIMITER //
CREATE PROCEDURE answer()

BEGIN
	DECLARE genre_1 INT;
	DECLARE genre_2 INT;
	DECLARE genre_3 INT;
	DECLARE genre_4 INT;
	DECLARE genre_5 INT;
	DECLARE finished INT DEFAULT 0;
	DECLARE customeridentity INT;
	DECLARE selection CURSOR FOR SELECT DISTINCT(customers_customer_id) FROM information;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	OPEN selection;
	getcustomerid: LOOP
		FETCH selection INTO customeridentity;
		IF finished = 1 THEN
			LEAVE getcustomerid;
		END IF;
		SELECT count(genre_genre_id) INTO genre_1 FROM information WHERE (customers_customer_id = customeridentity) AND (genre_genre_id = 1);
		SELECT count(genre_genre_id) INTO genre_2 FROM information WHERE (customers_customer_id = customeridentity) AND (genre_genre_id = 2);
		SELECT count(genre_genre_id) INTO genre_3 FROM information WHERE (customers_customer_id = customeridentity) AND (genre_genre_id = 3);
		SELECT count(genre_genre_id) INTO genre_4 FROM information WHERE (customers_customer_id = customeridentity) AND (genre_genre_id = 4);
		SELECT count(genre_genre_id) INTO genre_5 FROM information WHERE (customers_customer_id = customeridentity) AND (genre_genre_id = 5);

		IF genre_1 >= genre_2 AND genre_1>= genre_3 AND genre_1 >= genre_4 AND genre_1 >=genre_5 THEN
			-- SELECT CONCAT(customeridentity, "---" , "GENRE1") as customers_top_genre;
			SELECT customeridentity,genre_genre_id, songs_song_id , song_name 
            from information 
            where genre_genre_id = 1 
            order by rand() LIMIT 1;
		ELSEIF genre_2 >= genre_1 AND genre_2>= genre_3 AND genre_2 >= genre_4 AND genre_2 >=genre_5 THEN
			-- SELECT CONCAT(customeridentity, "---" , "GENRE2");
			SELECT customeridentity,genre_genre_id, songs_song_id , song_name
            from information
            where genre_genre_id = 2
            order by rand() LIMIT 1;
		ELSEIF genre_3 >= genre_1 AND genre_3>= genre_2 AND genre_3 >= genre_4 AND genre_3 >=genre_5 THEN
			-- SELECT CONCAT(customeridentity, "---" , "GENRE3");
			SELECT customeridentity,genre_genre_id, songs_song_id , song_name
            from information
            where genre_genre_id = 3
            order by rand() LIMIT 1;
		ELSEIF genre_4 >= genre_1 AND genre_4>= genre_2 AND genre_4 >= genre_3 AND genre_4 >=genre_5 THEN
			-- SELECT CONCAT(customeridentity, "---" , "GENRE4");
            SELECT customeridentity,genre_genre_id, songs_song_id , song_name
            from information
            where genre_genre_id = 4
            order by rand() LIMIT 1;
		ELSEIF genre_5 > genre_1 AND genre_5>= genre_2 AND genre_5 >= genre_3 AND genre_5 >=genre_4 THEN
			-- SELECT CONCAT(customeridentity, "---" , "GENRE5");
            SELECT customeridentity,genre_genre_id,  songs_song_id , song_name 
            from information
            where genre_genre_id = 5
            order by rand() LIMIT 1;
		END IF;
	END LOOP getcustomerid;
CLOSE selection;

END//
DELIMITER ;
CALL answer();

-- QUESTION 1

DROP PROCEDURE IF EXISTS populargenre;
DELIMITER //
CREATE PROCEDURE populargenre()

BEGIN
	DECLARE genre_1 INT;
	DECLARE genre_2 INT;
	DECLARE genre_3 INT;
	DECLARE genre_4 INT;
	DECLARE genre_5 INT;
    
    SELECT count(genre_genre_id) INTO genre_1 FROM information WHERE genre_genre_id = 1;
    SELECT count(genre_genre_id) INTO genre_2 FROM information WHERE genre_genre_id = 2;
    SELECT count(genre_genre_id) INTO genre_3 FROM information WHERE genre_genre_id = 3;
    SELECT count(genre_genre_id) INTO genre_4 FROM information WHERE genre_genre_id = 4;
    SELECT count(genre_genre_id) INTO genre_5 FROM information WHERE genre_genre_id = 5;
    IF genre_1 >= genre_2 AND genre_1>= genre_3 AND genre_1 >= genre_4 AND genre_1 >=genre_5 THEN
    select genre_name AS popular_genre from genre where genre_id=1; 
    ELSEIF genre_2 >= genre_1 AND genre_2>= genre_3 AND genre_2 >= genre_4 AND genre_2 >=genre_5 THEN
    select genre_name AS popular_genre from genre where genre_id=2;
    ELSEIF genre_3 >= genre_1 AND genre_3>= genre_2 AND genre_3 >= genre_4 AND genre_3 >=genre_5 THEN
    select genre_name AS popular_genre from genre where genre_id=3;
    ELSEIF genre_4 >= genre_1 AND genre_4>= genre_2 AND genre_4 >= genre_3 AND genre_4 >=genre_5 THEN
    select genre_name AS popular_genre from genre where genre_id=4;
    ELSEIF genre_5 > genre_1 AND genre_5>= genre_2 AND genre_5 >= genre_3 AND genre_5 >=genre_4 THEN
    select genre_name AS popular_genre from genre where genre_id=5;
    END IF;
    END //
    DELIMITER ;
    CALL populargenre();
    
    
    -- Question 3 
    -- total count of customers listening to same album
        
    select albums_album_id , count(customers_customer_id) from information group by albums_album_id;
    
    -- question 2
    
    -- 2.Finding out most popular singer and least favourite singer from each genre(category).
    CREATE VIEW mydb.favsinger AS
    select customers_customer_id , songs_song_id , aritists_aritist_id , albums_album_id , genre_genre_id
    from customers_has_songs AS chs JOIN songs AS s
    ON chs.songs_song_id = s.song_id JOIN albums AS a
    ON s.albums_album_id = a.album_id JOIN genre AS g
    ON a.genre_genre_id = g.genre_id;
    
    SELECT * FROM favsinger;
    
    
DROP PROCEDURE IF EXISTS fav;
DELIMITER //
CREATE PROCEDURE fav()
BEGIN
DECLARE count1 INT;
DECLARE count2 INT;
DECLARE count3 INT;
DECLARE count4 INT;
DECLARE count5 INT;
DECLARE count6 INT;
DECLARE count7 INT;
DECLARE count8 INT;
DECLARE count9 INT;
DECLARE count10 INT;
DECLARE count11 INT;
DECLARE count12 INT;
DECLARE count13 INT;
DECLARE count14 INT;
DECLARE count15 INT;
DROP TABLE IF EXISTS favsingertable;
CREATE TABLE favsingertable(counter INT , artist_id INT);
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 101;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 102;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 103;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 104;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 105;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 106;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 107;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 108;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 109;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 110;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 111;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 112;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 113;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 114;
INSERT INTO favsingertable(counter , artist_id)
SELECT COUNT(customers_customer_id) , aritists_aritist_id FROM favsinger where aritists_aritist_id = 115;

select * from favsingertable;

SELECT artist_id AS FAVSINGER FROM favsingertable order by counter DESC LIMIT 1 ;
SELECT artist_id AS LEASTFAVSINGER FROM favsingertable WHERE artist_id IS NOT NULL  order by counter LIMIT 1; 

END //
DELIMITER ;

CALL fav();


    
    
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
















