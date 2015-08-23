# coursera-getting-and-cleaning-data-project

Getting and Cleaning Data - Project 1

This repo contains files for the Getting and Cleaning Data Coursera course. 

The R script, run_analysis.R, does the following:

Reads the datasets from the local directory
Load the activity and feature information
Loads both the training and test datasets
Extracts only those columns which reflect a mean or standard deviation
Loads the activity and subject data for each dataset, and merges those columns with the dataset
Merges the two datasets
Converts the activity and subject columns into factors
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy_data.txt.
