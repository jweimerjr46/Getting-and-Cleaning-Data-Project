# Getting and Cleaning Data Course Project


## Description

The purpose of the R script (run_analysis.R) is to create a tidy data set from multiple raw data sets. The raw data sets consist of accelerometer data from Samsung Galaxy S smartphones while subjects performed various activities. Complete variable descriptions can be found in the CodeBook.md file. 

## Data Source

The acclerometer data was obtained from:  

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 


A complete description of the datasets contained in the ZIP file can be found at: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


## R Script -- Creating Tidy Data Set

The file *run_analysis.R* creates a tidy data set by doing the following.

1. Merges the training and test sets from the train and test folders.
2. For each measurement extracts only the mean and standard deviation for each measurement.
3. Gives activities and variables descriptive names. Names were from *activity_labels.txt* and *features.txt* respectively.
4. From the created dataset, creates a tidy data set with the average of each variable for each activity and subject.


