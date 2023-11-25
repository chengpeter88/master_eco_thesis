
//label drop object_mismacth

label define object_mismacth ///
4 "大學至研究所"  ///
3 "大學、技術學院" ///
2 "國中至高中職、專科" ///
1 "國小" ///


gen skill_level= current_work
foreach i of numlist 1/9 {
    replace skill_level = `i'*100 if skill_level == `i'
}
replace skill_level = 1 if skill_level==900
replace skill_level = 2 if skill_level==800|skill_level==700|skill_level==600|skill_level==500 |skill_level==400
replace skill_level = 3 if skill_level==300
replace skill_level = 4 if skill_level==200 |skill_level==100 


label values skill_level object_mismacth
label variable skill_level "ISCO-08職業等級分類"
order skill_level , before(mismatch)
