# Coursera Week 4 Course Project
# Getting and Cleaning Data

The code found in run_analysis.R goes through the following steps to generate two output files (tidy_data.txt and tidy_summary_data.txt):

- Sets the working directory
- Downloads the data file it it does not yet exist in the working directory
- Unzip the data file
- Read the data files into memory
- Merge the training and test data tables
- Determine which columns contain means or standard deviations
- Filter the X and features tables to only contain the means and standard deviations
- Assign column names to the tables
- Replace the activity IDs with the activity names
- Combine all of the columns into one table
- Clean up the column names
- Output the tidy data set into tidy_data.txt
- Load the dplyr library
- Group the final table by Subject ID and Activity, and generate the summary table
- Output the summary table to tidy_summary_data.txt
