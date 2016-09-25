##This collection of function will download the UCI HAR Dataset process the 
##data into a complete and tidy dataset. Then it will summarize the dataset by
##subject, activity, and mean of selected measures. This new dataset will get
##written to uci-har-means-tidy.csv in the working directory. The runAnalysis
##is a wrapper and will run all needed support functions.

runAnalysis <- function(){
    # Prepare Libraries
    getLibraries()
    
    # Get the data
    getData()
    
    # Combine data into a unified dataset
    writeLines("Combining the data.")
    combinedDataset <- createCombinedDataset()
    
    #Create the Tidy summary dataset
    writeLines("Summarizing the data.")
    tidySummaryData <- createSummaryDataset(combinedDataset)
    
    #write the file to uci-har-means-tidy.txt
    write.table(summary, "uci-har-means-tidy.txt", row.names = FALSE)
    writeLines(paste0("Tidy summary file has been saved to ", getwd(), "/uci-har-means-tidy.txt"))
    writeLines("To view the file run: \ndata <- read.table('uci-har-means-tidy.txt', header = TRUE)\nView(data)")
    
}
createSummaryDataset <- function(dataset){
    #select only the mean and std columns
    subset <- select(dataset, subject, activity, grep("[Mm]ean|[Ss]td", names(dataset)))
    
    #create the mean file
    summary <- subset %>% group_by(subject, activity) %>% summarise_each(funs(mean))
    
    #make tidy names
    tidynames <- names(summary)
    tidynames <- gsub("-mean", "Mean",tidynames)
    tidynames <- gsub("-std", "Std",tidynames)
    tidynames <- gsub("\\(\\)-|\\(\\)", "",tidynames)
    tidynames <- gsub("BodyBody", "Body",tidynames)
    
    names(summary) <- tidynames
    
    return(summary)
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
        writeLines("UCI HAR Dataset located in working directory.")
    }else{
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
        unzip("dataset.zip")
        file.remove("dataset.zip")
        writeLines(paste0("UCI HAR Dataset downloaded and saved to ",  getwd(), "/UCI HAR Dataset"))
    }
}

getLibraries <- function(){
    #Checks for the required dplyr library and installs it if necessary
    if(require("dplyr")){
        writeLines("dplyr is loaded")
    } else {
        writeLines("attempting to install dplyr")
        install.packages("dplyr")
        if(require(dplyr)){
            writeLines("dplyr was installed and loaded correctly")
        } else {
            stop("could not install required packages (dplyr)")
        }
    }
}