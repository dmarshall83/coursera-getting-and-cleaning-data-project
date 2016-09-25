
main <- function(){
    # Prepare Libraries
    getLibraries()
    # Get the data
    getData()
    # Combine data into a unified dataset
    
    
    xtrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
    ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
    subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
    xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
    ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
    activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

    #make the names unique
    featurelabels <- make.unique(features$V2)
    
    
    
    #add the column labels
    names(xtrain) <- featurelabels
    names(xtest) <- featurelabels
    
    #cbind the xy for each
    xytrain <- cbind(activity = ytrain$V1, xtrain)
    xytest <- cbind(activity = ytest$V1, xtest)
    
    #cbind the subject
    xytrain <- cbind(subject = subtrain$V1, xytrain)
    xytest <- cbind(subject = subtest$V1, xytest)
    
    #add the data tables together
    xycombined <- rbind(xytrain, xytest)
    
    #change the levels of activityif to be the activity name
    xycombined$activity <- as.factor(xycombined$activity)
    
    #make the activity name lowercase and remove the underscore
    activities <- gsub("_", "", tolower(activitylabels$V2))
    
    levels(xycombined$activity) <- activities
    #old way
    #add the activity labels
    #names(activitylabels) <- c("activityid", "activity")
    #xycombined <- merge(activitylabels, xycombined, by.x = "activityid", by.y = "activityid")
    
    #select only the mean and std columns
    xycombinedsubset <- select(xycombined, subject, activity, grep("[Mm]ean|[Ss]td", names(xycombined)))
    
    #create the mean file
    summarydf <- xycombinedsubset %>% group_by(subject, activity) %>% summarise_each(funs(mean))
    
    #make tidy names
    tidynames <- names(summarydf)
    tidynames <- gsub("-mean", "Mean",tidynames)
    tidynames <- gsub("-std", "Std",tidynames)
    tidynames <- gsub("\\(\\)-|\\(\\)", "",tidynames)
    tidynames <- gsub("BodyBody", "Body",tidynames)
    
    names(summarydf) <- tidynames
    
    return(summarydf)
}
createSummaryDataset <- function(dataset){
    #select only the mean and std columns
    xycombinedsubset <- select(xycombined, subject, activity, grep("[Mm]ean|[Ss]td", names(xycombined)))
    
    #create the mean file
    summarydf <- xycombinedsubset %>% group_by(subject, activity) %>% summarise_each(funs(mean))
    
    #make tidy names
    tidynames <- names(summarydf)
    tidynames <- gsub("-mean", "Mean",tidynames)
    tidynames <- gsub("-std", "Std",tidynames)
    tidynames <- gsub("\\(\\)-|\\(\\)", "",tidynames)
    tidynames <- gsub("BodyBody", "Body",tidynames)
    
    names(summarydf) <- tidynames
    
    return(summarydf)
}

createCombinedDataset <- function(){
    #Combine the training and test dataset applying the appropriate labels and headers
    
    #read in all necessary files
    xtrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
    ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
    subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
    xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
    ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
    activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    
    #make the names unique
    featurelabels <- make.unique(features$V2)
    
    #add the column labels
    names(xtrain) <- featurelabels
    names(xtest) <- featurelabels
    
    #cbind the xy for each
    xytrain <- cbind(activity = ytrain$V1, xtrain)
    xytest <- cbind(activity = ytest$V1, xtest)
    
    #cbind the subject
    xytrain <- cbind(subject = subtrain$V1, xytrain)
    xytest <- cbind(subject = subtest$V1, xytest)
    
    #add the data tables together
    xycombined <- rbind(xytrain, xytest)
    
    #change the levels of activityif to be the activity name
    xycombined$activity <- as.factor(xycombined$activity)
    
    #make the activity name lowercase and remove the underscore
    activities <- gsub("_", "", tolower(activitylabels$V2))
    levels(xycombined$activity) <- activities
    
    return(xycombined)
}



getData <- function(){
    #check to see if the file already exists and exit download
    if(file.exists("UCI HAR Dataset")){
        print("UCI HAR Dataset located in working directory.")
    }else{
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
        unzip("dataset.zip")
        file.remove("dataset.zip")
        print(paste0("UCI HAR Dataset downloaded and saved to ",  getwd(), "/UCI HAR Dataset"))
    }
}

getLibraries <- function(){
    #Checks for the required dplyr library and installs it if necessary
    if(require("dplyr")){
        print("dplyr is loaded")
    } else {
        print("attempting to install dplyr")
        install.packages("dplyr")
        if(require(dplyr)){
            print("dplyr was installed and loaded correctly")
        } else {
            stop("could not install required packages (dplyr)")
        }
    }
}