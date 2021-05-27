SELECT concat_ws(' ', `first_name`, `last_name`, `job_title`) 
AS 'full_name', 	
`job_title` AS  'Job Title',
`id` AS 'No.'
  FROM `employees`;
