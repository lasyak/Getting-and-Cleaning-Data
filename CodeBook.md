# Code Book Description
This describes the variables, the data, and the transformations I used to clean up the data.

# Method
* The training and test data was merged using the rbind() function.
* The names were corrected only for the measurements on the mean and standard deviations from the ‘features.txt’ file.
* Gave descriptive names to the activities in the ‘activity_labels.txt’ file.
* Gave appropriate labels throughout the data set.
* Generated a second, independent tidy data set with the averages of the variables for the activities and subjects. Wrote this to the file ‘averages_data.txt’.

# Variables
* X_train: reads X_train data
* y_train: reads y_train data
* subject_train: reads subject_train data
* X_test: reads X_test data
* y_test: reads y_test data
* subject_test: reads subject_test data
* X_data: merges X train and test data
* y_data: merges y train and test data
* subject_data: merges subject train and test data
* featuresdat and activityname give correct labels and names, respectively.
* all_data: merges the vars X_data, y_data and subject_data into a data set.
* avgsofdata stores data with averages of each variable for each subject and activity. 
