#This script processes a data set about an experiment on human activity recognition using smartphones into a tidy data set, 
#according to the steps described in the course project of the Getting & Cleaning Data course.
#Processing of the data set includes 
#       0. Loading the datafiles for both the training set and the test set and clipping each dataset together 
#       1. Merging of the training set and test set into one set
#       2. Extracting only the measurements on the mean and standard deviation for each measurement
#       3. Using descriptive activity names to name the activities in the data set
#       4. Labelling the data set appropriately with descriptive variable names
#       5. Creating a second, independent tidy data set file with the average of each variable for each subject and each activity


#0.Loading the datafiles for both the training set and the test set and clipping each dataset together 
#For the variable- and labelnames:
ActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
MeasurementVariables <- read.table("./UCI HAR Dataset/features.txt")
MeasurementVariablesVector <- MeasurementVariables[,2] 

#For the training data set:
TrainDataMeasurements <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(TrainDataMeasurements) <- MeasurementVariablesVector 
TrainDataActivities <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(TrainDataActivities) <- "activity" 
TrainDataSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(TrainDataSubjects) <- "subject"    
TrainData <- cbind(TrainDataSubjects,TrainDataActivities,TrainDataMeasurements)

#For the test data set:
TestDataMeasurements <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(TestDataMeasurements) <- MeasurementVariablesVector 
TestDataActivities <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(TestDataActivities) <- "activity" 
TestDataSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(TestDataSubjects) <- "subject"   
TestData <- cbind(TestDataSubjects,TestDataActivities, TestDataMeasurements)

# 1.Merging of the training set and test set into one set
TotalData <- rbind(TrainData,TestData)

#2.Extracting only the measurements on the mean and standard deviation for each measurement
VectorOfMean <- grep("mean\\(\\)",names(TotalData))
VectorOfMeanFreq <- grep("MeanFreq",names(TotalData))
VectorOfStdev <- grep("std()",names(TotalData))
TotalDataMeanStdev <- TotalData[, c(1:2,VectorOfMean,VectorOfStdev)]

#3.Using descriptive activity names to name the activities in the data set
TotalDataMeanStdev$activity <- as.factor(TotalDataMeanStdev$activity)
levels(TotalDataMeanStdev$activity) <- ActivityLabels$V2

#4.Labelling the data set appropriately with descriptive variable names
names(TotalDataMeanStdev) <- gsub("BodyBody","Body",names(TotalDataMeanStdev))
names(TotalDataMeanStdev) <- gsub("\\(\\)","",names(TotalDataMeanStdev))
names(TotalDataMeanStdev) <- gsub("-",".",names(TotalDataMeanStdev))

#5.Creating a second, independent tidy data set file with the average of each variable for each subject and each activity
library(dplyr)
TotalDataMeanStdevBySubjectAndActivity <- group_by(TotalDataMeanStdev,subject,activity)
TotalDataMeanStdevSummarisedAsMeans <- summarise_each(TotalDataMeanStdevBySubjectAndActivity,funs(mean))
write.table(TotalDataMeanStdevSummarisedAsMeans,file="TidyData.txt", row.names = FALSE, col.names = TRUE)
