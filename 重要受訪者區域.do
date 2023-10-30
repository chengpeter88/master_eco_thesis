label define area_recode 1 "北部" ///
2 "中部"  ///
3 "南部" ///
4 "東部" ///
5 "離島" ///
6 "國外地區" ///
7 "遺漏值、不清楚、拒答" ///

gen area_recode =area

///
foreach i of numlist 1/24 {
    replace area_recode = `i'*100 if area_recode == `i'
}


replace  area_recode = 7 if  area_recode == 96 | area_recode == 97 |area_recode == 98

replace  area_recode =1  if area_recode== 100 |area_recode==200 |area_recode==300 |area_recode==400 |area_recode==500 | area_recode==600 |area_recode == 1700

replace area_recode =2 if area_recode == 700 | area_recode==800 |area_recode==900 |area_recode==1000 |area_recode==1100 

replace area_recode =3 if  area_recode == 1200 |area_recode==1300 |area_recode==1400 |area_recode==1500 |area_recode==1600

replace area_recode=4 if  area_recode==1800 |area_recode==1900 

replace area_recode=5 if  area_recode==2000 | area_recode==2100 | area_recode==2200

replace area_recode=6 if  area_recode==2300 | area_recode==2400

label values area_recode area_recode
