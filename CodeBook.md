## tidySet1.csv

It is the resulting concatenation from the train and test set from the "UCI HAR Dataset".
Following the instructions of the assignment, we get an 10299 x 68 dataset with the columns:

* subject: integer that ranges from 1 to 30
* activitylabel: one of the following: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS", SITTING, STANDING, LAYING
* Features: we kept from the original dataset either the mean value '-mean()' and the standard deviation '-std()' of the signals. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. More informations on the features can be found below.


## tidySet2.csv

Using the information of tidySet1.csv, it was asked to create a second, independent tidy data set with the average of each variable for each activity and each subject.
This results in a 180(30 subjects * 6 activities) x 68 dataset (subject, activity and 66 features).

The structure is the same as tidySet1.csv. The difference resides in the fact that each value of the features was averaged for a subject and an activity. We then have 180 observations rather than 10299. See "run_analysis.R" for more details.



## Features selection

The original description found in the dataset provides the following information:  
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

Here is the list of the remaining features:  
tBodyAcc-mean()-XYZ  
tBodyAcc-std()-XYZ  
tGravityAcc-mean()-XYZ  
tGravityAcc-std()-XYZ  
tBodyAccJerk-mean()-XYZ  
tBodyAccJerk-std()-XYZ  
tBodyGyro-mean()-XYZ  
tBodyGyro-std()-XYZ  
tBodyGyroJerk-mean()-XYZ  
tBodyGyroJerk-std()-XYZ  
tBodyAccMag-mean()  
tBodyAccMag-std()  
tGravityAccMag-mean()  
tGravityAccMag-std()  
tBodyAccJerkMag-mean()  
tBodyAccJerkMag-std()  
tBodyGyroMag-mean()  
tBodyGyroMag-std()  
tBodyGyroJerkMag-mean()  
tBodyGyroJerkMag-std()  
fBodyAcc-mean()-XYZ  
fBodyAcc-std()-XYZ  
fBodyAccJerk-mean()-XYZ  
fBodyAccJerk-std()-XYZ  
fBodyGyro-mean()-XYZ  
fBodyGyro-std()-XYZ  
fBodyAccMag-mean()  
fBodyAccMag-std()  
fBodyBodyAccJerkMag-mean()  
fBodyBodyAccJerkMag-std()  
fBodyBodyGyroMag-mean()  
fBodyBodyGyroMag-std()  
fBodyBodyGyroJerkMag-mean()  
fBodyBodyGyroJerkMag-std()  

