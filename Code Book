I downloaded the data set and extracted it into the same repository I wanted to have all my files in.

Using read.table, I read both the test data and the training data into R.

```{r}
X_test<- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test<- read.table("UCI HAR Dataset/test/Y_test.txt")
Subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt")
```
```{r}
X_train<- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train<- read.table("UCI HAR Dataset/train/Y_train.txt")
Subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt")
```


Merging the two data sets using rbind.
```{r}
X<-rbind(X_test, X_train)
Y<-rbind(Y_test, Y_train)
Subject<-rbind(Subject_test, Subject_train)
```


Extracting the measurement of the mean and standard deviations of each measurement.
```{r}
features<-read.table("UCI HAR Dataset/features.txt")
X<-X[,grep("mean\\(\\)|std\\(\\)", features[,2])]
```


Using descriptive activity names to name the activities in the data set
```{r}
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
Y[,1]<-activity[Y[,1],2]
```


Labeling the data set with descriptive variable names.
```{r}
names<-features[index,2] 
names(X)<-names 
names(Subject)<-"SubjectID"
names(Y)<-"Activity"
Clean.Data<-cbind(Subject, Y, X)
```

An independent tidy data set with the average of each variable for each activity and each subject.
```{r}
Clean.Data<-data.table(Clean.Data)
Tidy.Data <- Clean.Data[, lapply(.SD, mean), by = 'SubjectID,Activity'] 
write.table(Tidy.Data, file = "Tidy.txt",FALSE)
```