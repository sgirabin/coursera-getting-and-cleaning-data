Course Project: Getting and Cleaning Data
=========================================

This repository contains my work for the course project "Getting and Cleaning data", part of the Data Science specialization from Johns Hopkins through Coursera (https://www.coursera.org/specialization/jhudatascience/1?utm_medium=dashboard)


## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers
on a series of yes/no questions related to the project.

You will be required to submit:

1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis, and
3. a code book that describes the variables, the data, and any transformations or
   work that you performed to clean up the data called CodeBook.md. You should also
   include a README.md in the repo with your scripts. This file explains how all
   of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course website represent
data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## What you find in this repository

* __README.md__		: This file
* __CodeBook.md__	: Information about raw and tidy data set and elaboration made to transform them
* __run_analysis.R__: R script to transform raw data set in a tidy one
* __data__			: Folder that contains raw data set used for this project (source:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* __tidy_data.txt__	: The tidy data set

## How to create the tidy data set

1. clone this repository: "git clone https://github.com/sgirabin/coursera-getting-and-cleaning-data.git"
2. Download  data source [compressed raw data] and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. Unzip raw data and copy the directory  to the cloned repository root directory
4. Rename "UCI HAR Dataset" folder to `data`
4. Open a R console and set the working directory to the repository root (use setwd() to point out into your working folder)
5. Source run_analisys.R script (it requires the "data.table" and "reshape2" package): `source('run_analysis.R')`

In the repository root directory you find the file "tidy_data.txt" with the tidy data set.

Notes:
When you clone this repository, it has already contains the file "tidy_data.txt". You may want to remove this first before running `source('run_analysis.R')`

## License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


