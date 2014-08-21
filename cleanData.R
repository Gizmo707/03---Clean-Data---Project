# Set working directory. Change as necesary.
# setwd(".")
#
# Read train data
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
# Read test data
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
# Get Variable names
features <- read.table("UCI HAR Dataset/features.txt")
# Assign variable names to datasets
names(trainData) <- features$V2
names(testData) <- features$V2
# Join datasets
data <- rbind(trainData,testData)
# Build logical vector to select columns
keepVar <- grepl("mean",features$V2) | grepl("Mean",features$V2) | grepl("Std",features$V2)
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
# Get Activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
# Add descriptive names to activity and subject
names(activity) <- c("ActivityCode")
names(subject) <- c("Subject")
# Add activity descriptions
activity$ActivityName <- activityLabels$V2[activity$ActivityCode]
# Join to get the tidy data set
data <- cbind(subject,activity,data)
#
# Create second data set
data2 <- aggregate(data[,4:length(data[1,])],by=list(data$Subject,data$ActivityName),FUN=mean)
# Assign names to groups
names(data2)[1:2]=c("Subject","ActivityName")
# Write table to disk
write.table(data2,"meansByActivity.txt",row.names=FALSE)