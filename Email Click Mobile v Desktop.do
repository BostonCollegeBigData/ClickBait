/*******************************************************************************
Title: Email Clicked on Mobile or Desktop?
By: Phil Palanza
Date: 9/27/2016
Description: Shows the number and proportion of emails that were clicked on
				mobile versus desktop. 
*******************************************************************************/
set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

tabulate mobile click, cell
	*2.1% of all emails were “clicked”. Of those clicked:
		*1.16% were on desktop
		*.94%% were on mobile
		
tabulate mobile_click
tabulate desktop_click

