***********
* Colin Mortimer
* Senior thesis
* 1 prepare election results
***********

* Import CSV
import delimited "$input/1976-2016-house.csv"

* Drop and sort
drop if year < 2006
sort year state district
rename candidate candidate_name
drop office state_cen state_ic stage special writein version

* Code DFL as Democratic
replace party = "democrat" if party == "democratic-farmer-labor"

* insert missing party observations
do "$scripts/1a missing party.do"

* Generate year state district identifier
tostring district, generate(district_str)
tostring year, generate(year_str)
gen year_state_dis = year_str + "_" + state + "_" + district_str
drop year_str

* Generate district identifier
rename district district_num
generate district = state_po + " - " + district_str
drop district_str

* Calculate Republican votes and merge
preserve
drop if party != "republican"
collapse (max) candidatevotes, by(year_state_dis)
rename candidatevotes republican_votes
saveold "$temp/republican_votes.dta", replace
restore
merge m:1 year_state_dis using "$temp/republican_votes.dta"
drop if party == "republican" & republican_votes != candidatevotes
drop _merge
drop if mi(republican_votes)

* Calculate Democrat vote share and merge
preserve
drop if party != "democrat"
collapse (max) candidatevotes, by(year_state_dis)
rename candidatevotes democrat_votes
saveold "$temp/democrat_votes.dta", replace
restore
merge m:1 year_state_dis using "$temp/democrat_votes.dta"
drop if party == "democrat" & democrat_votes != candidatevotes
drop _merge
drop if mi(democrat_votes)
gen democrat_share = democrat_votes/totalvotes

* Reduce dataset to districts with a Republican vs. Democrat
* Drop uncontested elections
drop if party != "democrat"

* Drop uneeded variables
drop candidate_name
drop party
drop candidatevotes
drop totalvotes
drop democrat_votes republican_votes


* Order variables
order year state state_po state_fips district_num district year_state_dis democrat_share 

saveold "$output/Master_cleaned.dta", replace

* End DO *
