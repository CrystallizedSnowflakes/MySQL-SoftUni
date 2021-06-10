SELECT 
    s.`name`, c.`name`
FROM
    `students` AS s
        LEFT JOIN
    `courses` AS c ON s.`course_id` = c.`id`;

# s.name | c.name
# ---------------
# Alice  | HTML5
# Emma   | NULL

-- join on all valid values in LEFT table even there is empty cells in the RIGHT table