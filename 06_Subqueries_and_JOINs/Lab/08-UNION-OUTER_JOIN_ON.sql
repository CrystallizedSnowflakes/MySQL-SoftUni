-- OUTER (FULL) JOIN = UNION of LEFT & RIGHT JOIN

SELECT 
    s.`name`, c.`name`
FROM
    `students` AS s
        LEFT JOIN
    `courses` AS c ON s.`course_id` = c.`id` 
UNION SELECT 
    s.`name`, c.`name`
FROM
    `students` AS s
        RIGHT JOIN
    `courses` AS c ON s.`course_id` = c.`id`;

# s.name | c.name
# ---------------
# Alice  | HTML5
# Emma   | NULL
# NULL   | PHP

-- join on all valid values including NULL values in both tables