***********
* Colin Mortimer
* Senior thesis
* 3 electoral covariates
***********

tostring district_num, generate(district_str)
tostring state_fips, generate(fips_str)
generate geoid2 = ""
replace geoid2 = "0" + fips_str + "0" + district_str if strlen(district_str) == 1 & strlen(fips_str) == 1
replace geoid2 = fips_str + "0" + district_str if strlen(district_str) == 1 & strlen(fips_str) != 1
replace geoid2 = "0" + fips_str + district_str if strlen(district_str) != 1 & strlen(fips_str) == 1
replace geoid2 = fips_str + district_str if strlen(district_str) != 1 & strlen(fips_str) != 1
tostring year, replace
gen year_dis = geoid2 + year

* Income data merge
preserve

forvalues year = 2006(2)2008{
	import delimited "$input/Income/`year'.csv", varnames(1) clear 
	drop if _n == 1
	gen year = "`year'"
	gen year_dis = geoid2 + year
	rename hc01_est_vc13 income
	destring income, replace
	saveold "$temp/income/`year'", replace
}

forvalues year = 2010(2)2016 {
	import delimited "$input/Income/`year'.csv", varnames(1) clear 
	drop if _n == 1
	gen year = "`year'"
	gen year_dis = geoid2 + year
	rename hc01_est_vc15 income
	destring income, replace
	saveold "$temp/income/`year'", replace
}

restore

forvalues year = 2006(2)2016 {
	merge m:1 year_dis using "$temp/income/`year'", nogenerate update keepusing(income)
}

********** Race Variable **********
preserve
forvalues year = 2006(2)2016 {

	import delimited "$input/Covariates/`year'/Race.csv", varnames(1) clear

	* Generate year variable merge identifer
	generate year = `year'
	tostring year, replace
	gen year_dis = geoid2 + year

	* Drop uneeded geographical variables
	drop geoid geodisplaylabel geoid2
	drop year
	drop if _n == 1

	* Drop margins of error
	forvalues x = 1/9 {
		drop hd02_vd0`x'
	}
	forvalues x = 10/21 {
		drop hd02_vd`x'
	}

	* Destring
	destring hd01_vd01 hd01_vd02 hd01_vd03 hd01_vd04 hd01_vd05 hd01_vd06 hd01_vd07 hd01_vd08 hd01_vd09 hd01_vd10 hd01_vd11 hd01_vd12, replace

	* Caculate race ratios
	gen white = hd01_vd03/hd01_vd01
	gen black = hd01_vd04/hd01_vd01
	gen indian = hd01_vd05/hd01_vd01
	gen asian = hd01_vd06/hd01_vd01
	gen pacific = hd01_vd07/hd01_vd01
	gen other = hd01_vd08/hd01_vd01
	gen multi = (hd01_vd09 + hd01_vd10 + hd01_vd11)/hd01_vd01
	gen hispanic = hd01_vd12/hd01_vd01

	* Drop uneeded observation and variables
	drop hd*

	saveold "$temp/Race/`year'.dta", replace
}
restore

forvalues year = 2006(2)2016{
	merge m:1 year_dis using "$temp/Race/`year'.dta", nogenerate update
}
********** End Race Variable **********

********** Age/Gender Variable **********
preserve
forvalues year = 2006(2)2016 {

	import delimited "$input/Covariates/`year'/Age_sex.csv", varnames(1) clear

	* Generate year variable merge identifer
	generate year = `year'
	tostring year, replace
	gen year_dis = geoid2 + year

	* Drop uneeded geographical variables
	drop geoid geodisplaylabel
	drop year
	drop if _n == 1

	* Generate, keep and rename variables of interest
	keep hc01_est_vc35 hc03_est_vc01 hc02_est_vc01 hc01_est_vc01 year_dis
	destring hc01_est_vc35 hc03_est_vc01 hc02_est_vc01 hc01_est_vc01, replace
	rename hc01_est_vc35 median_age
	gen female_ratio = hc03_est_vc01/hc01_est_vc01
	drop hc*

	saveold "$temp/Age_sex/`year'.dta", replace
}
restore

forvalues year = 2006(2)2016{
	merge m:1 year_dis using "$temp/Age_sex/`year'.dta", nogenerate update
}
********** End Age/Gender Variable **********

********** Marital Variable **********
preserve
forvalues year = 2006(2)2016 {

	import delimited "$input/Covariates/`year'/Marital.csv", varnames(1) clear

	* Generate year variable merge identifer
	generate year = `year'
	tostring year, replace
	gen year_dis = geoid2 + year

	* Drop uneeded geographical variables
	drop geoid geodisplaylabel
	drop year
	drop if _n == 1

	* Keep and rename marital variables
	keep year_dis hc02_est_vc01 hc03_est_vc01 hc04_est_vc01 hc05_est_vc01 hc06_est_vc01
	destring hc02_est_vc01 hc03_est_vc01 hc04_est_vc01 hc05_est_vc01 hc06_est_vc01, replace
	rename hc02_est_vc01 married
	rename hc03_est_vc01 widow
	rename hc04_est_vc01 divorce
	rename hc05_est_vc01 seperated
	rename hc06_est_vc01 never 

	saveold "$temp/Marital/`year'.dta", replace
}
restore

forvalues year = 2006(2)2016{
	merge m:1 year_dis using "$temp/Marital/`year'.dta", nogenerate update
}
********** End Marital Variable **********

********** Employ Variable **********
preserve
forvalues year = 2006(2)2016 {

	import delimited "$input/Covariates/`year'/Employ.csv", varnames(1) clear

	* Generate year variable merge identifer
	generate year = `year'
	tostring year, replace
	gen year_dis = geoid2 + year

	* Drop uneeded geographical variables
	drop geoid geodisplaylabel
	drop year
	drop if _n == 1

	* Keep and rename variables of interest
	keep year_dis hc04_est_vc01
	rename hc04_est_vc01 unemploy
	destring unemploy, replace

	saveold "$temp/Employ/`year'.dta", replace
}
restore

forvalues year = 2006(2)2016{
	merge m:1 year_dis using "$temp/Employ/`year'.dta", nogenerate update
}
********** End Employ Variable **********

* Add in expasion indicators and interaction
do "$scripts/3a expansion indicators.do"

* Identify general and midterm elections
destring year, replace
gen gen_election = .
replace gen_election = 0 if year == 2006
replace gen_election = 1 if year == 2008
replace gen_election = 0 if year == 2010
replace gen_election = 1 if year == 2012
replace gen_election = 0 if year == 2014
replace gen_election = 1 if year == 2016

* Fixed effects
tab state, gen(state_fe)
tab year, gen(year_fe)
gen state_dist = state_po + district_str
tab state_dist, gen(state_dist_fe)

* Linear trends
forvalues x = 1/50{
	gen lin_trends`x' = state_fe`x' * (2012 - year)
}

* Sort
gsort state year district 

* Clean
drop state_fips district_num year_state_dis district
* drop geoid2 year_dis
drop if mi(year)

saveold "Master.dta", replace

* End DO *
