//forvalues i = 1/14 {
//    rename b7_2_`i' quitjob_`i'
//}


* 創建新變數 before_firsjob
gen before_firsjob = .

* 合併變數並分類
foreach var in before_firstjob_1 before_firstjob_2 before_firstjob_3 before_firstjob_4 before_firstjob_5 before_firstjob_6 before_firstjob_7 before_firstjob_8 before_firstjob_9 before_firstjob_10 {
    replace before_firsjob = 1 if `var' == 1 | `var' == 7
    replace before_firsjob = 2 if `var' == 2 | `var' == 6
    replace before_firsjob = 3 if `var' >= 3 & `var' <= 5 | `var' >= 8 & `var' <= 10
}

* 添加label
label define before_firsjob_label 1 "畢業前即找到工作(含在自家經營場所每週工作15 小時以上)" 2 "一直在找工作(含準備就業考試、職業訓練)" 3 "畢業後未立即找工作"
label values before_firsjob before_firsjob_label
label variable before_firsjob "第一份工作前的待業期間，主要的活動有哪些"
order before_firsjob ,before(firstjob_own_hire)
