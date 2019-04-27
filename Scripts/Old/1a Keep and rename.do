***********
* Colin Mortimer
* Senior Thesis
* 1a Keep and rename DO file
***********

* Year 
rename VCF0004 year
local keep_vars year

* Weights
local keep_vars `keep_vars' VCF0009x VCF0010x VCF0011x VCF0009y VCF0010y VCF0011y VCF0009z VCF0010z VCF0011z

* Age
rename VCF0101 age
local keep_vars `keep_vars' age

* Gender
rename VCF0104 gender
local keep_vars `keep_vars' gender

* Race
rename VCF0106 race
local keep_vars `keep_vars' race

* Hispanic
rename VCF0108 hispanic
local keep_vars `keep_vars' hispanic

* Education
rename VCF0110 education
local keep_vars `keep_vars' education

* Density
rename VCF0111 density
local keep_vars `keep_vars' density

* Income
rename VCF0114 income
local keep_vars `keep_vars' income

* Work status
rename VCF0116 employ
local keep_vars `keep_vars' employ

* Union membership
rename VCF0127 union
local keep_vars `keep_vars' union

* Religion
rename VCF0128 religion
local keep_vars `keep_vars' religion

* Church attendance
rename VCF0130 attendance
local keep_vars `keep_vars' attendance

* Children
rename VCF0138 children
local keep_vars `keep_vars' children

* Parents immigrants
rename VCF0143 parent_immigrant
local keep_vars `keep_vars' parent_immigrant

* Marital status
rename VCF0147 marital
local keep_vars `keep_vars' marital

* Class
rename VCF0148 class
local keep_vars `keep_vars' class

* Party lean
rename VCF0301 party_lean
local keep_vars `keep_vars' party_lean

* Government assisted healthcare
rename VCF0805 govt_healthcare
local keep_vars `keep_vars' govt_healthcare

* Government health insurance
rename VCF0806 govt_insurance
local keep_vars `keep_vars' govt_insurance

* Delay medical care
rename VCF0873 delay_care
local keep_vars `keep_vars' delay_care

* Rep party
rename VCF1004 rep_party
local keep_vars `keep_vars' rep_party

* Gov't health insurance scale
rename VCF9077 govt_insurance_scale
local keep_vars `keep_vars' govt_insurance_scale

keep `keep_vars'

* End DO *