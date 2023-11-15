* 假設 uni_school_type 是 1-9，9 表示缺失值。
* 假設 grad_school_type 是 1-9，9 表示缺失值。

* 第一步：將大學水平教育複製到新變數。
gen highest_education = uni_school_type

* 第二步：在研究所水平教育較高的情況下更新 highest_education 變數。
replace highest_education = grad_school_type if grad_school_type < uni_school_type

* 為新變數分配標籤。
label values highest_education school_type
