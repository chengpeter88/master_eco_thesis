//reg lnsalary exper_squ exper gender num_job field_exper exper currentjob_full obj_req_1 obj_over_1 obj_und_1 area_n area_c area_s area_e

//outreg2 using regression_results, replace tstat bdec(3) tdec(2) ctitle(log(salary)) tex

reg lnsalary exper_squ exper gender num_job   currentjob_full obj_req_1 obj_over_1 obj_und_1 area_n area_c area_s area_e
outreg2 using regression_results,append tstat bdec(3) tdec(2) ctitle(log(salary)) tex
