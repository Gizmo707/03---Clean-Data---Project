# Set working directory. Change as necesary.
# setwd(".")
#
# Read train data
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
# Read test data
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
# Join datasets
data <- rbind(trainData,testData)
# Get Variable names
features <- read.table("UCI HAR Dataset/features.txt")
# Assign variable names to datasets
names(data) <- features$V2
# Build logical vector to select columns
keepVar <- grepl("[Mm]ean",features$V2) | grepl("std",features$V2)
# Select variables of interest
data <- data[,keepVar]
# Get and join activity info
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
activity <- rbind(trainActivity,testActivity)
# Get and join subject info
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(trainSubject,testSubject)
# Add descriptive names to activity and subject
names(activity) <- c("ActivityCode")
names(subject) <- c("Subject")
# Get Activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
# Add activity descriptions
activity$ActivityName <- activityLabels$V2[activity$ActivityCode]
# Join to get the tidy data set
data <- cbind(subject,activity,data)
# Fix variable names
names <- names(data)
names <- gsub("mean", "Mean", names) # Mean to upercase
names <- gsub("\\(\\)", "", names)   # Eliminate ()
names <- gsub("-", "_", names)       # Change - to _
names <- gsub("std","Std",names)     # Std to upercase
names <- gsub("\\(", "_", names)     # Change remainin ( to _
names <- gsub("\\)", "", names)      # Eliminate )
names(data) <- names
#
# Create second data set
data2 <- aggregate(data[,4:length(data[1,])],by=list(data$Subject,data$ActivityName),FUN=mean)
# Assign names to variables used to partition data
names[1:2] <- c("Subject","ActivityName") # Group names
# Write table to disk
write.table(data2,"meansByActivity.txt",row.names=FALSE)
