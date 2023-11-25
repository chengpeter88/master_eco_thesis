gen sub_req = 0

replace  sub_req=1 if  mismatch == 3
label variable sub_req "主觀定義適度教育"


gen sub_over = 0
replace  sub_over=1 if  mismatch == 4 | mismatch == 5
label variable sub_over "主觀定過度教育"


gen sub_und = 0
replace  sub_und=1 if  mismatch == 1 | mismatch == 2
label variable sub_und "主觀定義不足教育"


order sub_req sub_over sub_und, before(mismatch)
