#CodeBook

The **TidyData.txt** data file contains a summary of the Human Activity Recognition Using Smartphones Dataset (Version 1.0) created by 

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto,
Smartlab - Non Linear Complex Systems Laboratory,
DITEN - Università degli Studi di Genova,
Via Opera Pia 11A, I-16145, Genoa, Italy,
activityrecognition@smartlab.ws,
www.smartlab.ws

##Study design of the original dataset:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (tAcc-XYZ  from accelerometer and tGyro-XYZ  from gyroscope, with prefix 't' to denote time) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). They were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The sensor acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt'  in the original dataset for more details.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

##Creation of the tidy and summarized dataset:
For the tidy and summarized dataset, the training data set and test data set were merged into one set. Measurement data on inertial signals was omitted.  From the rest of the measurement data, only the features ‘mean’ and ‘standard deviation’ of each signal were selected. These are only the variables with suffix '...mean()' and '...std()'.

The dataset was summarized by calculating the mean per subject and per activity of all of the mean and std variables.

##Code Book:

subject - Subject number (1-30) of the subject in the experiment 

activity - Activity (6 in total) undertaken by the subject:  
                                
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Measurement variables - 66 measured variables, which are averaged per subject and per activity

* These variables originate from the sensor signals of the accelerometer (‘Acc’) and from the gyroscope (‘Gyro’), and are often expressed in 3-axial versions (‘X’, ‘Y’, ‘Z’). Some are associated with time (‘t’), others with frequency (‘f’)
* The variables represent the features mean (‘mean’) and standard deviation (‘std’) of the measured signals 
* All values of the measurement variables are normalized and bounded within [-1,1]

Full list of measurement variables:  

* tBodyAcc.mean.X      
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tGravityAcc.mean.X   
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z 
* tBodyAccJerk.mean.X  
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z 
* tBodyGyro.mean.X     
* tBodyGyro.mean.Y 
* tBodyGyro.mean.Z 
* tBodyGyroJerk.mean.X 
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyAccMag.mean    
* tGravityAccMag.mean
* tBodyAccJerkMag.mean
* tBodyGyroMag.mean    
* tBodyGyroJerkMag.mean
* fBodyAcc.mean.X
* fBodyAcc.mean.Y      
* fBodyAcc.mean.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y 
* fBodyAccJerk.mean.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y    
* fBodyGyro.mean.Z
* fBodyAccMag.mean
* fBodyAccJerkMag.mean 
* fBodyGyroMag.mean
* fBodyGyroJerkMag.mean
* tBodyAcc.std.X       
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.std.X    
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.std.X   
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.std.X      
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.std.X  
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.std    
* tGravityAccMag.std
* tBodyAccJerkMag.std
* tBodyGyroMag.std   
* tBodyGyroJerkMag.std
* fBodyAcc.std.X
* fBodyAcc.std.Y       
* fBodyAcc.std.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y   
* fBodyAccJerk.std.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y      
* fBodyGyro.std.Z
* fBodyAccMag.std 
* fBodyAccJerkMag.std 
* fBodyGyroMag.std
* fBodyGyroJerkMag.std 

