***********
* Colin Mortimer
* Senior thesis
* 2 electoral covariates
***********

* Identify general and midterm electionss
gen gen_election = .
replace gen_election = 1 if mod(year,4) == 0
replace gen_election = 0 if mod(year,4) == 2

gen mid_election = .
replace mid_election = 1 if mod(year,4) == 2
replace mid_election = 0 if mod(year,4) == 0


* End DO *
