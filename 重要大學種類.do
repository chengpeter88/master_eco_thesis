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
gen orignal_school_type_09= school_type_09
gen orignal_school_type_13= school_type_13
gen orignal_school_type_19= school_type_19



gen last_school_type = .

* 对于每个年份，更新 last_edu 的值。
foreach year in 09 13 19 {
    * 只有当 last_edu 是缺失的时候才会更新，这样可以保证最高学历被记录。
    replace last_school_type= orignal_school_type_`year' if last_school_type == . & !missing(orignal_school_type_`year')
}

* 应用标签。
label values last_school_type school_type



**# Bookmark 09#
foreach i of numlist 1/12 {
    replace orignal_school_type_09 = `i'*100 if orignal_school_type_09 == `i'
}

///
replace orignal_school_type_09 =8 if orignal_school_type_09 == 96 |orignal_school_type_09 ==97 |orignal_school_type_09 ==98 
replace orignal_school_type_09 =9 if orignal_school_type_09 == 99

///
replace orignal_school_type_09 =1 if orignal_school_type_09 ==100
replace orignal_school_type_09 =2 if orignal_school_type_09== 600
replace orignal_school_type_09 =3 if orignal_school_type_09 ==300
replace orignal_school_type_09 =4 if orignal_school_type_09 ==800

/// 專科、技術學院
replace orignal_school_type_09= 5 if orignal_school_type_09 == 400 | orignal_school_type_09 == 500 | orignal_school_type_09 == 900 | orignal_school_type_09 == 1000

/// 學院
 replace orignal_school_type_09 = 6 if orignal_school_type_09 == 200 |orignal_school_type_09== 700 

/// 國外大學、其他
replace orignal_school_type_09 = 7 if orignal_school_type_09 == 1100 | orignal_school_type_09 == 1200 


label values orignal_school_type_09  school_type


**# Bookmark13 #


foreach i of numlist 1/12 {
    replace orignal_school_type_13 = `i'*100 if orignal_school_type_13 == `i'
}


replace orignal_school_type_13 =8 if orignal_school_type_13 == 96 |orignal_school_type_13 ==97 |orignal_school_type_13 ==98 
replace orignal_school_type_13 =9 if orignal_school_type_13 == 99

///
replace orignal_school_type_13 =1 if orignal_school_type_13 ==100
replace orignal_school_type_13 =2 if orignal_school_type_13== 600
replace orignal_school_type_13 =3 if orignal_school_type_13 ==300
replace orignal_school_type_13 =4 if orignal_school_type_13 ==800

/// 專科、技術學院
replace orignal_school_type_13= 5 if orignal_school_type_13 == 400 | orignal_school_type_13 == 500 | orignal_school_type_13 == 900 | orignal_school_type_13 == 1000

/// 學院
 replace orignal_school_type_13 = 6 if orignal_school_type_13 == 200 |orignal_school_type_13== 700 

/// 國外大學、其他
replace orignal_school_type_13 = 7 if orignal_school_type_13 == 1100 | orignal_school_type_13 == 1200 


label values orignal_school_type_13  school_type



foreach i of numlist 1/11{
    replace orignal_school_type_19 = `i'*100 if orignal_school_type_19 == `i'
}



replace orignal_school_type_19 =8 if orignal_school_type_19 == 96 |orignal_school_type_19 ==97 |orignal_school_type_13 ==98 
replace orignal_school_type_19 =9 if orignal_school_type_19 == 99

///
replace orignal_school_type_19 =1 if orignal_school_type_19 ==100
replace orignal_school_type_19 =2 if orignal_school_type_19== 600
replace orignal_school_type_19 =3 if orignal_school_type_19 ==300
replace orignal_school_type_19 =4 if orignal_school_type_19 ==800

/// 專科、技術學院
replace orignal_school_type_19= 5 if orignal_school_type_19 == 400 | orignal_school_type_19 == 500 | orignal_school_type_19 == 900 | orignal_school_type_19 == 1000

/// 學院
 replace orignal_school_type_19 = 6 if orignal_school_type_19 == 200 |orignal_school_type_19== 700 

/// 國外大學、其他
replace orignal_school_type_19 = 7 if orignal_school_type_19 == 1100 //| orignal_school_type_19 == 1200


label values orignal_school_type_19  school_type




