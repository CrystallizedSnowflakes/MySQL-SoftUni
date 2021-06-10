SELECT 
    s.`name`, c.`name`
FROM
    `students` AS s
        RIGHT JOIN
    `courses` AS c ON s.`course_id` = c.`id`;

# s.name | c.name
# ---------------
# Alice  | HTML5
# NULL   | PHP

-- join on all valid values in RIGHT table even there is empty cells in the LEFT table