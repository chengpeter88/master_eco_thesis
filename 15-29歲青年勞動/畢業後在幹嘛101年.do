//forvalues i = 1/9 {
//    rename b6_`i' before_firstjob_`i'
//	}

* 創建新變數 before_firsjob
gen before_firsjob = .

* 合併變數並分類
foreach var in before_firstjob_1 before_firstjob_2 before_firstjob_3 before_firstjob_4 before_firstjob_5 before_firstjob_6 before_firstjob_7 before_firstjob_8 before_firstjob_9  {
    replace before_firsjob = 1 if `var' == 6 | `var' == 8
    replace before_firsjob = 2 if `var' == 1 | `var' == 5
    replace before_firsjob = 3 if `var' != 1 & `var' != 5 & `var' != 6 & `var' != 8
}

* 添加label
label define before_firsjob_label 1 "畢業前即找到工作(含在自家經營場所每週工作15 小時以上)" 2 "一直在找工作(含準備就業考試、職業訓練)" 3 "畢業後未立即找工作"
label values before_firsjob before_firsjob_label
