-- You will have to INSERT records of data into the travel_cards table, based on the colonists table.
-- For colonists with id between 96 and 100(inclusive), 
-- insert data in the travel_cards table with the following values: 
# For colonists born after ‘1980-01-01’, 
-- the card_number must be combination between the year of birth, day and the first 4 digits from the ucn. 
-- For the rest – year of birth, month and the last 4 digits from the ucn.
# For colonists with id that can be divided by 2 without remainder, job must be ‘Pilot’, 
-- for colonists with id that can be divided by 3 without remainder – ‘Cook’, 
-- and everyone else – ‘Engineer’.
# Journey id is the first digit from the colonist’s ucn.

INSERT INTO travel_cards (card_number, job_during_journey, colonist_id, journey_id)
	SELECT
		(
			IF( c.birth_date > '1980-01-01', 
				concat_ws('', YEAR(c.birth_date), DAY(c.birth_date), SUBSTRING(c.ucn, 1, 4)),
				concat_ws('', YEAR(c.birth_date), MONTH(c.birth_date), SUBSTRING(c.ucn, 7))
            )
		) AS card_number,
        (
			CASE
				WHEN c.id % 2 = 0 THEN 'Pilot'
				WHEN c.id % 3 = 0 THEN 'Cook'
				ELSE 'Engineer'
			END        
        ) AS job_during_journay,
        c.id,
        (
			LEFT(c.ucn, 1)
        ) AS journey_id    
	FROM colonists AS c
    WHERE c.id BETWEEN 96 AND 100;

