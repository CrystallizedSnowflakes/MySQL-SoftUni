SELECT COUNT(`salary`) AS 'no_manager_employees' FROM `employees`
WHERE `manager_id` IS NULL;