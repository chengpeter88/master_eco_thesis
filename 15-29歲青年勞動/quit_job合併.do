* 初始化新變數
gen personal_factor = 0
gen company_factor = 0
gen study_exam = 0
gen others = 0

* 循環處理每個 quitjob 變數
foreach i of numlist 1/12 {
    * 個人因素
    replace personal_factor = 1 if inlist(quitjob_`i', 1, 3, 5, 6, 8, 9, 11)

    * 公司因素
    replace company_factor = 1 if inlist(quitjob_`i', 2, 4, 7, 10, 12)

    * 升學考試
    replace study_exam = 1 if inlist(quitjob_`i', 13, 14)

    * 其他
    replace others = 1 if quitjob_`i' == 15
}

* 查看新變數
list personal_factor company_factor study_exam others in 1/100
