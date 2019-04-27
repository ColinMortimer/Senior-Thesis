***********
* Colin Mortimer
* Senior thesis
* 2 insurance rates merge
***********

* Generate geoid2 and year_dis for merge
tostring district_num, generate(district_str)
tostring state_fips, generate(fips_str)
generate geoid2 = ""
replace geoid2 = "0" + fips_str + "0" + district_str if strlen(district_str) == 1 & strlen(fips_str) == 1
replace geoid2 = fips_str + "0" + district_str if strlen(district_str) == 1 & strlen(fips_str) != 1
replace geoid2 = "0" + fips_str + district_str if strlen(district_str) != 1 & strlen(fips_str) == 1
replace geoid2 = fips_str + district_str if strlen(district_str) != 1 & strlen(fips_str) != 1
tostring year, replace
gen year_dis = geoid2 + year
saveold "$temp/For insurance rate merge.dta", replace

local year 2008

* Import 5-year ACS insurance rates
import delimited "$input/Ins_rates/`year'.csv", varnames(1) clear

* Generate year variable merge identifer
generate year = `year'
tostring year, replace
gen year_dis = geoid2 + year

* Drop uneeded geographical variables
drop geoid geodisplaylabel
drop year

* Drop margins of error
forvalues x = 1/9{
	drop hd02_vd0`x'
}
drop hd02_vd10

* Drop age brackets
forvalues x = 2 5 to 8 {
		drop hd01_vd0`x'
	}

* Drop uninsured
drop hd01_vd04
drop hd01_vd07
drop hd01_vd10

* Rename variables of interest
rename hd01_vd01 population

* Calculate insured
drop if _n == 1
destring hd*, replace
destring population, replace
egen insured = rowtotal(hd*)
drop hd*
gen pct_insured = insured/population

* Save
saveold "$temp/Insure merge/`year'.dta", replace

forvalues year = 2010 2012 to 2016{

	* Import 5-year ACS insurance rates
	import delimited "$input/Ins_rates/`year'.csv", varnames(1) clear

	* Generate year variable merge identifer
	generate year = `year'
	tostring year, replace
	gen year_dis = geoid2 + year

	* Drop uneeded geographical variables
	drop geoid geodisplaylabel
	drop year

	* Drop margins of error
	forvalues x = 1/9{
		drop hd02_vd0`x'
	}

	forvalues x = 10/57{
		drop hd02_vd`x'
	}

	* Drop population age and sex brackets
	drop hd01_vd02
	drop hd01_vd30

	forvalues x = 3 6 to 9 {
		drop hd01_vd0`x'
	}

	forvalues x = 12 15 to 27 {
		drop hd01_vd`x'
	}

	forvalues x = 31 34 to 57 {
		drop hd01_vd`x'
	}

	* Drop uninsured brackets
	forvalues x = 5 8 to 8 {
		drop hd01_vd0`x'
	}

	forvalues x = 11 14 to 29 {
		drop hd01_vd`x'
	}

	forvalues x = 33 36 to 57 {
		drop hd01_vd`x'
	}

	* Rename variables of interest
	rename hd01_vd01 population

	* Calculate insured
	drop if _n == 1
	destring hd*, replace
	destring population, replace
	egen insured = rowtotal(hd*)
	drop hd*
	gen pct_insured = insured/population

	* Save
	saveold "$temp/Insure merge/`year'.dta", replace
}

use "$temp/For insurance rate merge.dta", clear

forvalues year = 2008 2010 to 2016{
	merge m:1 year_dis using "$temp/Insure merge/`year'.dta", nogenerate update
}

saveold "$output/Master_no_covariates.dta", replace

* End DO *
