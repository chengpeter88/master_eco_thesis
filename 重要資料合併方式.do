use cp2009.dta, clear
//gen year = 2009
save cp2009.dta, replace

use cp2013.dta, clear
//gen year = 2013
save cp2013.dta, replace

use cp2014.dta, clear
//gen year = 2014
save cp2014.dta, replace

use cp2019.dta, clear
//gen year = 2019
save cp2019.dta, replace


use master.dta, clear
append using cp2009.dta
append using cp2013.dta
append using cp2014.dta
append using cp2019.dta

