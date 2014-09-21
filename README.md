GetCleanData
============
---
title:  "Read ME"
author: "Gek Paard"
date:   "Wednesday, September 17, 2014"
output: html_document
---

This repository contains the script run_analysis and a code book
# Description of run_analysis.R
## Origin of the data sets 

The datasets used are from: 
 Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra 
 and Jorge L. Reyes-Ortiz.  Human Activity Recognition on Smartphones using
 a Multiclass Hardware-Friendly Support Vector Machine. 
 International Workshop of Ambient Assisted Living (IWAAL 2012). 
 Vitoria-Gasteiz, Spain. Dec 2012

 This dataset is distributed AS-IS and no responsibility implied or
 explicit can be addressed  to the authors or their institutions for its
 use or misuse. Any commercial use is prohibited.

## Preparation of files needed for the script

 The dataset are extracted in a zipfile 
 (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  and are unzipped with winrar in the work space.
 The following data sets are used:
  - 'test/X_test.txt'        : Test set, contains the observations, 
     2947 rows, 561 columns.
  - 'train/X_train.txt'      : Training set, contains the observations,
     7352 rows, 561 columns.
  - 'test/subject_test.txt'  : Test subject, contains depersonalized
    identifications of the subject, 2947 rows, 1 column.
  - 'train/subject_train.txt': Train subjects, contains depersonalized
    identifications of the subject, 7352 rows, 1 column.
  - 'test/y_test.txt'        : Test actions, contains the codes of the
    action the subject performed, 2947 rows, 1 column.
  - 'train/y_train.txt'      : Train actions, contains the code of the
    action the subject performed, 7352 rows, 1 column..
  - 'features.txt'           : Column labels, contains the column names of
     X_test.txt and X_train.txt, 561 rows, 2 columns. 
  - 'activity_labels.txt'    : Activity labels, contains the translation of
     the codes used in y_test.txt and y_train.txt, 6 rows, 2 columns.

## How the script works
 
First connect to the workspace
### step 1 : Merges the training and test sets to create one data set
 Get the Test set 
 Get the Train set 
 Concatenate the two data frames (totalTable)
 

### step 2 : Extracts only the measurements on the mean and standard deviation for each measurement

 (Select the columns with refer to measurements on mean and standard
 deviations.  The documentation about the datasets states that column names
 with "mean()", "meanFreq() and "std()"  in it refer to the mean and
 standard deviation of the observations. There are also column names
 "gravityMean", "~JerkMean" etc. These columns should not be included in
 the result.  The names are in features.txt labels.)

 Read the "features.txt" into a dataframe namesTable
 put the column names into namesVector
 Search for the strings mentionned above and extract the row number
 These numbers are concatenated after the character "V". 
 (Columns in the concatenated dataset totalTable are named "V" 
 followed by row number)
 The result of this search are 
 Select the columns in totalTable with the now created column names and 
 put them in a data frame called selectedTable
 This selectedTable contains now only the measurements of means and
 standard deviation 

### step 3 : Uses descriptive activity names to name the activities in the data set

 The activity codes are y_test.txt and y_train.txt, the descriptive labels
 are in activity_labels.txt.
 read the y_test set
 read the y_train set
 concatenate the two data frames (totalActivity)
 give the column of totalActivity a descriptive name (activity_Name)
 read activity_labels
 change the code in the row into the corresponding descriptive label of
 activity_labels
 
### step 4 : appropiately labels the data set with descriptive variable names

 the original column names are in namesVector (see step 2)
 colNumbers contain the the column numbers 
 select with that the current column names
 first remove the mistake in the column name (BodyBody) 
 changed these column names in (hopefully) human readable names
 replace the old column names with the changed colum names

### step 5 : Creates a second, independent tidy dataset with the average of each activity and each subject

 select columns with mean (= "mean", "average") from the data set of step 4
 get the test and train subjects and concatenate them in the same order 
 as the observations
 label it with clarifying variable name
 rbind the three data frames, subject, act  into one data frame
 create a data frame with the means of all activities (with plyr)
 write this data frame to a txt file



