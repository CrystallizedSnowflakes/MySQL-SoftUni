SELECT `deposit_group`, `magic_wand_creator`, 
ROUND(MIN(`deposit_charge`), 2) AS `min_deposit_charge` FROM `wizzard_deposits`
GROUP BY `deposit_group`, `magic_wand_creator`
ORDER BY `magic_wand_creator`, `deposit_group`;