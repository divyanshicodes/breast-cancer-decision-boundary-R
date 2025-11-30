# Breast Cancer Decision Boundary in R

This project visualizes decision boundaries for breast cancer diagnosis models using two features   radius and texture. The models are trained on a normalized breast cancer dataset and predictions are made over a grid of points in the feature space to display how each classifier separates benign and cancer cases.

## Problem Statement

Given a training set of breast cancer observations with two predictors and a binary diagnosis label, the goal is to compare several classification methods by plotting their decision boundaries. Each point in an artificial test grid represents a possible combination of radius and texture, and the models assign a predicted class to each point. The boundary between colors shows how the classifier separates the two classes.

## Models Used

* K nearest neighbors with k equal to 3  
* K nearest neighbors with k equal to 20  
* Linear discriminant analysis LDA  
* Quadratic discriminant analysis QDA  
* Naive Bayes  

## Steps Performed

* Load train and test data from breast cancer normalized RData  
* Convert diagnosis into a factor  
* Prepare feature matrices for KNN radius and texture  
* Train KNN models with k equal to 3 and k equal to 20 and predict on the grid test set  
* Train LDA, QDA, and Naive Bayes models and predict on the same grid  
* Plot radius on the x axis and texture on the y axis and color each point by its predicted class to visualize the decision boundary

## Tools

* R and RStudio  
* MASS  
* FNN  
* naivebayes
