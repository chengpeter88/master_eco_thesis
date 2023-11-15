//label define uni_major 1 "教育、人文、藝術" ///
//2 "商、社科、法"  ///
//3 "工程、科學" ///
//4 "農業" ///
//5 "醫藥" ///
//6 "服務、其他" ///
//7 "遺漏值、不清楚、拒答" ///
//8 "跳答"


gen modify_uni_major_09  =uni_major_09
gen modify_uni_major_13  =uni_major_13
gen modify_uni_major_19  =uni_major_19

foreach i of numlist 1/9 {
    replace modify_uni_major_09 = `i'*100 if modify_uni_major_09 == `i'
}

replace modify_uni_major_09 =1 if modify_uni_major_09 ==100 | modify_uni_major_09 ==200 

replace modify_uni_major_09 =2 if modify_uni_major_09 ==300 

replace modify_uni_major_09 =3  if modify_uni_major_09 ==400 |modify_uni_major_09 ==500 

replace modify_uni_major_09 =4 if modify_uni_major_09 == 600 

replace modify_uni_major_09 =5  if modify_uni_major_09 ==700 

replace modify_uni_major_09 =6  if modify_uni_major_09 == 800 | modify_uni_major_09 ==900

replace modify_uni_major_09 =7 if modify_uni_major_09 == 96 |modify_uni_major_09 == 97 | modify_uni_major_09 == 98 

replace modify_uni_major_09 =8  if modify_uni_major_09 ==99

label values modify_uni_major_09 uni_major


foreach i of numlist 1/9 {
    replace modify_uni_major_13 = `i'*100 if modify_uni_major_13 == `i'
}

replace modify_uni_major_13 =1 if modify_uni_major_13 ==100 |modify_uni_major_13 ==200 

replace modify_uni_major_13 =2 if modify_uni_major_13 ==300 

replace modify_uni_major_13 =3  if modify_uni_major_13 ==400 |modify_uni_major_13 ==500 

replace modify_uni_major_13 =4 if modify_uni_major_13 == 600 

replace modify_uni_major_13 =5  if modify_uni_major_13 ==700 

replace modify_uni_major_13 =6  if modify_uni_major_13 ==  800 | modify_uni_major_13 ==900

replace modify_uni_major_13 =7 if modify_uni_major_13 == 96 |modify_uni_major_13 == 97 | modify_uni_major_13 == 98 

replace modify_uni_major_13 = 8  if modify_uni_major_13 == 99

label values modify_uni_major_13 uni_major



foreach i of numlist 1/9 {
    replace modify_uni_major_19 = `i'*100 if modify_uni_major_19 == `i'
}

replace modify_uni_major_19 =1 if modify_uni_major_19 ==100 |modify_uni_major_19 ==200 

replace modify_uni_major_19 =2 if modify_uni_major_19 ==300 

replace modify_uni_major_19 =3  if modify_uni_major_19 ==400 |modify_uni_major_19 ==500 

replace modify_uni_major_19 =4 if modify_uni_major_19 == 600 

replace modify_uni_major_19 =5  if modify_uni_major_19 ==700 

replace modify_uni_major_19 =6  if modify_uni_major_19 ==  800 | modify_uni_major_19 ==900

replace modify_uni_major_19 =7 if modify_uni_major_19 == 96 |modify_uni_major_19 == 97 | modify_uni_major_19 == 98 

replace modify_uni_major_19 =8  if modify_uni_major_19 ==99

label values modify_uni_major_19 uni_major


gen uni_major_type = .

* 对于每个年份，更新 last_edu 的值。
foreach year in 09 13 19 {
    * 只有当 last_edu 是缺失的时候才会更新，这样可以保证最高学历被记录。
    replace uni_major_type= modify_uni_major_`year' if uni_major_type == . & !missing(modify_uni_major_`year')
}

* 应用标签。
label values uni_major_type uni_major



