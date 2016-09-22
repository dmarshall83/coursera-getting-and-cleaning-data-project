mainfunciton <- function(){
    
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
    xytrain <- cbind(activityid = ytrain$V1, xtrain)
    xytest <- cbind(activityid = ytest$V1, xtest)
    
    #cbind the subject
    xytrain <- cbind(subject = subtrain$V1, xytrain)
    xytest <- cbind(subject = subtest$V1, xytest)
    
    #add the data tables together
    xycombined <- rbind(xytrain, xytest)    
    
    return(xycombined)
}
