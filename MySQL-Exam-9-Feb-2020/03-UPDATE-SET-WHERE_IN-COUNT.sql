-- Update all coaches, who train one or more players and their first_name starts with 'A'. 
-- Increase their level with 1.

UPDATE coaches
SET coach_level = coach_level + 1
WHERE LEFT(first_name, 1) = 'A'
AND id IN
	(SELECT coach_id FROM players_coaches);