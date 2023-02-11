# CodeBook


This file describes the variables, the data, and any transformations or work that I performed to clean up the data.

## Transformations

1. After loading the complete data of the data set. Test and train datasets were merged into a bigger unique dataset, I used the following functions:
* rbind
* cbind

2. In this study, not all variable were useful, so as to make the processing process less demanding on performance and time, a filter was create. Only a subset of variables of the dataset was finally taken into account.
3. The third step was to use descriptive activity names to name the activities in the dataset, It required the *activities* dataset formed by pairs of numeric-code/activity-name to ensure our full dataset was correct.
4. After this process, many variable names were renamed so as to have more descriptive labels in our dataset.
5. FInally, a independent table was created as a solution, which included the average of each variable for each activity and each subject of the dataset.
