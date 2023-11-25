//  new ISCO-08 and ISCED
label drop object_mismacth_1

label define object_mismacth_1 ///
4 "研究所"  ///
3 "大學、技術學院" ///
2 "高中職、專科" ///
1 "國中以下" ///

drop skill_level_1
gen skill_level_1= current_work
foreach i of numlist 1/9 {
    replace skill_level_1 = `i'*100 if skill_level_1 == `i'
}
replace skill_level_1 = 1 if skill_level_1==900
replace skill_level_1 = 2 if skill_level_1==800|skill_level_1==700|skill_level_1==600|skill_level_1==500 |skill_level_1==400
replace skill_level_1 = 3 if skill_level_1==300 |skill_level_1==100 
replace skill_level_1 = 4 if skill_level_1==200 

label values skill_level_1 object_mismacth_1
label variable skill_level_1 "ISCO-08職業等級分類"
order skill_level_1 , before(mismatch)




* 創建新變數 適度教育
//assume skill_level_1 =2 需要該高中
* 创建 obj_req_1 变量并初始化为 0
* 创建 obj_req_1 变量并初始化为 0
drop obj_req_1
gen obj_req_1 = 0

* 根据条件更新 obj_req_1
replace obj_req_1 = 1 if skill_level_1 == 1 & edu_mo == 1
replace obj_req_1 = 1 if skill_level_1 == 2 & edu_mo == 2 
replace obj_req_1 = 1 if skill_level_1 == 3 & edu_mo == 3
replace obj_req_1 = 1 if skill_level_1 == 4 & edu_mo == 4

label variable obj_req_1 "客觀定義適度教育"
* 確保數據處理正確
tab obj_req_1

////////
* 创建 obj_over_1 变量并初始化为 0
drop obj_over_1
gen obj_over_1 = 0

* 根据条件更新 obj_over_1
replace obj_over_1 = 1 if skill_level_1 == 1 & edu_mo > 1
replace obj_over_1 = 1 if skill_level_1 == 2 & edu_mo > 2 
replace obj_over_1 = 1 if skill_level_1 == 3 & edu_mo > 3

label variable obj_over_1 "客觀定義過度教育"

tab obj_over_1
////////
* 创建 obj_und_1 变量并初始化为 0
drop obj_und_1
gen obj_und_1 = 0

* 根据条件更新 obj_und_1
replace obj_und_1 = 1 if (skill_level_1 == 2 & edu_mo < 2) | ///
                   (skill_level_1 == 3 & edu_mo < 3) | ///
                   (skill_level_1 == 4 & edu_mo < 4)


label variable obj_und_1 "客觀定義不足教育"
tab obj_und_1

order obj_req_1 obj_over_1 obj_und_1,before(mismatch)



* 检查是否存在冲突的情况
tabulate obj_req_1 obj_over_1 if obj_und_1 == 1

* 重复以上命令，以检查所有可能的冲突组合
tabulate obj_req_1 obj_und_1 if obj_over_1 == 1
tabulate obj_over_1 obj_und_1 if obj_req_1 == 1


