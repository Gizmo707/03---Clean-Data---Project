03 - Getting and Cleaning Data - Course Project
===============================================

Purpose
-------
The objective of this project is to obtain a tidy data set containing means and standard deviation for 30 subjects while performing six activities:

1.- WALKING
2.- WALKING_UPSTAIRS
3.- WALKING_DOWNSTAIRS
4.- SITTING
5.- STANDING
6.- LAYING

The original dataset was obtained from
	https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip 
while the data description can be found at
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
	
Between 36 and 95 sets of features were collected for subjects when performing each activity. For this project only variables (features) containing one of the string "Mean", "mean" or "std" were selected reducing the number of features from 561 to 86. The resulting dataset provides the average of the values of means and standard deviations for each subject performing each activity, that is 180 observations of the remaining 86 variables (plus two to identify subject and activity)

The R processing script
-----------------------
The script run_analysis.R reads the raw data and writes the resulting dataset to disk as a text file; the working directory must be the parent of "UCI HAR Dataset", which contains the raw data.

The script performs the following tasks:

* Reads the raw data (X_train ,X_test)
* Combines the train and test data into a single R data frame called "data"
* Reads the names of the raw data features and uses them as variable names for the R data frame just created 
* Creates a logical vector in which TRUE corresponds to variable names that contain "mean", "Mean", or "std"
* Produces a second data frame containing only the columns identified in the previous step
* Reads and joins the activity data (y_train, y_test)
* Reads and joins the subject data (subject_train, subject_test)
* Creates names for activity and subject data frames
* Read activity labels and creates column in activities containing the corresponding activity names
* Join subject, activity and data
* Adjust variable names to make them more compatible with R (i.e. containing only letters and _)
* Create the second data frame.








Original description of the variables (features) in the data set
----------------------------------------------------------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
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
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

