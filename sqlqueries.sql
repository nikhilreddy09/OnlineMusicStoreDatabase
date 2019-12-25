
-- question 1
	SELECT DISTINCT(customers_customer_id) AS each_customer ,customer_name, count(songs_song_id)
    FROM customers_has_songs AS CHS JOIN customers AS C
    WHERE CHS.customers_customer_id = C.customer_id
    GROUP BY each_customer
    HAVING count(songs_song_id) > 
    (SELECT COUNT(songs_song_id)/COUNT(DISTINCT(customers_customer_id)) FROM customers_has_songs) ;

-- QUESTION 2
DROP PROCEDURE IF EXISTS Q2;
DELIMITER //
CREATE PROCEDURE Q2()
	BEGIN
		DECLARE A INT;
		DECLARE B INT;
        DECLARE C INT;
        SELECT COUNT(customer_id) INTO A FROM customers where membership_membership_id = 1001;
		SELECT COUNT(customer_id) INTO B FROM customers where membership_membership_id = 1002;
        SELECT COUNT(customer_id) INTO C FROM customers where membership_membership_id = 1003;
        IF A>B AND A>C THEN
			SELECT "MONTHLY MEMBERSHIP IS MOST SELLING";
		ELSEIF B>A AND B>C THEN
			SELECT "6 MONTHS MEMBERSHIP IS MOST SELLING";
		ELSEIF C>A AND C>B THEN
			SELECT "ONE YEAR MEMBERSHIP IS MOST SELLING";
		END IF;
	END //
    DELIMITER ;
    call Q2();
    
    
     -- question 3
    
    SELECT membership_membership_id , membershipcost, COUNT(customer_id) AS number_of_customers ,  (COUNT(customer_id)*membershipcost) AS total_money_spent_on_eachmembership 
    FROM customers AS c JOIN membership AS m
    ON c.membership_membership_id = m.membership_id
    group by membership_membership_id;
    
    -- QUESTION 4
    select country, count(customer_id) as number_of_customers from customers group by country; 
    
    -- question 5
     -- list how many number of songs that have been played
     select count(songs_song_id) as total_number_of_songs_listened from customers_has_songs;
     
    -- question 6
    select  artist_name , count(distinct(albums_album_id)) as number_of_albums  from songs 
    JOIN aritists ON songs.aritists_aritist_id = aritists.aritist_id
	group by artist_name
	order by number_of_albums desc;
   
	-- question 7
    
    SELECT aritists_aritist_id , artist_name, COUNT(song_id) AS number_of_songs
    from songs AS s JOIN aritists AS a
    ON s.aritists_aritist_id = a.aritist_id
    GROUP BY aritists_aritist_id;
    

     
     
     
     
     
    
    
    
