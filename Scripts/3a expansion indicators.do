***********
* Colin Mortimer
* Senior thesis
* 3a expansion indicators
***********

* Destring year so we can use it for operations
destring year, replace

* Generate DnD indicators
gen expansion = .
gen year_expand = .

* Alabama
replace expansion = 0 if state == "Alabama"
replace expansion = 0 if state == "Alabama"

* Alaska
replace expansion = 0 if year < 2015 & state == "Alaska"
replace expansion = 1 if year >= 2015 & state == "Alaska"
replace year_expand = 2015 if state == "Alaska"

* Arizona
replace expansion = 1 if state == "Arizona"
replace expansion = 0 if year < 2015 & state == "Arizona"
replace expansion = 1 if year >= 2015 & state == "Arizona"
replace year_expand = 2015 if state == "Arizona"

* Arkansas
replace expansion = 0 if year < 2014 & state == "Arkansas"
replace expansion = 1 if year >= 2014 & state == "Arkansas"
replace year_expand = 2014 if state == "Arkansas"

* California
replace expansion = 0 if year < 2010 & state == "California"
replace expansion = 1 if year >= 2010 & state == "California"
replace year_expand = 2010 if state == "California"

* Colorado
replace expansion = 0 if year < 2014 & state == "Colorado"
replace expansion = 1 if year >= 2014 & state == "Colorado"
replace year_expand = 2014 if state == "Colorado"

* Connecticut
replace expansion = 0 if year < 2010 & state == "Connecticut"
replace expansion = 1 if year >= 2010 & state == "Connecticut"
replace year_expand = 2010 if state == "Connecticut"

* Deleware
replace expansion = 0 if year < 2014 & state == "Delaware"
replace expansion = 1 if year >= 2014 & state == "Delaware"
replace year_expand = 2014 if state == "Delaware"

* Florida
replace expansion = 0 if state == "Florida"

* Georgia
replace expansion = 0 if state == "Georgia"

* Hawaii
replace expansion = 0 if year < 2014 & state == "Hawaii"
replace expansion = 1 if year >= 2014 & state == "Hawaii"
replace year_expand = 2014 if state == "Hawaii"

* Idaho
replace expansion = 0 if state == "Idaho"

* Illinois
replace expansion = 0 if year < 2014 & state == "Illinois"
replace expansion = 1 if year >= 2014 & state == "Illinois"
replace year_expand = 2014 if state == "Illinois"

* Indiana
replace expansion = 0 if year < 2015 & state == "Indiana"
replace expansion = 1 if year >= 2015 & state == "Indiana"
replace year_expand = 2015 if state == "Indiana"

* Iowa
replace expansion = 0 if year < 2014 & state == "Iowa"
replace expansion = 1 if year >= 2014 & state == "Iowa"
replace year_expand = 2014 if state == "Iowa"

* Kansas
replace expansion = 0 if state == "Kansas"

* Kentucky
replace expansion = 0 if year < 2015 & state == "Kentucky"
replace expansion = 1 if year >= 2015 & state == "Kentucky"
replace year_expand = 2015 if state == "Kentucky"

* Louisiana
replace expansion = 0 if year < 2016 & state == "Louisiana"
replace expansion = 1 if year >= 2016 & state == "Louisiana"
replace year_expand = 2016 if state == "Louisiana"

* Maine
replace expansion = 0 if state == "Maine"

* Maryland
replace expansion = 0 if year < 2014 & state == "Maryland"
replace expansion = 1 if year >= 2014 & state == "Maryland"
replace year_expand = 2014 if state == "Maryland"

* Massachusetts
replace expansion = 0 if year < 2014 & state == "Massachusetts"
replace expansion = 1 if year >= 2014 & state == "Massachusetts"
replace year_expand = 2014 if state == "Massachusetts"

* Michigan
replace expansion = 0 if year < 2014 & state == "Michigan"
replace expansion = 1 if year >= 2014 & state == "Michigan"
replace year_expand = 2014 if state == "Michigan"

* Minnesota
replace expansion = 0 if year < 2010 & state == "Minnesota"
replace expansion = 1 if year >= 2010 & state == "Minnesota"
replace year_expand = 2010 if state == "Minnesota"

