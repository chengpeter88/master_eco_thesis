//drop label education

label define education ///
4 "研究所"  ///
3 "大學、技術學院" ///
2 "高中職、專科" ///
1 "國中以下" ///


gen edu_mo= edu
foreach i of numlist 1/5 {
    replace edu_mo = `i'*100 if edu_mo == `i'
}

replace edu_mo = 1 if edu_mo==100
replace edu_mo = 2 if edu_mo==200|edu_mo ==300 
replace edu_mo = 3 if edu_mo==400 
replace edu_mo = 4 if edu_mo== 500 

label values edu_mo education
label variable edu_mo "最高學歷經調整"
order edu_mo ,before(edu)
tab edu_mo
