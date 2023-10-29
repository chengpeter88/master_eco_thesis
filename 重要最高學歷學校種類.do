* 根据您的标签定义创建新的变量
gen highest_edu = .

* 如果研究所学校种类有效，则设置 highest_edu 为 school_g 的值
replace highest_edu = school_g if school_g >=1 & school_g <=7 

* 如果 highest_edu 仍然是遗漏且大学学校种类有效，则设置 highest_edu 为 school 的值
replace highest_edu = school if highest_edu == . & school >=1 & school <=7 

* 应用您提供的标签定义
label define highest_edu_label 1 "國立大學" ///
2 "私立大學"  ///
3 "國立科大" ///
4 "私立科大" ///
5 "專科、技術學院" ///
6 "學院" ///
7 "國外大學、其他" ///
8 "遺漏值、不清楚、拒答" ///
9 "跳答"

label values highest_edu highest_edu_label
