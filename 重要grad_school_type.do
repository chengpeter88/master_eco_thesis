gen modfity_grad_school_13 =  grad_school_13
gen modfity_grad_school_19 =  grad_school_19


foreach i of numlist 1/12 {
    replace modfity_grad_school_13 = `i'*100 if modfity_grad_school_13 == `i'
}


///
replace modfity_grad_school_13 =8 if modfity_grad_school_13 == 96 |modfity_grad_school_13 ==97 |modfity_grad_school_13 ==98
 
replace modfity_grad_school_13 =9 if modfity_grad_school_13 == 99

///
replace modfity_grad_school_13 =1 if modfity_grad_school_13 ==100
replace modfity_grad_school_13 =2 if modfity_grad_school_13== 600
replace modfity_grad_school_13 =3 if modfity_grad_school_13 ==300
replace modfity_grad_school_13 =4 if modfity_grad_school_13 ==800

/// 專科、技術學院
replace modfity_grad_school_13= 5 if modfity_grad_school_13 == 400 | modfity_grad_school_13 == 500 | modfity_grad_school_13 == 900 | modfity_grad_school_13 == 1000

/// 學院
 replace modfity_grad_school_13 = 6 if modfity_grad_school_13 == 200 |modfity_grad_school_13== 700 

/// 國外大學、其他
replace modfity_grad_school_13 = 7 if modfity_grad_school_13 == 1100 | modfity_grad_school_13 == 1200 


label values modfity_grad_school_13  school_type


////

foreach i of numlist 1/12 {
    replace modfity_grad_school_19 = `i'*100 if modfity_grad_school_19 == `i'
}


replace modfity_grad_school_19 =8 if modfity_grad_school_19 == 96 |modfity_grad_school_19 ==97 |modfity_grad_school_19 ==98 

replace modfity_grad_school_19 =9 if modfity_grad_school_19 == 99

///
replace modfity_grad_school_19 =1 if modfity_grad_school_19 ==100
replace modfity_grad_school_19 =2 if modfity_grad_school_19== 600
replace modfity_grad_school_19 =3 if modfity_grad_school_19 ==300
replace modfity_grad_school_13 =4 if modfity_grad_school_19 ==800

/// 專科、技術學院
replace modfity_grad_school_19= 5 if modfity_grad_school_19 == 400 | modfity_grad_school_19 == 500 | modfity_grad_school_19 == 900 | modfity_grad_school_19 == 1000

/// 學院
 replace modfity_grad_school_19 = 6 if modfity_grad_school_19 == 200 |modfity_grad_school_19== 700 

/// 國外大學、其他
replace modfity_grad_school_19 = 7 if modfity_grad_school_19 == 1100 | modfity_grad_school_19 == 1200 


label values modfity_grad_school_19  school_type




gen grad_school_type = .

* 对于每个年份，更新 last_edu 的值。
foreach year in  13 19 {
    * 只有当 last_edu 是缺失的时候才会更新，这样可以保证最高学历被记录。
    replace grad_school_type= modfity_grad_school_`year' if grad_school_type == . & !missing(modfity_grad_school_`year')
}

* 应用标签。
label values grad_school_type school_type
