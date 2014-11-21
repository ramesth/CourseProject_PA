Getting and Cleaning data course project peerassignment
================

## Introduction

This project completed part of the Getting and Cleaning data course project peerassignment.

The following files are the part of this project.

1. README.MD               brief description and logic of the program
2. run_analysis.R          The single script file
3. Codebook.md             This file describes the data used in this project 

## Input

1. Raw files must downloaded from.
[data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. The Zip file needs to be unzipped in the "working directory" .

These are the input files for the program which will be inside "UCI HAR Dataset" folder.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## output file

finalDataSet.txt is dropped by the program in the current working directory. This is the  data set with the average of each variable for each activity and each subject.

## Implementation

1. As mentioned in the "input" section down load the zip file and extract the content in the current working directory. 
2. copy the run_analysis.R into the current directory
3. Execute script by running source("run_analysis.R")

## Code explanation

Here are the high level steps:


1. Extract the value with std() or mean() to get the required subset of features
2. Explicitly excludes variables like angle(tBodyAccJerkMean),gravityMean) etc.
3. Extract training and test features taking into account  subset of features index 
4. combine the training and test data rows into one. 
5. combine acitivity related training and test codes. 
6. Combine subject identity of test and train
7. Combin subject activities and total features into semi final dataset.
8. creates a second, independent tidy data set with the average of each variable 
