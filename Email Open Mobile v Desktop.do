/*******************************************************************************
Title: Email Open on Mobile or Desktop?
By: Phil Palanza
Date: 9/27/2016
Description: Shows the number and proportion of emails opened on desktop vs. mobile.
*******************************************************************************/
set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

tabulate email_open mobile, cell
	*74.53 % of emails went unopened. The remaining 25.7% breaks out as: 
	*13.49 were opened only on mobile 
	*11.99% were opened only on desktop

tabulate mobile_open
tabulate desktop_open


