//label define top_edu 1 "高級中等" ///
//2 "專科"  ///
//3 "科大、技術學院" ///
//4 "大學" ///
//5 "研究所" ///
//6 "其他" ///
//7 "遺漏值、不清楚、拒答" ///
//8 "跳答" ///


gen orginal_top_grad_09 = top_grad_09
gen orginal_top_grad_13 = top_grad_13
gen orginal_top_grad_14 = top_grad_14
gen orginal_top_grad_19 = highest_edu


**# 09 #3

foreach i of numlist 1/7 {
	replace orginal_top_grad_09= `i'*100 if orginal_top_grad_09== `i'
	}

replace  orginal_top_grad_09  =1 if orginal_top_grad_09 ==100 |orginal_top_grad_09 ==200

replace orginal_top_grad_09 =2   if  orginal_top_grad_09 ==300 |orginal_top_grad_09 ==400

replace orginal_top_grad_09 =3   if  orginal_top_grad_09 ==500

replace orginal_top_grad_09 =4   if  orginal_top_grad_09 ==600

//replace orginal_top_grad_09 =5 

replace orginal_top_grad_09 =6   if orginal_top_grad_09 ==700 

replace orginal_top_grad_09 =7   if orginal_top_grad_09 ==96 |orginal_top_grad_09 ==97 |orginal_top_grad_09==98

//replace orginal_top_grad_09 =8

label values orginal_top_grad_09  top_edu 
///done new 紀錄最高學歷09


////
**# Bookmark 13#4

foreach i of numlist 1/9 {
	replace orginal_top_grad_13= `i'*100 if orginal_top_grad_13 == `i'
	}
	
replace  orginal_top_grad_13  =1 if orginal_top_grad_13 ==100 |orginal_top_grad_13 ==200

replace  orginal_top_grad_13  =2 if orginal_top_grad_13 ==300 |orginal_top_grad_13 ==400

replace  orginal_top_grad_13  =3 if orginal_top_grad_13 ==500 

replace  orginal_top_grad_13  =4 if orginal_top_grad_13 ==600 

replace  orginal_top_grad_13  =5 if orginal_top_grad_13 ==700 |orginal_top_grad_13 ==800

replace  orginal_top_grad_13  =6 if orginal_top_grad_13 ==900 

replace  orginal_top_grad_13  =7 if orginal_top_grad_13 ==96 |orginal_top_grad_13 ==97  |orginal_top_grad_13 ==98



label values orginal_top_grad_13  top_edu 



///done new 紀錄最高學歷13
	

**# Bookmark 14#5
foreach i of numlist 1/10 {
	replace orginal_top_grad_14= `i'*100 if orginal_top_grad_14 == `i'
	}
	


replace  orginal_top_grad_14  =1 if orginal_top_grad_14 ==100 |orginal_top_grad_14 ==200

replace  orginal_top_grad_14  =2 if orginal_top_grad_14 ==300 |orginal_top_grad_14 ==400

replace  orginal_top_grad_14  =3 if orginal_top_grad_14 ==500 

replace  orginal_top_grad_14  =4 if orginal_top_grad_14 ==600 

replace  orginal_top_grad_14  =5 if orginal_top_grad_14 ==700 |orginal_top_grad_14 ==800

replace  orginal_top_grad_14  =6 if orginal_top_grad_14 ==1000 

replace  orginal_top_grad_14  =7 if orginal_top_grad_14 ==96 |orginal_top_grad_14 ==97  |orginal_top_grad_14 ==98

label values orginal_top_grad_14 top_edu 


///done new 紀錄最高學歷14




**# Bookmark19 #6

foreach i of numlist 1/9 {
	replace orginal_top_grad_19= `i'*100 if orginal_top_grad_19 == `i'
	}
	
	
replace  orginal_top_grad_19  =1 if orginal_top_grad_19 ==100 |orginal_top_grad_19 ==200

replace  orginal_top_grad_19  =2 if orginal_top_grad_19 ==300 |orginal_top_grad_19 ==400

replace  orginal_top_grad_19  =3 if orginal_top_grad_19 ==500 

replace  orginal_top_grad_19  =4 if orginal_top_grad_19 ==600 

replace  orginal_top_grad_19  =5 if orginal_top_grad_19 ==700 |orginal_top_grad_19 ==800

replace  orginal_top_grad_19  =6 if orginal_top_grad_19 ==900 

replace  orginal_top_grad_19 =7   if orginal_top_grad_19 ==96 |orginal_top_grad_19 ==97 

 
label values orginal_top_grad_19 top_edu 

	

* 假设 orginal_top_grad_xx 是已经存在的变量，且已经按照您的逻辑进行了调整。

* 创建新变量 last_edu，初始值设为缺失。
gen last_edu = .

* 对于每个年份，更新 last_edu 的值。
foreach year in 09 13 14 19 {
    * 只有当 last_edu 是缺失的时候才会更新，这样可以保证最高学历被记录。
    replace last_edu = orginal_top_grad_`year' if last_edu == . & !missing(orginal_top_grad_`year')
}

* 应用标签。
label values last_edu top_edu
	
