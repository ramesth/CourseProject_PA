##Read the data
##Extract the value with std() or mean()  index of features
##Explicitly excludes some variables like angle(tBodyAccJerkMean),gravityMean),fBodyAccMag-meanFreq()

featureNames <- read.table("UCI HAR Dataset/features.txt")
reqFeatIndex<-grep("std\\(\\)|mean\\(\\)", featureNames[,2])


##read X training and X test data then
##Extract needed train and test features considering feature index above

trainxFeatures <- read.table("UCI HAR Dataset/train/X_train.txt")
reqtrainxFeatures<-trainxFeatures[,reqFeatIndex]
testxFeatures <- read.table("UCI HAR Dataset/test/X_test.txt")
reqTestxFeatrues<-testxFeatures[,reqFeatIndex]

##combine the training and test data rows into one and provide column names
totFeatures <- rbind(reqtrainxFeatures, reqTestxFeatrues)
colnames(totFeatures) <- featureNames[reqFeatIndex, 2]

## woking of combining acitivity related training and test codes
## These are y files

trainyActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
testyActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
totActivities <- rbind(trainyActivities, testyActivities)

## Give a descriptive name 

names(totActivities)<-c("activityCode")

## Category and provide descriptive label names

totActivities$activityDescription<-factor(totActivities$activityCode,levels=activityLabels[,1], labels=activityLabels[,2])

## Now combine subject identity of test and train

trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
totSubjects <- rbind(trainSubjects, testSubjects)
subjectActivities <- cbind(totSubjects, totActivities[,2])
colnames(subjectActivities) <- c("subjectId", "activity")

##combin subjec activities and total features into semi final dataset.

dataset<-cbind(subjectActivities,totFeatures)

# creates a second, independent tidy data set with the average of each variable 

resultSet<-aggregate(dataset[,3:68], by = list(dataset$subjectId, dataset$activity), mean)

# Give a descriptive column name
colnames(resultSet)[1:2] <- c("subjectId", "activity")

# write the final data set in the form text file in the current directory

write.table(resultSet, file="finalDataSet.txt",row.name=FALSE)


