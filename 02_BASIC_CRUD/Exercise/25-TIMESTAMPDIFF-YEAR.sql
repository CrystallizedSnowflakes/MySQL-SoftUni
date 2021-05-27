SELECT `employee_id`, `first_name`, `last_name`,
       TIMESTAMPDIFF(year, `hire_date`, NOW())
    AS 'Years In Service'
  FROM `employees`;
