# Coursera Week 4 Course Project
# Getting and Cleaning Data

The code found in run_analysis.R goes through the following steps to generate two output files (tidy_data.txt and tidy_summary_data.txt):

1) Sets the working directory
2) Downloads the data file it it does not yet exist in the working directory
3) Unzip the data file
4) Read the data files into memory
5) Merge the training and test data tables
6) Determine which columns contain means or standard deviations
7) Filter the X and features tables to only contain the means and standard deviations
8) Assign column names to the tables
9) Replace the activity IDs with the activity names
10) Combine all of the columns into one table
11) Clean up the column names
12) Output the tidy data set into tidy_data.txt
13) Load the dplyr library
14) Group the final table by Subject ID and Activity, and generate the summary table
15) Output the summary table to tidy_summary_data.txt
