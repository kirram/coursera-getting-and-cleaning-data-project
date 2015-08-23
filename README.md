# coursera-getting-and-cleaning-data-project

Getting and Cleaning Data - Project 1

This repo contains files for the Getting and Cleaning Data Coursera course. 

The R script, run_analysis.R, does the following:

1. Reads the datasets from the local directory
2. Load the activity and feature information
3. oads both the training and test datasets
4. Extracts only those columns which reflect a mean or standard deviation
5. Loads the activity and subject data for each dataset, and merges those columns with the dataset
6. Merges the two datasets
7. Converts the activity and subject columns into factors
8. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
9. The end result is shown in the file tidy_data.txt.
