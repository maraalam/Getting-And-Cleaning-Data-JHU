
library(dplyr)


if(!file.exists("./data")){
  dir.create("./data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url = fileURL, destfile="./data/getdata_dataset.zip")

if (!file.exists("./data/UCI HAR Dataset")) { 
  unzip(filename) 
}


# 0. Loading data

features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))


X_train = read.table(file="./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train = read.table(file="./data/UCI HAR Dataset/train/y_train.txt", col.names = "code")


X_test = read.table(file="./data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test = read.table(file="./data/UCI HAR Dataset/test/y_test.txt", col.names = "code")



subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")



# 1. Merges the training and the test sets to create one data set

x_all <- rbind(X_train, X_test)
y_all <- rbind(y_train,y_test)
subject_all <- rbind(subject_train, subject_test)
merge_data <- cbind(subject_all, x_all, y_all)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

filter = grepl("mean|std" , names(merge_data))

measurements <- merge_data %>% select(subject, code,  names(merge_data)[filter])



# 3. Uses descriptive activity names to name the activities in the data set.

measurements$code <- activities[measurements$code, 2]
head(measurements$code) #Out -> [1] "STANDING" "STANDING" "STANDING" "STANDING" "STANDING" "STANDING"



# 4.Appropriately labels the data set with descriptive variable names.
print(names(measurements))


names(measurements)[2] = "activity"
names(measurements) <- gsub("tBody", "timeBody", names(measurements))
names(measurements) <- gsub("Acc", "Accelerometer", names(measurements))
names(measurements) <- gsub("tGravity", "Gravity", names(measurements))
names(measurements) <- gsub("Gyro", "Gyroscope", names(measurements))
names(measurements) <- gsub("Mag", "Magnitude", names(measurements))
names(measurements) <- gsub("fBody", "frequencyBody", names(measurements))

print(names(measurements))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
solution_data.txt <- measurements %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(solution_data.txt, "./data/solution_data.txt", row.name=FALSE)

