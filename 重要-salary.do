 //label define salary_recode  1 "2萬以下" 2 "2萬以上，3萬以下" 3 "3萬以上，4萬以下" 5 "4萬以上，5萬以下" 6 "5萬以上，6萬以下" 7 "6 萬以上", replace

 
//replace salary_modfiy=100 if salary_modfiy==1
//replace salary_modfiy=200 if salary_modfiy==2
//replace salary_modfiy=300 if salary_modfiy==3
//replace salary_modfiy=400 if salary_modfiy==4
//replace salary_modfiy=500 if salary_modfiy==5
//replace salary_modfiy=600 if salary_modfiy==6
//replace salary_modfiy=700 if salary_modfiy==7
//replace salary_modfiy=800 if salary_modfiy==8
//replace salary_modfiy=900 if salary_modfiy==9
//replace salary_modfiy=1000 if salary_modfiy==10
//replace salary_modfiy=1200 if salary_modfiy==12

//replace salary_modfiy=8  if  salary_modfiy==96|salary_modfiy==97 |salary_modfiy==98

//replace salary_modfiy=9  if  salary_modfiy==99

//replace salary_modfiy=1  if  salary_modfiy==100|salary_modfiy==200|salary_modfiy==300|salary_modfiy==400

//replace salary_modfiy=1  if  salary_modfiy==100|salary_modfiy==200|salary_modfiy==300|salary_modfiy==

//replace salary_modfiy=2  if  salary_modfiy==500|salary_modfiy==600

//replace salary_modfiy=3  if  salary_modfiy==700|salary_modfiy==800

//replace salary_modfiy=4  if  salary_modfiy==900|salary_modfiy==1000

//replace salary_modfiy=6  if  salary_modfiy==1200






