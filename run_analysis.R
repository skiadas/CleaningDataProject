## Getting the data
datalink <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
targetname <- "dataset.zip"
download.file(datalink, targetname, method = "curl")
datafiles <- unzip(targetname, list=TRUE)$Name
unzip(targetname)
featureNames <- read.table(datafiles[grep("features.txt", datafiles)])[,2]
featureNames <-
    gsub("^t", "time",
        gsub("^f", "freq",
                gsub("[(),-]+", ".",
                    gsub("\\(?\\)$", "", featureNames)
                )
        )
    )
desiredFeatures <- grep("mean|std", featureNames, value=TRUE)
xtrain <- read.table(grep("X_train", datafiles, value=TRUE))
names(xtrain) = featureNames
xtrain <- xtrain[,desiredFeatures]
xtest <- read.table(grep("X_test", datafiles, value=TRUE))
names(xtest) = featureNames
xtest <- xtest[,desiredFeatures]
ytrain <-  read.table(grep("/y_train", datafiles, value=TRUE))[,1]
ytest <-  read.table(grep("/y_test", datafiles, value=TRUE))[,1]
subtrain <- read.table(grep("/subject_train", datafiles, value=TRUE))[,1]
subtest <- read.table(grep("/subject_test", datafiles, value=TRUE))[,1]
train <- cbind (id = subtrain, activity = ytrain, xtrain)
test <- cbind (id = subtest, activity = ytest, xtest)
alldata <- rbind(train, test)
activityLabels <- c("walking", "walking_up", "walking_down", "sitting", "standing", "laying")
alldata$activity <- factor(alldata$activity, labels = activityLabels)
summarySet <- aggregate(alldata[,-c(1:2)], by=list(id=alldata$id, activity=alldata$activity), mean)
write.table(summarySet, "tidySet.txt", row.names=FALSE, quote=FALSE)