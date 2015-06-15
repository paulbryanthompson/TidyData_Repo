##Run Analysis Script

##You should create one R script called run_analysis.R that does the following. 
##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement.  Only  
##those columns with "mean" or "std" are included as measures in the final dataframe and tidyMean dataset.
##3.Uses descriptive activity names to name the activities in the data set.
##4.Appropriately labels the data set with descriptive variable names. 
##5.From the data set in step 4, creates a second, independent tidy data set with the average of 
##each variable for each activity and each subject.  Final dataset is called tidyMean.txt.

## load appropriate libraries
library(dplyr)
library(data.table)
library(reshape2)

## download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## locate the downloaded zip file and extract the contents to your C:\ root directory.
## a new directory called "UCI HAR Dataset" will be created.
## this will become the working directory.

setwd("C:/UCI HAR Dataset/")
  
## create dataframes from the various tables

df_features <- read.table("features.txt", header = FALSE, sep = "")
df_act_labels <- read.table("activity_labels.txt", header = FALSE, sep = "")
df_train <- read.table("train/X_train.txt", header = FALSE, sep = "")
df_train_act <- read.table("train/y_train.txt", header = FALSE, sep = "")
df_train_subject <- read.table("train/subject_train.txt", header = FALSE, sep = "")
df_test <- read.table("test/X_test.txt", header = FALSE, sep = "")
df_test_act <- read.table("test/y_test.txt", header = FALSE, sep = "")
df_test_subject <- read.table("test/subject_test.txt", header = FALSE, sep = "")
##head(df_xtrain)

## remove strange characters from column names in "features.txt" table to improve ease of use for analysis
## this will create variable names that are syntactically valid and do not conflict with R processing.
## you could use make.names but I chose to have more control over the resulting column names by using sub.

vColNames <- as.vector(df_features[,2])
vBetterColNames <- sub("(", "", vColNames, fixed = TRUE)
vBetterColNames <- sub(")", "", vBetterColNames, fixed = TRUE)
vBetterColNames <- sub("-", "", vBetterColNames, fixed = TRUE)
vBetterColNames <- sub("-", "", vBetterColNames, fixed = TRUE)
vBetterColNames <- sub(",", "_", vBetterColNames, fixed = TRUE)
vBetterColNames <- sub("_", "", vBetterColNames, fixed = TRUE)
vBetterColNames <- sub("(", "", vColNames, fixed = TRUE)
vBetterColNames <- sub(")", "", vBetterColNames, fixed = FALSE)
vBetterColNames <- sub("-", "", vBetterColNames, fixed = FALSE)
vBetterColNames <- sub("-", "", vBetterColNames, fixed = FALSE)
vBetterColNames <- sub(",", "_", vBetterColNames, fixed = FALSE)
vBetterColNames <- sub("_", "", vBetterColNames, fixed = FALSE)

## asign the syntactically correct column names to train, test
## rename columns in the activtity, subject, and activity labels data frames prior to cbinding the objects

colnames(df_train) <- vBetterColNames
colnames(df_test) <- vBetterColNames
colnames(df_train_subject) <- c("subject.id")
colnames(df_train_act) <- c("activity.id")
colnames(df_test_subject) <- c("subject.id")
colnames(df_test_act) <- c("activity.id")
colnames(df_act_labels) <- c("activity.id", "activity.name")

## add subject to 'train' and 'test' data frames

df_train_all <- cbind(df_train_subject, df_train_act, df_train)
df_test_all <- cbind(df_test_subject, df_test_act, df_test)

## merge activity names field to 'train' and 'test' data frames

df_train_merge1 <- merge(df_act_labels, df_train_all, by.x="activity.id", by.y="activity.id", all=FALSE)
df_test_merge1 <- merge(df_act_labels, df_test_all, by.x="activity.id", by.y="activity.id", all=FALSE)

## merge the fully named train and test dataframes

df_tt <- rbind(df_train_merge1, df_test_merge1)

## extract fields that have any mention of "mean" or "std" in the column name and include ID fields

df_Subset <- select(df_tt, activity.id, activity.name, subject.id, contains("std"), contains("mean"))

## create the tidy dataset that includes the mean of all measurement variables with unique values in each row
tidyMelt <- arrange(melt(df_Subset, id=c("subject.id", "activity.name", "activity.id")), subject.id, activity.id)
tidyMean <- arrange(dcast(tidyMelt, subject.id + activity.name + activity.id ~ variable, mean), subject.id, activity.id)

## write table to txt format
write.table(tidyMean, file = "tidyMean.txt", row.names = FALSE)
