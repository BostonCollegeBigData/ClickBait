
/*******************************************************************************
Title: Week 10 Master Code
By: Phil Palanza
Date: 11/1/2016
*******************************************************************************/


********
* SETUP*
********
set maxvar 30000
set more off
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear


***rename mill_id as constituent_id so they can be merged 
rename mill_id constituent_id

***merge the two datasets 
merge m:1 constituent_id using "/Users/palanza/Documents/BC - Big Data Econometrics/WORK_WCAS_DATA_CLASS.dta" ///

tabulate _merge
	*Master only (1) - 19.09%
	*Using only (2) - 7.73%
	*Matched (3) 0 - 73.18%
	
*save new dataset
export delimited using "/Users/palanza/Documents/BC - Big Data Econometrics/5pct Summary & Demographics no trim.csv", replace


*************************************
* Variable Generation/Transformation*
*************************************

**** Dummy Variable for Donate
gen donate = 0
replace donate = 1 if lifetime_cash > 0
label var donate "Donation Y/N"


**** Dummy Variable for FY15 Donations
gen fy15donate = 0
replace fy15donate = 1 if fy15_cash > 0
replace fy15donate = . if missing(fy15_cash)
label var fy15donate "Donation FY15 Y/N"

**** Dummy Variable for FY16 Donations
gen fy16donate = 0 
replace fy16donate = 1 if fy16_cash > 0
replace fy16donate = . if missing(fy16_cash)
label var fy16donate "Donation FY16 Y/N"


**** Encode String Year Variables
encode gas_year, generate (gasyear)
encode parent_year, generate (parentyear)


**** Change Email Preference String Dummies to Numeric Dummies
tabulate no_affinity_email, generate(dum)
drop dum1
drop no_affinity_email
rename dum2 no_affinity_email
label var no_affinity_email "Opt Out Affinity-Email"

tabulate no_blast_email, generate(dum)
drop dum1
drop no_blast_email 
rename dum2 no_blast_email 
label var no_blast_email "Opt Out Blast Email"

tabulate no_chapter_email, generate(dum)
drop dum1
drop no_chapter_email 
rename dum2 no_chapter_email 
label var no_chapter_email "Opt Out Chapter Email"

tabulate no_donor_email, generate(dum)
drop dum1
drop no_donor_email 
rename dum2 no_donor_email 
label var no_donor_email "Opt Out Donor Email"

tabulate no_evt_week_email, generate(dum)
drop dum1
drop no_evt_week_email
rename dum2 no_evt_week_email
label var no_evt_week_email "Opt Out Event Week Email"

tabulate no_general_email, generate(dum)
drop dum1
drop no_general_email 
rename dum2 no_general_email 
label var no_general_email "Opt Out General Email"

tabulate no_school_email, generate(dum)
drop dum1
drop no_school_email 
rename dum2 no_school_email 
label var no_school_email "Opt Out School Email"

tabulate no_solic_email, generate(dum)
drop dum1
drop no_solic_email 
rename dum2 no_solic_email 
label var no_solic_email "Opt Out Solicit Email"

tabulate no_spirit_email, generate(dum)
drop dum1*
drop no_spirit_email  
rename dum2 no_spirit_email  
label var no_spirit_email  "Opt Out Spirit Email"

tabulate no_survey_email, generate(dum)
drop dum1
drop no_survey_email 
rename dum2 no_survey_email   
label var no_survey_email "Opt Out Survey Email"

tabulate is_deceased, generate(dum)
drop dum1
drop is_deceased
rename dum2 is_deceased   
label var is_deceased "Is Deceased"

*** Generate Dummies for Undergrad schools

*tab ugrad_school
gen uCSOM = 0 
replace uCSOM = 1 if ugrad_school=="CSOM"
replace uCSOM = . if missing(ugrad_school)

gen uCSON = 0
replace uCSON = 1 if ugrad_school=="CSON"
replace uCSON = . if missing(ugrad_school)

gen uLSOE = 0 
replace uLSOE = 1 if ugrad_school=="LSOE"
replace uLSOE = . if missing(ugrad_school)

gen uMCAS = 0 
replace uMCAS = 1 if ugrad_school=="MCAS"
replace uMCAS = . if missing(ugrad_school)

gen uNC = 0
replace uNC = 1 if ugrad_school=="NC"
replace uNC = . if missing(ugrad_school)

gen uWCAS = 0 
replace uWCAS = 1 if ugrad_school=="WCAS"
replace uWCAS = . if missing(ugrad_school)

*Generate a Mobile Open Variable
gen mobile_open=0
replace mobile_open=1 if email_open==1 & mobile==1
replace mobile_open= . if missing(email_open)
replace mobile_open= . if missing(mobile)

*Generate a Desktop Open Variable
gen desktop_open=0
replace desktop_open = 1 if email_open==1 & desktop==1
replace desktop_open = . if missing(email_open)
replace desktop_open = . if missing(desktop)

*Generate a Mobile Click Variable
gen mobile_click=0
replace mobile_click = 1 if click==1 & mobile==1
replace mobile_click = . if missing(click)
replace mobile_click = . if missing(mobile)

*Generate a Desktop Click Variable
gen desktop_click=0
replace desktop_click = 1 if click==1 & desktop==1
replace desktop_click = . if missing(click)
replace desktop_click = . if missing(desktop)



***** Sent Date *****
*Edit Sent date
gen newdate = substr(date_sent,1,10)

*destring the sent date 
generate newdate2 = date(newdate, "MDY")
format newdate2 %td

*generate the day of the week 
gen dow = dow(newdate2)

*change order
order newdate2
order dow


****** Open Date ******
*Edit Open Date
gen new_open = substr(open_date,1,10)

*destring open date
generate opendate2 = date(new_open, "MDY")
format opendate2 %td
gen dow_open = dow(opendate2)

*change order 
order opendate2
order dow_open 


****** Click Date ******
*Edit Click Date
gen new_click = substr(click_date,1,10)

*Destring Click Date
gen clickdate = date(new_click, "MDY")
format clickdate %td

*Generate Click Day of Week
gen dow_click = dow(clickdate)

*change order
order clickdate
order dow_click


/*re-lable date variables
#delimit ;
label define dow
0 "Sunday"
1 "Monday"
2 "Tuesday"
3 "Wednesday"
4 "Thursday" 
5 "Friday"
6 "Saturday"
7 "Sunday" ;
#delimit cr  */


/*** Drop top 5% of donors 
sum fy16_cash, detail
sum fy15_cash, detail
	*We decided to drop the top 5% of observations.
	*In FY16 the 95th percentile donation was $750, in FY15 it was $645

	
drop if fy16_cash>750
	*Dropped 269,473
drop if fy15_cash>645
	*Dropped 10,102

sum lifetime_cash
	*new mean is $1786
*/


*Save
export delimited using "/Users/palanza/Documents/BC - Big Data Econometrics/5pct Summary & Demographics trimmed.csv", replace

* Focus on Annual Giving Campaign only
keep if campaign == "Annual Giving Campaign" 

