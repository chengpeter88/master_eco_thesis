//label define grad_recode 1 "高級中等" ///
//2 "專科"  ///
//3 "科大、技術學院" ///
//4 "大學" ///
//5 "研究所" ///
//6 "其他" ///
//7 "遺漏值、不清楚、拒答" ///
drop grad_modify 
gen grad_modify = grad

foreach i of numlist 1/9 {
    replace grad_modify = `i'*100 if grad_modify == `i'
}

replace  grad_modify = 7 if grad_modify == 96| grad_modify == 97|grad_modify == 98

replace grad_modify =1 if grad_modify == 100 | grad_modify == 200

replace grad_modify =2 if grad_modify ==300 | grad_modify == 400

replace grad_modify =3 if grad_modify ==500

replace grad_modify =4 if grad_modify ==600

replace grad_modify =5 if grad_modify == 700  | grad_modify == 800

replace grad_modify =6  if grad_modify == 900 

label values grad_modify grad_recode

//
