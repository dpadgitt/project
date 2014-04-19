rm(list=ls()) # remove all previously defined objects
#setwd("~/Documents/Coursera Courses/Getting and Cleaning Data/project")
library(data.table) # use Data Tables for more efficiency than Data Frames
library(reshape2) # use for second, independent tidy data
#
# Download Training files into Data Table
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
# download.file(fileUrl, destfile ="./Dataset.zip", method ="curl")
# unzip it
# unzip("Dataset.zip", overwrite = TRUE, exdir = ".")
# Get column headers from features.txt
rawhdrs <- read.table("UCI HAR Dataset/features.txt")
rawhdrs$V1 <- NULL # remove column V1
hdrs <- as.character(t(rawhdrs$V2)) # transpose & change to characters
#
# Load test & train files into Data Table
testX <- data.table(read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE))
testy <- data.table(read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE))
trainX <- data.table(read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE))
trainy <- data.table(read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE))
subjtest <- data.table(read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE))
subjtrain <- data.table(read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE))
#
# ***** 1) Merge the training and the test sets to create one data set
#
allX <- rbind(testX,trainX)
ally <- rbind(testy,trainy)
allsubj <- rbind(subjtest,subjtrain)
setnames(allX,hdrs) # Add descriptive column headers to explanatory variables
setnames(ally,"activity") # Add descriptive column header to dependent variable
setnames(allsubj,"subject") # Add descriptive column header for subjects
#
# ***** 2) Extract only the measurements 
#          on the mean and standard deviation for each measurement
#
selcols <- grep("-mean\\(\\)|Mean|-std\\(\\)",names(allX)) # columns containing either "-mean()" or "Mean" or "-std()" 
X <- subset(allX,,hdrs[selcols]) # subset X by select columns
selhdrs <- names(X)
#
# ***** 3) Use descriptive activity names to name the activities in the data set
#
activities <- data.table(read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE))
#
# ***** 4) Appropriately label the data set with descriptive activity names. 
#
y <- data.table(as.character(activities$V2[ally[,activity]]))
setnames(y,"activity") # Add descriptive column header to dependent variable
#
# ***** 5) Create a second, independent tidy data set with the average 
#          of each variable for each activity and each subject.
#
selvars <- cbind(allsubj,y,X) # note y has descriptive activities that ally lacks
selmelt <- melt(as.data.table(selvars),id.vars=c("subject","activity"),measure.vars=selhdrs)
tidy <- dcast.data.table(selmelt,subject+activity~variable,mean)
#write.csv(tidy,"tidy.csv")
