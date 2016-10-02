/*******************************************************************************
Title: Histogram of Solicitation Emails Sent By Day of Week
By: Phil Palanza
Date: 9/27/2016
Description: Creates a histogram of all annual campaign emails sent on each day 
			 of the week.
*******************************************************************************/

set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

* What Days are Annual Giving Solicitation emails going out? 
histogram dow if campaign=="Annual Giving Campaign", discrete percent ///
fcolor(maroon) xtitle(Day of Week) title(Solicitation Emails Sent by Day) ///
note(Note: Excludes 1863 Campaign) addlabels
