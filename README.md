#EXAMPLE PLACE HOLDER THIS MUST BE UPDATED BLAH

# Getting and Cleaning Data - Course Project
The R script `run_analysis.R` was created to gather data, clean data, and created a tidy summary dataset of the UCI HAR Dataset. `run_analysis.R` contians the following functions:

* ###main 
This function is a wrapper to run all necessary functions start to finish. 

* ###getLibraries
This script requires the dplyr library. This function will check for this library and download and/or load if necessary.

* ###getData
This function does checks the working directory for the `UCI HAR Dataset`. If the folder does not exist the data is downloaded, unziped, and the zipped file is removed. The unziped folder location is reported to the user.


   reflect a mean or standard deviation
4. Loads the activity and subject data for each dataset, and merges those
   columns with the dataset
5. Merges the two datasets
6. Converts the `activity` and `subject` columns into factors
7. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.

The end result is shown in the file `tidy.txt`.