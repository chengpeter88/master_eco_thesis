* 检查是否存在冲突的情况
//tabulate obj_req_1 obj_over_1 if obj_und_1 == 1

* 重复以上命令，以检查所有可能的冲突组合
//tabulate obj_req_1 obj_und_1 if obj_over_1 == 1
//tabulate obj_over_1 obj_und_1 if obj_req_1 == 1


gen area_n = 0
gen area_c = 0
gen area_s = 0
gen area_e = 0

replace  area_n = 1 if work_area ==1 

replace  area_c = 1 if work_area ==2

replace  area_s = 1 if work_area ==3 

replace  area_e = 1 if work_area ==4


label variable area_n "工作區域北區"
label variable area_c "工作區域中區"
label variable area_s "工作區域南區"
label variable area_e "工作區域東區"
order  area_n area_c area_s area_e,before(work_area)
