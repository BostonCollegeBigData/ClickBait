/*******************************************************************************
Title: Histogram of Solicitation Emails Clicked By Day of Week
By: Phil Palanza
Date: 9/27/2016
Description: Creates a histogram of all annual campaign emails clicked on each day 
			 of the week.
*******************************************************************************/

set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

*What Days are Annual Giving Solicitation Emails Clicked
histogram dow_click if campaign=="Annual Giving Campaign", discrete percent ///
fcolor(maroon) xtitle(Day of Week) title(Solicitation Emails Clicked by Day) ///
note(Note: Excludes 1863 Campaign) addlabels

