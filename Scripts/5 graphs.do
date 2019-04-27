***********
* Colin Mortimer
* Senior thesis
* 5 Graphs
***********

* Democratic share of the vote by year
preserve
collapse (mean) democrat_share, by(year)
graph twoway line democrat_share year, ytitle("Democratic share of the vote (mean)") title("Democratic share by year (mean)")
graph export "$output/Figures/1.png", replace
restore

* Racial makeup
preserve 
collapse (mean) white black indian asian pacific other multi hispanic, by(year)
graph twoway line white black indian asian pacific other multi hispanic year, ytitle("Percent of population") title("Racial makeup of the country by election year") 
graph export "$output/Figures/2.png", replace
restore


* End DO *