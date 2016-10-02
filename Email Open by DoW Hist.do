/*******************************************************************************
Title: Histogram of All Emails Opened by Day of Week
By: Phil Palanza
Date: 9/27/2016
Description: Creates a histogram of all emails opened on each day of the week.
*******************************************************************************/
set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

histogram dow_open, discrete percent fcolor(maroon) xtitle(Day of Week) title(Emails Opened by Day of Week) addlabels
	* Sunday = 5.6%
	* Monday = 14.1%
	* Tuesday = 18.5%
	* Wednesday = 14.4%
	* Thursay = 24.3%
	* Friday = 12.8%
	* Saturday = 10.3%
