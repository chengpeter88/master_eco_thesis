gen exper_yr_mo = (exper_mo/12)
gen exper = exper_yr_mo+ exper_yr
drop  exper_yr_mo
gen exper_1= round(exper,0.0001)
label variable exper_1 "踏入職場到現今的年資（合併月）"
order exper_1 ,before(exper_yr)
drop exper
rename exper_1 exper

gen field_exper_yr_mo = (field_exper_mo/12)
gen field_exper = field_exper_yr_mo+ field_exper_yr
drop  field_exper_yr_mo
gen field_exper_1= round(field_exper,0.0001)
label variable field_exper_1 "目前工作領域年資（合併月）"
order field_exper_1 ,before(field_exper_yr)
drop field_exper
rename field_exper_1 field_exper
