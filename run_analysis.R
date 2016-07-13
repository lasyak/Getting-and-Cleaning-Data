# Install plyr package
install.packages("plyr")
library(plyr)

#Get working directory with data
getwd()

# Read X,y and subject training data
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#Read X,y and subject test data
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Merge X,y and subject training and test data
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Read features data
featuresdat <- read.table("features.txt")

#Mean and std dev for measurements
meanandstddev <- grep("-(mean|std)\\(\\)", featuresdat[, 2])
X_data <- X_data[, meanandstddev]
names(X_data) <- featuresdat[meanandstddev, 2]

# Descriptive activity names
activityname <- read.table("activity_labels.txt")
y_data[, 1] <- activityname[y_data[, 1], 2]
names(y_data) <- "activity"

# Label set with descriptive var names
names(subject_data) <- "subject"
all_data <- cbind(X_data, y_data, subject_data)

# Create second set with avg of vars
avgsofdata <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

#Write new table with avgs
write.table(avgsofdata, "avgsofdata.txt", row.name=FALSE)
