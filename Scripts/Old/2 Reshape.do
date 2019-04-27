***********
* Colin Mortimer
* Senior thesis
* 2 Reshape
***********

clear
drop _all

* Dynamically references project files.  
global dir `c(pwd)'
global scripts "$dir"
global input "$dir/../Input"
global output "$dir/../Output"
global temp "$dir/../Temp"



* End DO *
