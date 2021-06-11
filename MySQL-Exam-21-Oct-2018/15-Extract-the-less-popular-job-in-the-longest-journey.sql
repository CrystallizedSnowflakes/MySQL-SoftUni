-- Extract from the database the less popular job in the longest journey. 
-- In other words, the job with less assign colonists

SELECT tc.job_during_journey FROM travel_cards AS tc
WHERE
    tc.journey_id = (
		SELECT j.id FROM journeys j
        ORDER BY DATEDIFF(j.journey_end, j.journey_start) DESC
        LIMIT 1)
GROUP BY tc.job_during_journey
ORDER BY COUNT(tc.job_during_journey)
LIMIT 1;



