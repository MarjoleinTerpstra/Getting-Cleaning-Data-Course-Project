#run_analysis.R

This run_analysis.R script is created to process the Human Activity Recognition Using Smartphones Dataset (Version 1), available as UCI HAR Dataset.zip at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. For more information on this dataset, see the CodeBook. Running the script results in a tidy and summarized version of the dataset, following the steps described in the course project of the Getting & Cleaning Data course. This involves selection of only the mean- and standard deviation variables and averaging them per subject and per activity. The tidy and summarized data set will be given as a .txt data file in the working directory.

##Before running this script:
* the packages dplyr should be installed
* the raw data should be available as an unzipped UCI HAR Dataset folder in the working directory

##Within UCI HAR Dataset.zip are several files:
* 'README.txt': Contains general information about the dataset
* 'features_info.txt': Contains information about the measurement variables used (i.e., the feature vector or the features of the signals)
* 'features.txt': Dataframe with names of all the measurement variables (i.e., features)
* 'activity_labels.txt': Dataframe with names of the activities linked to class labels
* 'train/X_train.txt': Dataframe with measurement data for Training set
* 'train/y_train.txt': Dataframe with activity data for Training set
* 'train/subject_train.txt':  Dataframe with subject data for Training set 
* 'train/Inertial Signals': Folder with datafiles on inertial data for Training set– NOT USED
* 'test/X_test.txt': Dataframe with measurement data for Test set
* 'test/y_test.txt': Dataframe with activity data for Test set
* 'test/subject_test.txt': Dataframe with subject data for Test set 
* 'test/Inertial Signals': Folder with datafiles on inertial data for Test set– NOT USED 

##The script processes the raw data in 6 steps:
###0. Loading the data files for both the training set and the test set and clipping each dataset together 
Loads all the required data files for both the training set and the test set. Both the training set and the test set are clipped together from their appropriate files; first, variable names are added to the subject data, activity data and measurement data, then these three data sets are placed next to each other to create a training set and test set. 

###1. Merging of the training and test set into one set
Combines the training set and test set by placing their rows below each other

###2. Extracting only the measurements on the mean and standard deviation for each measurement
Extracts, next to subject and activity, only the measurement variables that express the mean or standard deviation of a measurement. This are only the variables with suffix '...mean()' and '...std()'. 
3. Using descriptive activity names to name the activities in the data set
The numbers that express the activity undertaken are labeled by text strings with descriptive names for each activity, given in activity_labels.txt.

###4. Labelling the data set appropriately with descriptive variable names
The descriptive names of the variables, already assigned in step 0, are corrected.  '()' And '-' are removed to comply with R standards.

###5. Creating a second, independent tidy data set file with the average of each variable for each subject and each activity
The data set is first grouped by subject as well as activity and then summarized into means per subject and per activity for each of the measurement variables. This dataset is then written into a  data file ('TidyData.txt') in the working directory.

##Afterwards, the TidyData.txt data file can be loaded and viewed in R Studio:
        TidyData  <- read.table("TidyData.txt", header = TRUE)
        View(TidyData)