***********
* Colin Mortimer
* Senior Thesis
* 1 Clean ANES Data DO file
***********

clear
drop _all

* Dynamically references project files.  
global dir `c(pwd)'
global scripts "$dir"
global input "$dir/../Input"
global output "$dir/../Output"
global temp "$dir/../Temp"

use "$input/anes_timeseries_cdf.dta", clear

* run script to keep and rename variables of interest
do "$scripts/1a Keep and rename.do"

* End DO *
