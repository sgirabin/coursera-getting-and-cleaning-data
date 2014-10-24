#Create one R script called run_analysis.R that does the following: 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Check if "data.table" package is loaded
if (require("data.table")) {
    print("\"data.table\" loaded successfully")
}else {
    print("installing package \"data.table\"")
    install.packages("data.table")
    # Check if "data.table" loaded successfully
    if (require("data.table")) {
        print("\"data.table\" loaded successfully")
    }else {
        print("Failed to load \"data.table\"")
    }
}

# Check if "data.table" package is loaded
if (require("reshape2")) {
    print("\"reshape2\" loaded successfully")
}else {
    install.packages("reshape2")
    # Check if "reshape2" loaded successfully
    if (require("reshape2")) {
        print("installing package \"data.table\"")
        print("\"reshape2\" loaded successfully")
    }else {
        print("Failed to load \"reshape2\"")
    }
    
}

require("data.table")
require("reshape2")


# Load: activity labels
activity_labels <- read.table("./data/activity_labels.txt")[,2]

# Load: data column names
features <- read.table("./data/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

# Load and process X_test & y_test data.
x_test <- read.table("./data/test/X_test.txt")
y_test <- read.table("./data/test/y_test.txt")
subject_test <- read.table("./data/test/subject_test.txt")
names(x_test) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
x_test = x_test[,extract_features]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, x_test)

# Load and process X_train & y_train data.
x_train <- read.table("./data/train/X_train.txt")
y_train <- read.table("./data/train/y_train.txt")
subject_train <- read.table("./data/train/subject_train.txt")
names(x_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
x_train = x_train[,extract_features]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, x_train)

# Merge test and train data
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data   = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)
