***********
* Colin Mortimer
* Senior thesis
* 1a missing party
***********

replace party = "republican" if candidate_name == "Tim Huelskamp"
replace party = "republican" if candidate_name == "Thomas G. Tancredo"
replace party = "republican" if candidate_name == "Lynn Jenkins"
replace party = "libertarian" if candidate_name == "Dennis Hawver"
replace party = "democrat" if candidate_name == "Tobias Schlingensiepen"
replace party = "republican" if candidate_name == "Kevin Yoder"
replace party = "libertarian" if candidate_name == "Joel Balam"
replace party = "democrat" if candidate_name == "Robert Leon Tillman"
replace party = "republican" if candidate_name == "Mike Pompeo"
replace party = "libertarian" if candidate_name == "Thomas Jefferson"
replace party = "indepedent" if candidate_name == "David ??Turk?? Turknett"
replace party = "indepedent" if candidate_name == "Arden Wells"
replace party = "republican" if candidate_name == "Gary King"
replace party = "democrat" if candidate_name == "Bennie G. Thompson"
replace party = "republican" if candidate_name == "Liz Cheney"

* drop candidate_name

* End DO *
