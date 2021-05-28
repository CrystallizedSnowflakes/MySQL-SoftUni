SELECT ROUND(SUM(`cost`), -1) AS 'Total Cost' FROM `books`;
-- 1257.26 -> 1260
SELECT ROUND(SUM(`cost`), -2) AS 'Total Cost' FROM `books`;
-- 1257.26 -> 1300