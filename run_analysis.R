library(data.table)

features = read.table("features.txt")
activity_label = read.table("activity_labels.txt")

test_data= read.table("test/X_test.txt")
names(test_data)= features[,2]
test_label=read.table("test/y_test.txt")
test_label[,2]= activity_label[test_label[,1],2]
names(test_label)= c("ActivityID", "Activity_Label")
test_sub= read.table("test/subject_test.txt")
names(test_sub)=c("Subject")
test_whole=cbind(as.data.table(test_sub), test_label, test_data)


train_data=read.table("train/X_train.txt")
names(train_data)= features[,2]
train_label=read.table("train/y_train.txt")
train_label[,2]= activity_label[train_label[,1],2]
names(train_label)= c("ActivityID", "Activity_Label")
train_sub=read.table("train/subject_train.txt")
names(train_sub)=c("Subject")
train_whole=cbind(as.data.frame(train_sub), train_label, train_data)

combine_data = rbind(test_whole, train_whole)

feature_chosen = grepl("mean\\(\\)|std\\(\\)",features[,2])
features_selected = features[feature_chosen,2]
selectcolumns = c("Subject", "Activity_Label", as.character(features_selected))
data = subset(combine_data, select = selectcolumns)

names(data) = gsub("^t", "time", names(data))
names(data) = gsub("^f", "freq", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))

final_data = aggregate(.~Subject + Activity_Label, data, mean)

final_data_file = write.table(final_data, file="final_data_file.txt", row.names = FALSE)
