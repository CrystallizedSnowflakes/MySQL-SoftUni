-- Count all colonists, that are on technical journey. 

SELECT COUNT(*) FROM colonists AS c
JOIN travel_cards AS tc
ON c.id = tc.colonist_id
JOIN journeys AS j
ON tc.journey_id = j.id
WHERE purpose = 'Technical';

 