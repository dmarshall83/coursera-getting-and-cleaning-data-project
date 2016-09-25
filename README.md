# Getting and Cleaning Data - Course Project
The R script `run_analysis.R` was created to gather data, clean data, and created a tidy summary dataset of the UCI HAR Dataset. `run_analysis.R` contians the following functions:

* ###runAnalysis 
This function is a wrapper to run all necessary functions start to finish and write the tidy summary dataset to uci-har-means-tidy.csv. To view the output run the following code:
    
    `data <- read.csv('uci-har-means-tidy.csv')`
    
    `View(data)`

* ###getLibraries
This script requires the dplyr library. This function will check for this library and download and/or load if necessary.

* ###getData
This function checks the working directory for the `UCI HAR Dataset`. If the folder does not exist the data is downloaded, unziped, and the zipped file is removed. The unziped folder location is reported to the user.

* ###createCombinedDataset
This function does the following:
1. Reads all necessary tables into R.
2. Makes a unique feature list to avoid duplicate label issues with dplyr select.
3. Relabels the columns in both test and train data to the features.
4. Adds the y for each test and train dataset and labels is `activity`.
5. Adds the `subject` to each test and train dataset.
6. Combines the test and train data into one dataset.
7. Changes `activity` to a factor and resets the levels to the tidy activity labels.
8. Returns the combined labeled dataset.

* ###createSummaryDataset
This functions takes the output of the createCombinedDataset function and does the following:
1. Selects a subset of columns that contain: `subject`, `activity`, and any field containing the word `mean` or `std` in the label.
2. Groups the data by `subject` and `activity` then summarizes all measurement fields by the mean.
3. Creates tidy column labels by the following:
    a. removing hypens.
    b. removing parenthesis.
    c. applying camel case.
    d. changes `BodyBody` to `Body`.
4. returns the tidy summary dataset.