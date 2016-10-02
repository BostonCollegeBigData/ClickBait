/*******************************************************************************
Title: Email Contacts by Campaign
By: Phil Palanza
Date: 9/27/2016
Description: Shows frequency and percent of email contacts by campaign.
*******************************************************************************/

set more off 
use "/Users/palanza/Documents/BC - Big Data Econometrics/Summary Data 5pct Sample.dta", clear
*run  "/Users/palanza/Documents/BC - Big Data Econometrics/Big Data Code Repository/ClickBait/Data Transformation.do"

tabulate campaign
*Note that this is cross-sectional, not time-series. 
