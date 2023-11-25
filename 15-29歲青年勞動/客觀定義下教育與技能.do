* 創建新變數 適度教育
//assume skill_level =2 需要該高中
gen obj_req = 0

replace obj_req = 1 if (skill_level == 1 & edu == 1) | ///
                 (skill_level == 2 & inlist(edu, 1, 2, 3)) | ///
                  (skill_level == 3 & edu == 4) | ///
                  (skill_level == 4 & inlist(edu, 4, 5))

label variable obj_req "客觀定義適度教育"
* 確保數據處理正確
tab obj_req

////////
gen obj_over = 0
replace obj_over = 1 if (skill_level == 1 & edu > 1) | ///
                 (skill_level == 2 & edu >= 3) | ///
                  (skill_level == 3 & edu >= 4)

label variable obj_over "客觀定義過度教育"

tab obj_over
////////

gen obj_und = 0

replace obj_und = 1 if (skill_level == 2 & edu < 2) | ///
                 (skill_level == 3 & edu < 3) | ///
                  (skill_level == 4 & edu < 4)
				   
label variable obj_und "客觀定義不足教育"
tab obj_und

order obj_req obj_over obj_und,before(mismatch)
