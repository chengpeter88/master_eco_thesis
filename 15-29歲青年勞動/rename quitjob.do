forvalues i = 1/12 {
    rename p2_q7_2_`i' quitjob_`i'
}
forvalues i = 1/12 {
    order  quitjob_`i',before(industry)
}
