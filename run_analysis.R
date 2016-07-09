# Coursera Week 4 Course Project
# Getting and Cleaning Data
# Vu Pham
# github.com/vutylicious/get-clean-data

# Set working directory
setwd("c:/Coursera/CleaningData/")

# If zip file doesn't exist, download the zip file
if(!file.exists("data.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  "data.zip")    
}

# Unzip data file
unzip("data.zip")

# Read data files
trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt")
trainX<-read.table("UCI HAR Dataset/train/X_train.txt")
trainY<-read.table("UCI HAR Dataset/train/Y_train.txt")

testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt")
testX<-read.table("UCI HAR Dataset/test/X_test.txt")
testY<-read.table("UCI HAR Dataset/test/Y_test.txt")

activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

# Merge training and test tables
subject<-rbind(trainSubject,testSubject)
x<-rbind(trainX,testX)
y<-rbind(trainY,testY)

# Figure out which columns contain means or standard deviations
columns<-grep("*-mean\\(\\)*|*-std\\(\\)*",features[,2])

# Filter X and features to only contain mean and standard deviation data
filteredX<-x[,columns]
filteredFeatures<-features[columns,]

# Assign Column Names
colnames(filteredX)<-filteredFeatures[,2]
colnames(subject)<-"SubjectID"
colnames(y)<-"Activity"

# Update y with actual activity name from activityLabels
for(i in 1:6)
    y$Activity[y$Activity==i]<-as.character(activityLabels[i,2])

# Combine into one table
finalTable<-cbind(subject,y,filteredX)

# Clean up the column names
for(i in 1:length(colnames(finalTable))) {
    colnames(finalTable)[i]=gsub("\\()","",colnames(finalTable)[i])
    colnames(finalTable)[i]=gsub("-mean","Mean",colnames(finalTable)[i])
    colnames(finalTable)[i]=gsub("-std","StDev",colnames(finalTable)[i])
    colnames(finalTable)[i]=gsub("-","",colnames(finalTable)[i])
}

# Output tidy data set
write.table(finalTable,"tidy_data.txt",row.name=FALSE)

# Load dplyr library
library(dplyr)

# Group the final table by Subject ID and Activity and generate summary table
groupedBySubjectActivity<-group_by(finalTable,SubjectID,Activity)
summaryTable<-summarize(groupedBySubjectActivity,
                        tBodyAccMeanX=mean(tBodyAccMeanX),
                        tBodyAccMeanY=mean(tBodyAccMeanY),
                        tBodyAccMeanZ=mean(tBodyAccMeanZ),
                        tBodyAccStDevX=mean(tBodyAccStDevX),
                        tBodyAccStDevY=mean(tBodyAccStDevY),
                        tBodyAccStDevZ=mean(tBodyAccStDevZ),
                        tGravityAccMeanX=mean(tGravityAccMeanX),
                        tGravityAccMeanY=mean(tGravityAccMeanY),
                        tGravityAccMeanZ=mean(tGravityAccMeanZ),
                        tGravityAccStDevX=mean(tGravityAccStDevX),
                        tGravityAccStDevY=mean(tGravityAccStDevY),
                        tGravityAccStDevZ=mean(tGravityAccStDevZ),
                        tBodyAccJerkMeanX=mean(tBodyAccJerkMeanX),
                        tBodyAccJerkMeanY=mean(tBodyAccJerkMeanY),
                        tBodyAccJerkMeanZ=mean(tBodyAccJerkMeanZ),
                        tBodyAccJerkStDevX=mean(tBodyAccJerkStDevX),
                        tBodyAccJerkStDevY=mean(tBodyAccJerkStDevY),
                        tBodyAccJerkStDevZ=mean(tBodyAccJerkStDevZ),
                        tBodyGyroMeanX=mean(tBodyGyroMeanX),
                        tBodyGyroMeanY=mean(tBodyGyroMeanY),
                        tBodyGyroMeanZ=mean(tBodyGyroMeanZ),
                        tBodyGyroStDevX=mean(tBodyGyroStDevX),
                        tBodyGyroStDevY=mean(tBodyGyroStDevY),
                        tBodyGyroStDevZ=mean(tBodyGyroStDevZ),
                        tBodyGyroJerkMeanX=mean(tBodyGyroJerkMeanX),
                        tBodyGyroJerkMeanY=mean(tBodyGyroJerkMeanY),
                        tBodyGyroJerkMeanZ=mean(tBodyGyroJerkMeanZ),
                        tBodyGyroJerkStDevX=mean(tBodyGyroJerkStDevX),
                        tBodyGyroJerkStDevY=mean(tBodyGyroJerkStDevY),
                        tBodyGyroJerkStDevZ=mean(tBodyGyroJerkStDevZ),
                        tBodyAccMagMean=mean(tBodyAccMagMean),
                        tBodyAccMagStDev=mean(tBodyAccMagStDev),
                        tGravityAccMagMean=mean(tGravityAccMagMean),
                        tGravityAccMagStDev=mean(tGravityAccMagStDev),
                        tBodyAccJerkMagMean=mean(tBodyAccJerkMagMean),
                        tBodyAccJerkMagStDev=mean(tBodyAccJerkMagStDev),
                        tBodyGyroMagMean=mean(tBodyGyroMagMean),
                        tBodyGyroMagStDev=mean(tBodyGyroMagStDev),
                        tBodyGyroJerkMagMean=mean(tBodyGyroJerkMagMean),
                        tBodyGyroJerkMagStDev=mean(tBodyGyroJerkMagStDev),
                        fBodyAccMeanX=mean(fBodyAccMeanX),
                        fBodyAccMeanY=mean(fBodyAccMeanY),
                        fBodyAccMeanZ=mean(fBodyAccMeanZ),
                        fBodyAccStDevX=mean(fBodyAccStDevX),
                        fBodyAccStDevY=mean(fBodyAccStDevY),
                        fBodyAccStDevZ=mean(fBodyAccStDevZ),
                        fBodyAccJerkMeanX=mean(fBodyAccJerkMeanX),
                        fBodyAccJerkMeanY=mean(fBodyAccJerkMeanY),
                        fBodyAccJerkMeanZ=mean(fBodyAccJerkMeanZ),
                        fBodyAccJerkStDevX=mean(fBodyAccJerkStDevX),
                        fBodyAccJerkStDevY=mean(fBodyAccJerkStDevY),
                        fBodyAccJerkStDevZ=mean(fBodyAccJerkStDevZ),
                        fBodyGyroMeanX=mean(fBodyGyroMeanX),
                        fBodyGyroMeanY=mean(fBodyGyroMeanY),
                        fBodyGyroMeanZ=mean(fBodyGyroMeanZ),
                        fBodyGyroStDevX=mean(fBodyGyroStDevX),
                        fBodyGyroStDevY=mean(fBodyGyroStDevY),
                        fBodyGyroStDevZ=mean(fBodyGyroStDevZ),
                        fBodyAccMagMean=mean(fBodyAccMagMean),
                        fBodyAccMagStDev=mean(fBodyAccMagStDev),
                        fBodyBodyAccJerkMagMean=mean(fBodyBodyAccJerkMagMean),
                        fBodyBodyAccJerkMagStDev=mean(fBodyBodyAccJerkMagStDev),
                        fBodyBodyGyroMagMean=mean(fBodyBodyGyroMagMean),
                        fBodyBodyGyroMagStDev=mean(fBodyBodyGyroMagStDev),
                        fBodyBodyGyroJerkMagMean=mean(fBodyBodyGyroJerkMagMean),
                        fBodyBodyGyroJerkMagStDev=mean(fBodyBodyGyroJerkMagStDev))
                        
# Output the summary table
write.table(summaryTable,"tidy_summary_data.txt",row.name=FALSE)                       
