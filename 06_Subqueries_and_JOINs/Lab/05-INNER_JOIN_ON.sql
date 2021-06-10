SELECT 
    s.`name`, c.`name`
FROM
    `students` AS s
        INNER JOIN      -- or just JOIN
    `courses` AS c ON s.`course_id` = c.`id`;

# s.name | c.name
# ---------------
# Alice  | HTML5
# David  | MySQL

-- join on all valid values in both tables