###########################
# Libraries requeried.
###########################

library(plyr)

#########################################################
# Join of train and test datasets to simplify the process
#########################################################

setwd("C:/Personal/Coursera/Getting and Cleaning Data/Project")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
Subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
Subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
Xbind <- rbind(Xtrain, Xtest)
Ybind <- rbind(Ytrain, Ytest)
Subjectbind <- rbind(Subjecttrain, Subjecttest)

######################################################
# Extract the mean and std from the features text file
######################################################

features <- read.table("UCI HAR Dataset/features.txt")
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
Xbind2 <- Xbind[,mean_std]
names(Xbind2) <- features[mean_std, 2]

#############################################################################
# Extract the activities labels to name the columns of the activities dataset
#############################################################################

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
Ybind[, 1] <- activities[Ybind[, 1], 2]
names(Ybind) <- "Activity"
head(Ybind)

################################################
# Name the subject column of the subject dataset
################################################

str(Subjectbind)
names(Subjectbind) <- "Subject"

############################################################################################
# Create a tidy dataset with the average of each variable for each activity and each subject
############################################################################################

whole <- cbind(Xbind2, Ybind, Subjectbind)
str(whole)
Avg <- ddply(whole, .(Activity, Subject), function(x) colMeans(x[, 1:66]))
str(Avg)

##################################
# Write out the created tidy table
##################################

write.table(Avg, "Averages.txt", row.name=FALSE)
