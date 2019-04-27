***********
* Colin Mortimer
* 0 Master
***********

clear
drop _all

* Change to scripts folder path
cd "/Users/colinmortimer/Documents/Eighth Semester/Honors Thesis/Scripts/"

* Dynamically references project files.  
global dir `c(pwd)'
global scripts "$dir"
global input "$dir/../Input"
global output "$dir/../Output"
global temp "$dir/../Temp"

do "$scripts/1 prepare election results.do"
do "$scripts/2 insurance rates merge.do"
do "$scripts/3 electoral covariates.do"
do "$scripts/4 regression.do"
do "$scripts/5 graphs.do"

saveold "$output/Master.dta", replace

* End DO *
