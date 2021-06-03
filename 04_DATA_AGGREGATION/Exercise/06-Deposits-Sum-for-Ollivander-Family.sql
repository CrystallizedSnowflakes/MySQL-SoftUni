SELECT `deposit_group`, ROUND(SUM(`deposit_amount`), 2) AS `total_sum` FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group`;