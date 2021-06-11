-- Extract from the database, all travel cards. Sort the results by card number ascending.

SELECT card_number,	job_during_journey FROM travel_cards
ORDER BY card_number;