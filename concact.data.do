* 对于master.dta
clear
set obs 1
gen stud_id = .
save master.dta, replace



* 对于cp2009.dta
use cp2009.dta, clear
destring stud_id, replace
save cp2009.dta, replace

* 对于cp2013.dta
use cp2013.dta, clear
destring stud_id, replace
save cp2013.dta, replace

* 对于cp2014.dta
use cp2014.dta, clear
destring stud_id, replace
save cp2014.dta, replace

* 对于cp2019.dta
use cp2019.dta, clear
destring stud_id, replace
save cp2019.dta, replace



clear
use master.dta, clear

* 从cp2009.dta追加数据
append using cp2009.dta
save master.dta, replace

* 从cp2013.dta追加数据
append using cp2013.dta
save master.dta, replace

* 从cp2014.dta追加数据
append using cp2014.dta
save master.dta, replace

* 从cp2019.dta追加数据
append using cp2019.dta
save master.dta, replace




