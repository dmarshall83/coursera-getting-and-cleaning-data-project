#Code Book
This code book is for the uci-har-means-tidy.txt dataset

##Original Data Source
The original source for the data in this dataset came from the study "Human Activity Recognition Using Smartphones Data Set". A description of the study and relevant files can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Identifying Fields
* subject - An ID number identifying the test subject performing the activities.
* activity - A description of the activities performed by the subject (activity labels have been converted to lowercase and underscores have been removed to make them more tidy):
     * walking
     * walkingupstairs
     * walkingdownstairs
     * sitting
     * standing
     * laying
     
##Measurement Fields
All of the measurement fields are derived from the measurement of the similar field in the original dataset (see below for name conversion). The measurements are the means of the original values grouped by subject and activity. In order to make the field names more tidy, the hyphens and parenthesis have been removed and camel case has been applied to adjoining words. 

|Tidy.Data.Name|Original.Data.Name|
|--------------------------------------|--------------------------------------|
|`tBodyAccMeanX`|`tBodyAcc-mean()-X`|
|`tBodyAccMeanY`|`tBodyAcc-mean()-Y`|
|`tBodyAccMeanZ`|`tBodyAcc-mean()-Z`|
|`tBodyAccStdX`|`tBodyAcc-std()-X`|
|`tBodyAccStdY`|`tBodyAcc-std()-Y`|
|`tBodyAccStdZ`|`tBodyAcc-std()-Z`|
|`tGravityAccMeanX`|`tGravityAcc-mean()-X`|
|`tGravityAccMeanY`|`tGravityAcc-mean()-Y`|
|`tGravityAccMeanZ`|`tGravityAcc-mean()-Z`|
|`tGravityAccStdX`|`tGravityAcc-std()-X`|
|`tGravityAccStdY`|`tGravityAcc-std()-Y`|
|`tGravityAccStdZ`|`tGravityAcc-std()-Z`|
|`tBodyAccJerkMeanX`|`tBodyAccJerk-mean()-X`|
|`tBodyAccJerkMeanY`|`tBodyAccJerk-mean()-Y`|
|`tBodyAccJerkMeanZ`|`tBodyAccJerk-mean()-Z`|
|`tBodyAccJerkStdX`|`tBodyAccJerk-std()-X`|
|`tBodyAccJerkStdY`|`tBodyAccJerk-std()-Y`|
|`tBodyAccJerkStdZ`|`tBodyAccJerk-std()-Z`|
|`tBodyGyroMeanX`|`tBodyGyro-mean()-X`|
|`tBodyGyroMeanY`|`tBodyGyro-mean()-Y`|
|`tBodyGyroMeanZ`|`tBodyGyro-mean()-Z`|
|`tBodyGyroStdX`|`tBodyGyro-std()-X`|
|`tBodyGyroStdY`|`tBodyGyro-std()-Y`|
|`tBodyGyroStdZ`|`tBodyGyro-std()-Z`|
|`tBodyGyroJerkMeanX`|`tBodyGyroJerk-mean()-X`|
|`tBodyGyroJerkMeanY`|`tBodyGyroJerk-mean()-Y`|
|`tBodyGyroJerkMeanZ`|`tBodyGyroJerk-mean()-Z`|
|`tBodyGyroJerkStdX`|`tBodyGyroJerk-std()-X`|
|`tBodyGyroJerkStdY`|`tBodyGyroJerk-std()-Y`|
|`tBodyGyroJerkStdZ`|`tBodyGyroJerk-std()-Z`|
|`tBodyAccMagMean`|`tBodyAccMag-mean()`|
|`tBodyAccMagStd`|`tBodyAccMag-std()`|
|`tGravityAccMagMean`|`tGravityAccMag-mean()`|
|`tGravityAccMagStd`|`tGravityAccMag-std()`|
|`tBodyAccJerkMagMean`|`tBodyAccJerkMag-mean()`|
|`tBodyAccJerkMagStd`|`tBodyAccJerkMag-std()`|
|`tBodyGyroMagMean`|`tBodyGyroMag-mean()`|
|`tBodyGyroMagStd`|`tBodyGyroMag-std()`|
|`tBodyGyroJerkMagMean`|`tBodyGyroJerkMag-mean()`|
|`tBodyGyroJerkMagStd`|`tBodyGyroJerkMag-std()`|
|`fBodyAccMeanX`|`fBodyAcc-mean()-X`|
|`fBodyAccMeanY`|`fBodyAcc-mean()-Y`|
|`fBodyAccMeanZ`|`fBodyAcc-mean()-Z`|
|`fBodyAccStdX`|`fBodyAcc-std()-X`|
|`fBodyAccStdY`|`fBodyAcc-std()-Y`|
|`fBodyAccStdZ`|`fBodyAcc-std()-Z`|
|`fBodyAccMeanFreqX`|`fBodyAcc-meanFreq()-X`|
|`fBodyAccMeanFreqY`|`fBodyAcc-meanFreq()-Y`|
|`fBodyAccMeanFreqZ`|`fBodyAcc-meanFreq()-Z`|
|`fBodyAccJerkMeanX`|`fBodyAccJerk-mean()-X`|
|`fBodyAccJerkMeanY`|`fBodyAccJerk-mean()-Y`|
|`fBodyAccJerkMeanZ`|`fBodyAccJerk-mean()-Z`|
|`fBodyAccJerkStdX`|`fBodyAccJerk-std()-X`|
|`fBodyAccJerkStdY`|`fBodyAccJerk-std()-Y`|
|`fBodyAccJerkStdZ`|`fBodyAccJerk-std()-Z`|
|`fBodyAccJerkMeanFreqX`|`fBodyAccJerk-meanFreq()-X`|
|`fBodyAccJerkMeanFreqY`|`fBodyAccJerk-meanFreq()-Y`|
|`fBodyAccJerkMeanFreqZ`|`fBodyAccJerk-meanFreq()-Z`|
|`fBodyGyroMeanX`|`fBodyGyro-mean()-X`|
|`fBodyGyroMeanY`|`fBodyGyro-mean()-Y`|
|`fBodyGyroMeanZ`|`fBodyGyro-mean()-Z`|
|`fBodyGyroStdX`|`fBodyGyro-std()-X`|
|`fBodyGyroStdY`|`fBodyGyro-std()-Y`|
|`fBodyGyroStdZ`|`fBodyGyro-std()-Z`|
|`fBodyGyroMeanFreqX`|`fBodyGyro-meanFreq()-X`|
|`fBodyGyroMeanFreqY`|`fBodyGyro-meanFreq()-Y`|
|`fBodyGyroMeanFreqZ`|`fBodyGyro-meanFreq()-Z`|
|`fBodyAccMagMean`|`fBodyAccMag-mean()`|
|`fBodyAccMagStd`|`fBodyAccMag-std()`|
|`fBodyAccMagMeanFreq`|`fBodyAccMag-meanFreq()`|
|`fBodyAccJerkMagMean`|`fBodyBodyAccJerkMag-mean()`|
|`fBodyAccJerkMagStd`|`fBodyBodyAccJerkMag-std()`|
|`fBodyAccJerkMagMeanFreq`|`fBodyBodyAccJerkMag-meanFreq()`|
|`fBodyGyroMagMean`|`fBodyBodyGyroMag-mean()`|
|`fBodyGyroMagStd`|`fBodyBodyGyroMag-std()`|
|`fBodyGyroMagMeanFreq`|`fBodyBodyGyroMag-meanFreq()`|
|`fBodyGyroJerkMagMean`|`fBodyBodyGyroJerkMag-mean()`|
|`fBodyGyroJerkMagStd`|`fBodyBodyGyroJerkMag-std()`|
|`fBodyGyroJerkMagMeanFreq`|`fBodyBodyGyroJerkMag-meanFreq()`|
|`angle(tBodyAccMean,gravity)`|`angle(tBodyAccMean,gravity)`|
|`angle(tBodyAccJerkMean),gravityMean)`|`angle(tBodyAccJerkMean),gravityMean)`|
|`angle(tBodyGyroMean,gravityMean)`|`angle(tBodyGyroMean,gravityMean)`|
|`angle(tBodyGyroJerkMean,gravityMean)`|`angle(tBodyGyroJerkMean,gravityMean)`|
|`angle(X,gravityMean)`|`angle(X,gravityMean)`|
|`angle(Y,gravityMean)`|`angle(Y,gravityMean)`|
|`angle(Z,gravityMean)`|`angle(Z,gravityMean)`|

##Feature Selection (notes from orignial data ReadMe)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation
* \* additional measurements were created in original dataset that do not appear in this tidy dataset

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
