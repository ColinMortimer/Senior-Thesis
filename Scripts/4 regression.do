***********
* Colin Mortimer
* Senior thesis
* 4 regression
***********

local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy

* Specification 1
* Fixed effects regression w/ no covariates
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)

* Specification 2
* Fixed effects regression w/ covariates
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)

* Specification 3
* Fixed effects regression w/ covariates and linear trends
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)

* Specification 4
* Fixed effects regression w/ covariates and linear trends
* Income < 25%
preserve
sum income, detail
drop if income < r(p25)
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 5
* Fixed effects regression w/ covariates and linear trends
* Income < 10%
preserve
sum income, detail
drop if income < r(p10)
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 6
* Fixed effects regression w/ covariates and linear trends
* Majority minority
preserve
drop if white >= .5
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 7
* Fixed effects regression w/ covariates and linear trends
* Majority hispanic
preserve
drop if hispanic < .5
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 8
* Fixed effects regression w/ covariates and linear trends
* Majority black
preserve
drop if black < .5
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 9
* Fixed effects regression w/ covariates and linear trends
* South
preserve
keep if state == "Maryland" | state == "West Virginia" | state == "Kentucky" | state == "Virginia" | state == "Tennessee" | state == "Delaware" | state == "Florida" | state == "Georgia" | state == "North Carolina" | state == "South Carolina" | state == "Alabama" | state == "Mississippi" | state == "Arkansas" | state == "Louisiana" | state == "Oklahoma" | state == "Texas" 
drop state_fe*
drop lin_trends*
tab state, gen(state_fe)
forvalues x = 1/16{
	gen lin_trends`x' = state_fe`x' * (2012 - year)
}
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 10
* Fixed effects regression w/ covariates and linear trends
* Northeast
preserve
keep if state == "Maine" | state == "New Hampshire" | state == "Vermont" | state == "Massachusetts" | state == "Rhode Island" | state == "Connecticut" | state == "Pennsylvania" | state == "New Jersey" | state == "New York"
drop state_fe*
drop lin_trends*
tab state, gen(state_fe)
forvalues x = 1/9{
	gen lin_trends`x' = state_fe`x' * (2012 - year)
}
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 11
* Fixed effects regression w/ covariates and linear trends
* Midwest
preserve
keep if state == "Ohio" | state == "Indiana" | state == "Michigan" | state == "Wisconsin" | state == "Illinois" | state == "Iowa" | state == "Kansas" | state == "Minnesota" | state == "Missouri" | state == "Nebraska" | state == "North Dakota" | state == "South Dakota" 
drop state_fe*
drop lin_trends*
tab state, gen(state_fe)
forvalues x = 1/12{
	gen lin_trends`x' = state_fe`x' * (2012 - year)
}
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* Specification 12
* Fixed effects regression w/ covariates and linear trends
* West
preserve
keep if state == "Arizona" | state == "Colorado" | state == "Idaho" | state == "Montana" | state == "Nevada" | state == "New Mexico" | state == "Utah" | state == "Wyoming" | state == "Alaska" | state == "California" | state == "Hawaii" | state == "Oregon" | state == "Washington"
drop state_fe*
drop lin_trends*
tab state, gen(state_fe)
forvalues x = 1/13{
	gen lin_trends`x' = state_fe`x' * (2012 - year)
}
regress democrat_share expansion state_fe* year_fe*, vce(cluster state)
local covariates income white hispanic black indian asian pacific other multi median_age female_ratio married widow divorce seperated never unemploy
regress democrat_share expansion gen_election `covariates' state_fe* year_fe*, vce(cluster state)
regress democrat_share expansion gen_election `covariates' lin_trends* state_fe* year_fe*, vce(cluster state)
restore

* End DO *

*********
* Notes
*********

* Table of regression results
* Specification checks (drop outliers)
* Test heterogeneity, only democratic/republican states, high minority districts, geographic