* Mississippi
replace expansion = 0 if state == "Mississippi"

* Missouri
replace expansion = 0 if state == "Missouri"

* Montana
replace expansion = 0 if year < 2016 & state == "Montana"
replace expansion = 1 if year >= 2016 & state == "Montana"
replace year_expand = 2016 if state == "Montana"

* Nebraska
replace expansion = 0 if state == "Nebraska"

* Nevada
replace expansion = 0 if year < 2014 & state == "Nevada"
replace expansion = 1 if year >= 2014 & state == "Nevada"
replace year_expand = 2014 if state == "Nevada"

* New Hampshire
replace expansion = 0 if year < 2014 & state == "New Hampshire"
replace expansion = 1 if year >= 2014 & state == "New Hampshire"
replace year_expand = 2014 if state == "New Hampshire"

* New Jersey
replace expansion = 0 if year < 2014 & state == "New Jersey"
replace expansion = 1 if year >= 2014 & state == "New Jersey"
replace year_expand = 2014 if state == "New Jersey"

* New Mexico
replace expansion = 0 if year < 2014 & state == "New Mexico"
replace expansion = 1 if year >= 2014 & state == "New Mexico"
replace year_expand = 2014 if state == "New Mexico"

* New York
replace expansion = 0 if year < 2014 & state == "New York"
replace expansion = 1 if year >= 2014 & state == "New York"
replace year_expand = 2014 if state == "New York"

* North Carolina
replace expansion = 0 if state == "North Carolina"

* North Dakota
replace expansion = 0 if year < 2014 & state == "North Dakota"
replace expansion = 1 if year >= 2014 & state == "North Dakota"
replace year_expand = 2014 if state == "North Dakota"

* Ohio
replace expansion = 0 if year < 2014 & state == "Ohio"
replace expansion = 1 if year >= 2014 & state == "Ohio"
replace year_expand = 2014 if state == "Ohio"

* Oklahoma
replace expansion = 0 if state == "Oklahoma"

* Oregon
replace expansion = 0 if year < 2014 & state == "Oregon"
replace expansion = 1 if year >= 2014 & state == "Oregon"
replace year_expand = 2014 if state == "Oregon"

* Pennslyvania
replace expansion = 0 if year < 2015 & state == "Pennsylvania"
replace expansion = 1 if year >= 2015 & state == "Pennsylvania"
replace year_expand = 2015 if state == "Pennsylvania"

* Rhode Island
replace expansion = 0 if year < 2014 & state == "Rhode Island"
replace expansion = 1 if year >= 2014 & state == "Rhode Island"

* South Carolina
replace expansion = 0 if state == "South Carolina"

* South Dakota
replace expansion = 0 if state == "South Dakota"

* Tennessee
replace expansion = 0 if state == "Tennessee" 

* Texas
replace expansion = 0 if state == "Texas" 

* Utah
replace expansion = 0 if state == "Utah" 

* Vermont
replace expansion = 0 if year < 2014 & state == "Vermont"
replace expansion = 1 if year >= 2014 & state == "Vermont"
replace year_expand = 2014 if state == "Vermont"

* Virginia
replace expansion = 0 if state == "Virginia" 

* Washington
replace expansion = 0 if year < 2014 & state == "Washington"
replace expansion = 1 if year >= 2014 & state == "Washington"
replace year_expand = 2014 if state == "Washington"

* West Virginia
replace expansion = 0 if year < 2014 & state == "West Virginia"
replace expansion = 1 if year >= 2014 & state == "West Virginia"
replace year_expand = 2014 if state == "West Virginia"

* Wisconsin
replace expansion = 0 if year < 2010 & state == "Wisconsin"
replace expansion = 1 if year >= 2010 & state == "Wisconsin"
replace year_expand = 2010 if state == "Wisconsin"

* Wyoming
replace expansion = 0 if state == "Wyoming" 

* Indicate states that never expanded
preserve
collapse (mean) expansion, by(state)
gen ever_expanded = .
replace ever_expanded = 1 if expansion > 0
replace ever_expanded = 0 if expansion == 0
saveold "$temp/ever_expanded.dta", replace
restore
merge m:1 state using "$temp/ever_expanded.dta", keepusing(ever_expanded) nogen

* End DO *
