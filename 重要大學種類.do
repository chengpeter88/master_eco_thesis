* 大學讀的學校性質 國立 私立 可能是受訪者目前最高學歷 2013裡面有人有研究所
label define school_type 1 "國立大學" ///
2 "私立大學"  ///
3 "國立科大" ///
4 "私立科大" ///
5 "專科、技術學院" ///
6 "學院" ///
7 "國外大學、其他" ///
8 "遺漏值、不清楚、拒答" ///
9 "跳答"
gen school = grad_school

foreach i of numlist 1/12 {
    replace school = `i'*100 if school == `i'
}

///
replace school =8 if school == 96 |school ==97 |school ==98 
replace school =9 if school == 99

///
replace school =1 if school ==100
replace school =2 if school== 600
replace school =3 if school ==300
replace school =4 if school ==800

/// 專科、技術學院
replace school = 5 if school == 400 | school == 500 | school == 900 | school == 1000

/// 學院
 replace school = 6 if school == 200 | school == 700 

/// 國外大學、其他
replace school = 7 if school == 1100 | school == 1200 


label values school school_type

