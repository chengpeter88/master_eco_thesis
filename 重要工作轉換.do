drop transfer_job
generate transfer_job = .   // initialize the new variable with missing values
replace transfer_job = 1 if when_first_job == when_work_current // assign 1 if the values are the same
replace transfer_job = 0 if when_first_job != when_work_current // assign 0 if the values are different
