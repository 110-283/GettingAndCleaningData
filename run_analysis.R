library(reshape2)

# Downloaning data from URL

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(fileURL, temp)
unzip(temp,exdir = getwd())
unlink(temp)

# Reading activity labels

datafolder <- "UCI HAR Dataset"
file <- file.path(getwd(),datafolder,"activity_labels.txt")
activities <- read.table(file)
names(activities) <- c("ActivityNumber","ActivityName")

# Reading variable names

file <- file.path(getwd(), datafolder, "features.txt")
varNames <- read.table(file, stringsAsFactors = FALSE)

# Reading training set

subfolder <- "train"
file <- file.path(getwd(), datafolder, subfolder,"subject_train.txt")
subjectTrain <- read.table(file)
file <- file.path(getwd(), datafolder, subfolder,"y_train.txt")
activitiesTrain <- read.table(file)
file <- file.path(getwd(), datafolder, subfolder,"X_train.txt")
variablesTrain <- read.table(file)

# Reading testing set

subfolder <- "test"
file <- file.path(getwd(), datafolder, subfolder,"subject_test.txt")
subjectTest <- read.table(file)
file <- file.path(getwd(), datafolder, subfolder,"y_test.txt")
activitiesTest <- read.table(file)
file <- file.path(getwd(), datafolder, subfolder,"X_test.txt")
variablesTest <- read.table(file)

# Correctness check

if ((ncol(variablesTest) != ncol(variablesTrain)) 
    | (nrow(variablesTest) != nrow(activitiesTest))
    | (nrow(variablesTest) != nrow(subjectTest))
    | (nrow(variablesTrain) != nrow(activitiesTrain))
    | (nrow(variablesTrain) != nrow(subjectTrain))
    | (ncol(variablesTest) != length(varNames$V2))) stop("Inconsistent sizes of the input matrices")

# Merging all datasets in one

totalSet <- rbind(variablesTrain, variablesTest)
subjectTotal <- rbind(subjectTrain, subjectTest)
activitiesTotal <- rbind(activitiesTrain, activitiesTest)
wholeData <- cbind(subjectTotal, activitiesTotal, totalSet)
names(wholeData) <- c("SubjectNumber","ActivityNumber",varNames$V2)

# Selection of "mean" and "std" variables
colArray <- c(1,2,grep("mean[^F]|std", varNames$V2)+2)
filteredData <- wholeData[,colArray]

# Changing of variable names
oldNames <- names(filteredData)[3:ncol(filteredData)]
oldNamesSplit <- strsplit(oldNames,"-")
newNames <- character()

for (i in seq_along(oldNamesSplit)){
    tempString <- switch(oldNamesSplit[[i]][1],
                         "tBodyAcc" = "OfBodyAcc",
                         "tGravityAcc" = "OfGravityAcc",
                         "tBodyAccJerk" = "OfBodyAccelJerkSignal",
                         "tBodyGyro" = "OfBodyGyro",
                         "tBodyGyroJerk" = "OfBodyGyroJerkSignal",
                         "tBodyAccMag" = "OfBodyAccMagnitude",
                         "tGravityAccMag" = "OfGravityAccMagnitude",
                         "tBodyGyroMag" = "OfBodyGyroMagnitude",
                         "tBodyGyroJerkMag" = "OfMagnitudeOfBodyGyroJerkSignal",
                         "tBodyAccJerkMag" = "OfMagnitudeOfBodyAccJerkSignal",
                         "fBodyAcc" = "OfBodyAccFreqDom",
                         "fBodyAccJerk" = "OfBodyAccFreqDomJerkSignal",
                         "fBodyGyro" = "OfBodyGyroFreqDom",
                         "fBodyAccMag" = "OfBodyAccMagnitudeFreqDom",
                         "fBodyBodyAccJerkMag" = "OfMagnitudeOfBodyAccJerkSignalFreqDom",
                         "fBodyBodyGyroMag" = "OfMagnitudeOfBodyGyroFreqDom",
                         "fBodyBodyGyroJerkMag" = "OfMagnitudeOfBodyGyroJerkSignalFreqDom",
                         "None")
    tempString2 <- switch(oldNamesSplit[[i]][2],
                          "mean()" = "Mean",
                          "std()" = "StDev")
    tempString3 <- if(!grepl("Mag",oldNamesSplit[[i]][1])){
        switch(oldNamesSplit[[i]][3],
               "X"="AlongX",
               "Y"="AlongY",
               "Z"="AlongZ")
    } else{character()}
    
    newName <- paste0(tempString2, tempString, tempString3)
    newNames <- c(newNames, newName)
}
names(filteredData) <- c("SubjectNumber","ActivityNumber",newNames)

# Merging with the dataframe containing names of activities
namedData = merge(activities, filteredData, by.x = "ActivityNumber", by.y = "ActivityNumber")

# Melting the data and construction a final dataset
meltData <- melt(namedData, id = c("ActivityName", "SubjectNumber"), 
                 measure.vars = newNames,all=TRUE)
finalData <- dcast(meltData, ActivityName + SubjectNumber ~ variable, mean)

write.table(finalData,file = "TidyData.txt",row.names = FALSE, sep = "")
#write.csv(finalData, file = "TidyData.csv", row.names = FALSE)

#outputCheck <- read.table("TidyData.txt", header = TRUE)