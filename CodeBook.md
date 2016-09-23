#Code Book
This code book is for the uci-har-means-tidy.txt dataset

##Original Data Source
The original source for the data in this dataset came from the study "Human Activity Recognition Using Smartphones Data Set". A description of the study and relevant files can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Identifying Fields
* subject - An ID number identifying the test subject performing the activities.
* activity - A description of the activities performed by the subject:
     * walking
     * walkingupstairs
     * walkingdownstairs
     * sitting
     * standing
     * laying
     
##Measurement Fields
All of the measurement fields are derived from the measurement of the similar field in the original dataset (see below for name conversion). The measurements are the means of the original values grouped by subject and activity. 
