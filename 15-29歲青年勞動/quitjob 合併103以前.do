* 初始化新變數
//103年度
gen personal_factor = 0
gen company_factor = 0
gen exam_factor= 0
gen others_factor = 0

* 循環處理每個 quitjob 變數
foreach i of numlist 1/10 {
    * 個人因素
    replace personal_factor = 1 if inlist(quitjob_`i', 1, 3, 5, 6, 8, 9, 11)

    * 公司因素
    replace company_factor = 1 if inlist(quitjob_`i', 2, 4, 7, 10, 12)

    * 升學考試
    replace exam_factor = 1 if inlist(quitjob_`i', 13)

    * 其他
    replace others_factor = 1 if quitjob_`i' == 14
}

* 查看新變數
list personal_factor company_factor exam_factor others_factor in 1/100

label variable personal_factor "離開第一份工作：個人因素"
label variable company_factor "離開第一份工作：公司因素"
label variable exam_factor "離開第一份工作：考試因素"
label variable others_factor "離開第一份工作：其他因素"

order personal_factor company_factor exam_factor others_factor, before(quitjob_1)
