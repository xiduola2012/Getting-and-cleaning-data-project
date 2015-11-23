features: the dataset created from features.txt - feature names

activity_label: dataset created from activity_labels.txt - activity names

test_data: dataset created from X_text.txt, the main test data
test_label: dataset created from y_test.txt, containing all the labels for test data
test_sub: dataset created form subject_test.txt, containing the subject for test data

test_whole: dataset with test_data, test_label, test_sub combined

train_data: dataset created from X_train.txt, the main train data
train_label: dataset created from y_train.txt, containing all the labels for train data
train_sub: dataset created form subject_train.txt, containing the subject for train data

train_whole: dataset with train_data, train_label, train_sub combined

combine_data: combine test_whole and train_whole together

feature_chosen: features that are means or stds

data: created from combine_data, with only subject, activity, and mean/std variables

final_data: created from data, with the mean of each variable for a specific subject and activity pair

final_data_file: the final tidy data in a txt file
