// when_work_current
// exper_cur
//num. change
//replace  exper_cur=200 if exper_cur==2
//replace  exper_cur=300 if exper_cur==3
//replace  exper_cur=400 if exper_cur==4
//replace  exper_cur=500 if exper_cur==5
//replace  exper_cur=600 if exper_cur==6
// 7 遺漏 跳答 其他 拒答
//replace  exper_cur=7   if exper_cur==96 | exper_cur==97|exper_cur==98 |exper_cur==99

// 現在工作專換成label
//replace exper_cur=6 if  exper_cur==600
//replace exper_cur=5 if  exper_cur==500
//replace exper_cur=4 if  exper_cur==400
//replace exper_cur=3 if  exper_cur==300
//replace  exper_cur=2 if exper_cur==200
//tab exper_cur
