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

do "$scripts/1 Clean ANES Data.do"

* End DO *