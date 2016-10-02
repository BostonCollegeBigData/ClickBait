/*******************************************************************************
Title: Histogram of All Emails Clicked by Day of Week
By: Phil Palanza
Date: 9/27/2016
Description: Creates a histogram of all emails clicked on each day of the week.
*******************************************************************************/
set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

histogram dow_click, discrete percent fcolor(maroon) xtitle(Day of Week)///
 title(Emails Clicked by Day of Week) addlabels
 
	*Sunday = 9.05%
	*Monday = 18.9%
	*Tuesday = 15.1%
	*Wednesday = 14.1%
	*Thursday = 19.7%
	*Friday = 11.7%
	* Saturday = 11.5%
