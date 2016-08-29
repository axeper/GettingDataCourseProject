## run_analysis.R - Collect, work with, and clean a data set.

# Librairies
library(plyr)

# Paths
archive <- "./rawdata/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
trainDir <- "./rawdata/UCI HAR Dataset/train"
testDir <- "./rawdata/UCI HAR Dataset/test"
tidyDir <- "./tidydata"
featuresFile <- "./rawdata/UCI HAR Dataset/features.txt"

# Extract the data if necessary
if (!dir.exists("./rawdata/UCI HAR Dataset")){
    print("Unzipping archive.")
    unzip(archive, exdir = "./rawdata")
}


### Step 0 - Read the trainSet and testSet
print("Read Training data")
trainSubject <- read.table(paste0(trainDir,"/subject_train.txt"))
trainX <- read.table(paste0(trainDir,"/X_train.txt"))
trainY <- read.table(paste0(trainDir,"/Y_train.txt"))

print("Read Testing data")
testSubject <- read.table(paste0(testDir,"/subject_test.txt"))
testX <- read.table(paste0(testDir,"/X_test.txt"))
testY <- read.table(paste0(testDir,"/Y_test.txt"))

featuresNames <- read.table(featuresFile)



## Step 1 - Merges the training and the test sets to create one data set.
tidySubject <- rbind(trainSubject, testSubject)
tidyX <- rbind(trainX, testX)
tidyY <- rbind(trainY, testY)
tidySet <- cbind(tidySubject, tidyY, tidyX)

# Name the columns
tidyNames <- c("subject", "activitylabel", as.character(featuresNames$V2))
names(tidySet) <- tidyNames



## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
meanStdIndices <- grep("(mean|std)\\(", tidyNames)
meanStdIndices <- c(1,2,meanStdIndices)                     # Keep the first and second column (subject and activitylabel)
tidyMeanStd <- tidySet[meanStdIndices]



## Step3 - Uses descriptive activity names to name the activities in the data set
activityNames <- c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING")
tidyMeanStd$activitylabel <- revalue(factor(tidyMeanStd$activitylabel), activityNames)



## Step 4 - Appropriately labels the data set with descriptive variable names.
# This has already been done all along the processing.
tidyMeanStdNames <- names(tidyMeanStd)
tidyMeanStdNames


## Step 5 - From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

# We have 30 subjects and 6 activities. This means that we need 6*30 lines.
# We have 2 columns (subject, activity) + 66 measurements. We need 68 columns.
# Therefore we need a 180 x 68 dataframe. 
# We initialize a matrix with zeros and coerce it into a dataframe.
mat = matrix(0, nrow = 180, ncol = 68)
tidySet2 = as.data.frame(mat)

# Name the columns
names(tidySet2) <- tidyMeanStdNames

# We can already fill the two first columns
tidySet2$subject <- rep(1:30, each = 6)
tidySet2$activitylabel <- rep(unname(activityNames), times = 30)

# Splitting the data for each subject and each activity
sp <- split(tidyMeanStd, list(tidyMeanStd$activitylabel,tidyMeanStd$subject))

# We can now iterate upon sp to fill the datafram
for (idx in seq(length(sp))) {
    temp <- sapply(sp[[idx]], mean)
    # Remove the two first columns
    tidySet2[idx,-c(1,2)] <- temp[-c(1,2)]
}



## Exporting the two data sets
print("Exporting the two datasets into ./tidydata/")
write.csv(tidyMeanStd, file = paste0(tidyDir,"/tidySet1.csv"))
write.csv(tidySet2, file = paste0(tidyDir,"/tidySet2.csv"))

