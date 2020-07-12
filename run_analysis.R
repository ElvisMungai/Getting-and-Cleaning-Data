#Part one 
#getting the  test data
X_test<- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test<- read.table("UCI HAR Dataset/test/Y_test.txt")
Subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt")

#getting the training data 

X_train<- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train<- read.table("UCI HAR Dataset/train/Y_train.txt")
Subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt")

#Merging the two datasets.
X<-rbind(X_test, X_train)
Y<-rbind(Y_test, Y_train)
Subject<-rbind(Subject_test, Subject_train)

#Part two
#Getting the mean and standard deviation of each measurement 
features<-read.table("UCI HAR Dataset/features.txt")
X<-X[,grep("mean\\(\\)|std\\(\\)", features[,2])]


#Part three
#Using descriptive activity names to name the activities in the data set
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
Y[,1]<-activity[Y[,1],2]

#Part four
#Labeling the data set with descriptive variable names.
names<-features[index,2] 
names(X)<-names 
names(Subject)<-"SubjectID"
names(Y)<-"Activity"

Clean.Data<-cbind(Subject, Y, X)

#Part five
# An independent tidy data set with the average of each variable for each activity and each subject.
Clean.Data<-data.table(Clean.Data)
Tidy.Data <- Clean.Data[, lapply(.SD, mean), by = 'SubjectID,Activity'] 
write.table(Tidy.Data, file = "Tidy.txt",FALSE)










