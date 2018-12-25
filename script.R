library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "file.zip")
dir.create("wearable_data")
unzip("./file.zip",exdir = "./wearable_data")
setwd("./wearable_data")
setwd("./UCI HAR Dataset")
train<-read.table("./train/X_train.txt")
trainppl<-read.table("./train/subject_train.txt")
trainact<-read.table("./train/y_train.txt")
test<-read.table("./test/X_test.txt")
testppl<-read.table("./test/subject_test.txt")
testact<-read.table("./test/y_test.txt")
train$participants<-trainppl$V1
train$activities<-trainact$V1
test$activities<-testact$V1
test$participants<-testppl$V1
wdata<-rbind(train,test)
a<-read.table("./features.txt")
c1<-grep("mean",a$V2)
c2<-grep("std",a$V2)
c<-c(c1,c2)
v<-sort(c)
l<-rep("V",length(v))
v<-as.character(v)
csub<-paste(l,v,sep = "")
csub<-c(csub,"participants","activities")
wmdata<-wdata[,csub]
exct<-data.frame()
for (i in 1:6) {
  for(k in 1:30){
    su<-wmdata[wmdata$activities ==i&wmdata$participants == k,1:79]
    for(j in 1:79){
      exct[i*k,j]<-mean(su[,j])
    }
  }
}
exct$participants<-rep(1:30,6)
exct$activities<-c(rep("WALKING",30),rep("WALKING_UPSTAIRS",30),rep("WALKING_DOWNSTAIRS",30),rep("SITTING",30),rep("STANDING",30),rep("LAYING",30))
wmdata<-rename(wmdata,tBodyAcc_mean_x=V1,tBodyAcc_mean_y=V2,tBodyAcc_mean_z=V3,tBodyAcc_std_x=V4,tBodyAcc_std_y=V5,tBodyAcc_std_z=V6,tGravityAcc_mean_x=V7,tGravityAcc_mean_y=V8,tGravityAcc_mean_z=V9,tGravityAcc_std_x=V10,tGravityAcc_std_y=V11,tGravityAcc_std_z=V12,tBodyAccJerk_mean_x=V13,tBodyAccJerk_mean_y=V14,tBodyAccJerk_mean_z=V15,tBodyAccJerk_std_x=V16,tBodyAccJerk_std_y=V17,tBodyAccJerk_std_z=V18,tBodyGyro_mean_x=V19,tBodyGyro_mean_y=V20,tBodyGyro_mean_z=V21,tBodyGyro_std_x=V22,tBodyGyro_std_y=V23,tBodyGyro_std_z=V24,tBodyGyroJerk_mean_x=V25,tBodyGyroJerk_mean_y=V26,tBodyGyroJerk_mean_z=V27,tBodyGyroJerk_std_x=V28,tBodyGyroJerk_std_y=V29,tBodyGyroJerk_std_z=V30,tBodyAccMag_mean=V31,tBodyAccMag_std=V32,tGravityAccMag_mean=V33,tGravityAccMag_std=V34,tBodyAccJerkMag_mean=V35,tBodyAccJerkMag_std=V36,tBodyGyroMag_mean=V37,tBodyGyroMag_std=V38,tBodyGyroJerkMag_mean=V39,tBodyGyroJerkMag_std=V40,fBodyAcc_mean_x=V41,fBodyAcc_mean_y=V42,fBodyAcc_mean_z=V43,fBodyAcc_std_x=V44,fBodyAcc_std_y=V45,fBodyAcc_std_z=V46,fBodyAcc_meanFreq_x=V47,fBodyAcc_meanFreq_y=V48,fBodyAcc_meanFreq_z=V49,fBodyAccJerk_mean_x=V50,fBodyAccJerk_mean_y=V51,fBodyAccJerk_mean_z=V52,fBodyAccJerk_std_x=V53,fBodyAccJerk_std_y=V54,fBodyAccJerk_std_z=V55,fBodyAccJerk_meanFreq_x=V56,fBodyAccJerk_meanFreq_y=V57,fBodyAccJerk_meanFreq_z=V58,fBodyGyro_mean_x=V59,fBodyGyro_mean_y=V60,fBodyGyro_mean_z=V61,fBodyGyro_std_x=V62,fBodyGyro_std_y=V63,fBodyGyro_std_z=V64,fBodyGyro_meanFreq_x=V65,fBodyGyro_meanFreq_y=V66,fBodyGyro_meanFreq_z=V67,fBodyAccMag_mean=V68,fBodyAccMag_std=V69,fBodyAccMag_meanFreq=V70,fBodyBodyAccJerkMag_mean=V71,fBodyBodyAccJerkMag_std=V72,fBodyBodyAccJerkMag_meanFreq=V73,fBodyBodyGyroMag_mean=V74,fBodyBodyGyroMag_std=V75,fBodyBodyGyroMag_meanFreq=V76,fBodyBodyGyroJerkMag_mean=V77,fBodyBodyGyroJerkMag_std=V78,fBodyBodyGyroJerkMag_meanFreq=V79)
tidy<-rename(exct,tBodyAcc_mean_x=V1,tBodyAcc_mean_y=V2,tBodyAcc_mean_z=V3,tBodyAcc_std_x=V4,tBodyAcc_std_y=V5,tBodyAcc_std_z=V6,tGravityAcc_mean_x=V7,tGravityAcc_mean_y=V8,tGravityAcc_mean_z=V9,tGravityAcc_std_x=V10,tGravityAcc_std_y=V11,tGravityAcc_std_z=V12,tBodyAccJerk_mean_x=V13,tBodyAccJerk_mean_y=V14,tBodyAccJerk_mean_z=V15,tBodyAccJerk_std_x=V16,tBodyAccJerk_std_y=V17,tBodyAccJerk_std_z=V18,tBodyGyro_mean_x=V19,tBodyGyro_mean_y=V20,tBodyGyro_mean_z=V21,tBodyGyro_std_x=V22,tBodyGyro_std_y=V23,tBodyGyro_std_z=V24,tBodyGyroJerk_mean_x=V25,tBodyGyroJerk_mean_y=V26,tBodyGyroJerk_mean_z=V27,tBodyGyroJerk_std_x=V28,tBodyGyroJerk_std_y=V29,tBodyGyroJerk_std_z=V30,tBodyAccMag_mean=V31,tBodyAccMag_std=V32,tGravityAccMag_mean=V33,tGravityAccMag_std=V34,tBodyAccJerkMag_mean=V35,tBodyAccJerkMag_std=V36,tBodyGyroMag_mean=V37,tBodyGyroMag_std=V38,tBodyGyroJerkMag_mean=V39,tBodyGyroJerkMag_std=V40,fBodyAcc_mean_x=V41,fBodyAcc_mean_y=V42,fBodyAcc_mean_z=V43,fBodyAcc_std_x=V44,fBodyAcc_std_y=V45,fBodyAcc_std_z=V46,fBodyAcc_meanFreq_x=V47,fBodyAcc_meanFreq_y=V48,fBodyAcc_meanFreq_z=V49,fBodyAccJerk_mean_x=V50,fBodyAccJerk_mean_y=V51,fBodyAccJerk_mean_z=V52,fBodyAccJerk_std_x=V53,fBodyAccJerk_std_y=V54,fBodyAccJerk_std_z=V55,fBodyAccJerk_meanFreq_x=V56,fBodyAccJerk_meanFreq_y=V57,fBodyAccJerk_meanFreq_z=V58,fBodyGyro_mean_x=V59,fBodyGyro_mean_y=V60,fBodyGyro_mean_z=V61,fBodyGyro_std_x=V62,fBodyGyro_std_y=V63,fBodyGyro_std_z=V64,fBodyGyro_meanFreq_x=V65,fBodyGyro_meanFreq_y=V66,fBodyGyro_meanFreq_z=V67,fBodyAccMag_mean=V68,fBodyAccMag_std=V69,fBodyAccMag_meanFreq=V70,fBodyBodyAccJerkMag_mean=V71,fBodyBodyAccJerkMag_std=V72,fBodyBodyAccJerkMag_meanFreq=V73,fBodyBodyGyroMag_mean=V74,fBodyBodyGyroMag_std=V75,fBodyBodyGyroMag_meanFreq=V76,fBodyBodyGyroJerkMag_mean=V77,fBodyBodyGyroJerkMag_std=V78,fBodyBodyGyroJerkMag_meanFreq=V79)