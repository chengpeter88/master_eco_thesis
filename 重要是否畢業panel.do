//label define is_grad_now 1 "已畢業" ///
//2 "就學中"  ///
//3 "沒有畢業（未完成學業）" ///
//4 "遺漏值、不清楚、拒答" ///
//5 "跳答" ///

//gen modfiy_is_grad_09 = is_grad_09
//gen modfiy_is_grad_13 = is_grad_13
//gen modfiy_is_grad_19 = is_grad_19
//gen modfiy_is_grad_14 = is_grad_14

//replace modfiy_is_grad_09=4 if is_grad_09==96 |is_grad_09==97|is_grad_09==98
//replace modfiy_is_grad_09=5 if is_grad_09==99

//replace modfiy_is_grad_13=4 if is_grad_13==96 |is_grad_13==97|is_grad_13==98
//replace modfiy_is_grad_13=5 if is_grad_13==99

//replace modfiy_is_grad_19=4 if is_grad_19==96 |is_grad_19==97|is_grad_19==98
//replace modfiy_is_grad_19=5 if is_grad_19==99

//foreach i of numlist 1/4 {
//	replace modfiy_is_grad_14= `i'*100 if modfiy_is_grad_14 == `i'
//	}

//replace modfiy_is_grad_14=1 if modfiy_is_grad_14==100
//replace modfiy_is_grad_14=2 if modfiy_is_grad_14==400
//replace modfiy_is_grad_14=3 if modfiy_is_grad_14==200 |modfiy_is_grad_14==300



//label values modfiy_is_grad_09 is_grad_now
//label values modfiy_is_grad_13 is_grad_now
//label values modfiy_is_grad_19 is_grad_now
//label values modfiy_is_grad_14 is_grad_now

////

//gen is_grad = .

* 根据各年份的数据设置 is_grad 变量
//replace is_grad = modfiy_is_grad_09 if year == 2009
//replace is_grad = modfiy_is_grad_13 if year == 2013 & is_grad == .
//replace is_grad = modfiy_is_grad_19 if year == 2019 & is_grad == .
//replace is_grad = modfiy_is_grad_14 if year == 2014 & is_grad == .

* 应用您定义的标签
//label values is_grad is_grad_now







