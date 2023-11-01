
label define salary_recode 1 "2萬以下" ///
2 "2萬以上，3萬以下"  ///
3 "3萬以上，4萬以下" ///
4 "4萬以上，5萬以下" ///
5 "5萬以上，6萬以下" ///
6 "6 萬以上" ///
7 "遺漏值、不清楚、拒答" ///
8 "跳達"

gen salary_modfiy = salary
//gen salary_modfiy = cp13v62

//foreach i of numlist 1/17 {replace salary_modfiy = `i'*100 if salary_modfiy == `i'}
foreach i of numlist 1/17 {
	replace salary_modfiy= `i'*100 if salary_modfiy == `i'
	}

replace  salary_modfiy=7  if salary_modfiy==96|salary_modfiy==97 |salary_modfiy==98

replace salary_modfiy=8  if  salary_modfiy==99

replace salary_modfiy=1  if  salary_modfiy==100|salary_modfiy==200|salary_modfiy==300|salary_modfiy==400

replace salary_modfiy=2  if  salary_modfiy==500|salary_modfiy==600

replace salary_modfiy=3  if  salary_modfiy==700|salary_modfiy==800

replace salary_modfiy=4  if  salary_modfiy==900|salary_modfiy==1000


replace salary_modfiy=5  if  salary_modfiy==1100 | salary_modfiy==1200 

replace salary_modfiy=6 if salary_modfiy==1300|salary_modfiy==1400|salary_modfiy==1500 |salary_modfiy==1600 |salary_modfiy==1700

label values salary_modfiy salary_recode







