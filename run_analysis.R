#Getting and Cleaning Data
#Course Project
#Rachel King
#11.20.17

rm(list = ls())

library(dplyr)

#downloading the data and unzipping
path = "C:/Users/Rachel/Documents/Coursera/Getting and Cleaning Data/Project/"
setwd(path)

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest = "Data.zip")
unzip("Data.zip")

#reading in features and activities
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])
names(activities) <- c("ID","activity")

#reading in training data and training activity labels and joining into 1 data frame
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainlabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainlabels, trainsubjects, train)

#reading in test data and test data activity labels and joining into 1 data frame
test <- read.table("UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testlabels, testsubjects, test)

#1. Merge the training and the test sets together to create one data set
dataset <- rbind(train,test)

#2. and #4. Extract only the measurements on the mean and standard deviation for each measurement
#give the variables in the data their correct feature names
names(dataset) <- c("ID","Subject", features[,2])

#get the column numbers for columns containing mean() and std() measures. Subset the data to just those columns. 
cols <- grep(paste(c("mean()","std()"),collapse = "|"), names(dataset), value = TRUE)
dataset <- dataset[,c("ID","Subject",cols)]

#3. Use descriptive activity names to name the activities in the data set. 

#Identifying the numeric labels with the string labels from our activity_labels set. 
dataset <- join(dataset, activities, by = "ID")


#5. Create a second, independent tidy data set with the average of each variable for each activity and each subject

#getting rid of awkward characters in variable names
names(dataset) <- gsub("\\(\\)", "", names(dataset))
names(dataset) <- gsub("\\-", "", names(dataset))

dataset$activity <- as.factor(dataset$activity)
dataset$Subject <- as.factor(dataset$Subject)

#calculates mean across numeric columns
tidySet <- aggregate(dataset[,3:81], list(dataset$activity, dataset$Subject), mean)
names(tidySet)[1:2] <- c("activity","subject")

write.table(tidySet, "tidyData.txt", row.name = FALSE)
