/*******************************************************************************
Title: Histogram of All Emails Sent by Day of Week
By: Phil Palanza
Date: 9/27/2016
Description: Creates histogram of emails sent on each day of the week. 
*******************************************************************************/
set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

histogram dow, discrete percent fcolor(maroon) xtitle(Day of Week) title(Emails Sent by Day of Week) addlabels
	* Sunday = 3.6%
	* Monday = 14.3%
	* Tuesday = 18%
	* Wednesday = 13.9%
	* Thursday = 25.7%
	* Friday = 14.1% 
	* Saturday = 9.8%
