-- Extract from the database, all Military journeys. Sort the results ascending by journey start.

SELECT id, journey_start, journey_end FROM journeys
WHERE purpose = 'Military'
ORDER BY journey_start;
