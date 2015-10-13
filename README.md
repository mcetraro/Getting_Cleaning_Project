# Getting_Cleaning_Project

This repo contains the following files:

(1) run_analysis.R  (R script)
(2) Averages.txt    (Output text file)
(3) Codebook.md     (Description of varibles)
(4) README.md       (Description of the repository)

The dataset used for this analysis was:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script run_analysis.R contains several steps.  These are:

	Libraries requeried.
	Join of train and test datasets to simplify the process.
	Extract the mean and std from the features text file.
	Extract the activities labels to name the columns of the activities dataset.
	Name the subject column of the subject dataset.
	Create a tidy dataset with the average of each variable for each activity and each subject.
	Write out the created tidy table.
