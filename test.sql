SELECT /*select the employee and its department */
    `employee`.`id` AS employee_id, 
    concat(
        `employee`.`first_name`, 
        ' ', 
        `employee`.`last_name`
    ) AS employee_full_name, 
    `department`.`id` AS department_id, 
    'department'.'name' AS last_department_name 
    
    from employee 
    inner join ( 
            select `department_employee_rel`.`employee_id`, max(`department_employee_rel`.`id`) AS max_id 
            from `department_employee_rel` der 
            where `department_employee_rel`.`deleted_flag` = 0 
            group by `department_employee_rel`.`employee_id` 
        ) `department_employee_rel` ON 1=1 
        AND `department_employee_rel`.`employee_id` = `employee`.`id` 

    inner join `department_employee_rel` der ON 1=1
        AND `department_employee_rel`.`id` = max_id 
        AND `department_employee_rel`.`deleted_flag` = 0 
    
    inner join department d ON 1=1
        AND `department`.`id` = `department_employee_rel`.`department_id` 
        AND `department`.`deleted_flag` = 0

    where 1=1
        AND `employee`.`id` IN (10010, 10040, 10050, 91050, 205357) 
        AND `employee`.`deleted_flag` = 0 
    limit 100;
