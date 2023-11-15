// modfiy_currentjob_salary

//if  salary_type ==2  then  salary_type[i]*30  into modfiy_currentjob_salary
//elif  salary_type ==3 then salary_type[i]*currentjob_work_time[i] into  modfiy_currentjob_salary

// else  salary_type ==1  salary_type ==5 then into modfiy_currentjob_salary

gen modfiy_currentjob_salary = .
replace modfiy_currentjob_salary = salary * 30 if salary_type == 2
replace modfiy_currentjob_salary = salary * currentjob_work_time if salary_type == 3
replace modfiy_currentjob_salary = salary if salary_type == 1 | salary_type == 5 |salary_type == 4
