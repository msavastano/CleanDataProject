

SubjectNumber:

30 Subjects

Activity:

1	WALKING

2	WALKING_UPSTAIRS

3	WALKING_DOWNSTAIRS

4	SITTING

5	STANDING

6	LAYING


Data Explanation from original documentation in features_info.txt, available at web site (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

1.  Come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

2.  These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

3.  Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

4.  The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

5.  The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

6.  The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

7.  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

8.  These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

Changes made to original data set:

1.  Excluded all functions on data except for mean and standard deviation
2.  Merged the training set and test set, including data, subject numbers and activity.
3.  Replaced Activity number with description of activity.
4.  Set the column headers with the features vector in 'features.txt'.
5.  Included a transform to take data set and create tidy data set the average of each variable for each activity and each subject. 
