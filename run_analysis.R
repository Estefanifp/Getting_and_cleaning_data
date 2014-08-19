#################################################################################################################
## Check if the packages required are already installed.

if (!require ("data.table")) {
        install.packages("data.table")
}

if (!require ("reshape2")) {
        install.packages("reshape2")
}

#################################################################################################################
## Check if the "data" directory and the data files required exists in the current working directory
## if not, create/download and unzip them.

if (!file.exists ("data")) {
        dir.create ("data")
}
if (!file.exists ("data/UCI HAR Dataset")) {
        download.file ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                       destfile = "data/dataset.zip")
        dateDownloaded <- date()
        unzip ("data/dataset.zip", exdir = "data")
}

#################################################################################################################
## Column bind the subject, activity number and data.

test <- read.table ("data/UCI HAR Dataset/test/X_test.txt", na.strings = "N/A")
                testsubjectlabel <- read.table ("data/UCI HAR Dataset/test/subject_test.txt", na.strings = "N/A")
                testsubjectactivity <- read.table ("data/UCI HAR Dataset/test/y_test.txt", na.strings = "N/A")
                testdata <- cbind(testsubjectlabel,testsubjectactivity,test)

train <- read.table ("data/UCI HAR Dataset/train/X_train.txt", na.strings = "N/A")
                trainsubjectlabel <- read.table ("data/UCI HAR Dataset/train/subject_train.txt", na.strings = "N/A")
                trainsubjectactivity <- read.table ("data/UCI HAR Dataset/train/y_train.txt", na.strings = "N/A")
                traindata <- cbind (trainsubjectlabel, trainsubjectactivity, train)

#################################################################################################################
## Merges the training and the test sets to create one data set and add columns names.

mergedata <- rbind (testdata,traindata)
features <- read.table ("data/UCI HAR Dataset/features.txt", na.strings = "N/A")
                featuresnames <- as.vector(features [,2])
colnames (mergedata) <- c ("subjectID", "activity", featuresnames)

#################################################################################################################
## Extracts only the measurements on the mean and standard deviation for each measurement.

mergedatasubset <- mergedata [,grepl("-(mean|std)",colnames(mergedata))]

## Add again the subjectid and activity
mergedatasubset <- cbind (mergedata [,1:2], mergedatasubset)

#################################################################################################################
## Uses descriptive activity names to name the activities in the data set.

activities <- read.table ("data/UCI HAR Dataset/activity_labels.txt", na.strings = "N/A")
                activitiesnames <- as.vector (activities [,2])

mergedatasubset [,"activity"] <- factor (mergedatasubset [,"activity"], levels = 1:6, labels = activitiesnames)

#################################################################################################################
## Appropriately labels the data set with descriptive variable names. 

variablenames <- colnames(mergedatasubset)
                for (i in 1:length(variablenames)) {
                        variablenames [i] <- gsub ("^t", "time", variablenames [i])
                        variablenames [i] <- gsub ("^f", "frequency", variablenames [i])
                        variablenames [i] <- gsub ("Acc","Acceleration", variablenames [i])
                        variablenames [i] <- gsub ("-", "", variablenames [i])
                        variablenames [i] <- gsub ("mean", "Mean", variablenames [i])
                        variablenames [i] <- gsub ("std", "StandardDeviation", variablenames [i])
                        variablenames [i] <- gsub ("\\()", "", variablenames [i])
                        variablenames [i] <- gsub ("Gyro", "Gyroscope", variablenames [i])
                        variablenames [i] <- gsub ("Mag", "Magnitude", variablenames [i])
                        variablenames [i] <- gsub ("BodyBody", "Body", variablenames [i])       
                }
colnames (mergedatasubset) <- variablenames

#################################################################################################################
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

library (data.table)
library (reshape2)
dataastable <- data.table (mergedatasubset)
                meltdata <- melt (dataastable, id.vars = c("subjectID","activity"))
                tidydata <- dcast (meltdata, subjectID + activity ~ variable, mean)
write.table (tidydata, file ="tidydata.txt", row.name = FALSE, sep = ",")
