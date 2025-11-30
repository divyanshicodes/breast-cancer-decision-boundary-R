# Breast Cancer Decision Boundary Visualization
# Author: Divyanshi Mishra

# Required packages
# install.packages("MASS")
# install.packages("naivebayes")
# install.packages("FNN")

library(MASS)
library(naivebayes)
library(FNN)

# 1. Load data
# The file breast_cancer_normalized.RData should contain:
#   train  with radius, texture, diagnosis
#   test   with radius, texture grid points
load("breast_cancer_normalized.RData")

# Inspect data
head(train)
str(train)
head(test)

# Make sure diagnosis is a factor
train$diagnosis <- as.factor(train$diagnosis)
table(train$diagnosis)

# Separate features for KNN
train_x <- train[, c("radius", "texture")]
train_y <- train$diagnosis
test_x  <- test[, c("radius", "texture")]

# Function to plot decision boundary from predictions
plot_boundary <- function(test_data, preds, main_title) {
  plot(test_data$radius,
       test_data$texture,
       col = preds,
       pch = 16,
       cex = 0.4,
       xlab = "Radius",
       ylab = "Texture",
       main = main_title)
}

# 2. KNN with k = 3
set.seed(123)
knn3_pred <- knn(train = train_x,
                 test  = test_x,
                 cl    = train_y,
                 k     = 3)

plot_boundary(test, knn3_pred, "Decision Boundary   KNN   k = 3")

# 3. KNN with k = 20
set.seed(123)
knn20_pred <- knn(train = train_x,
                  test  = test_x,
                  cl    = train_y,
                  k     = 20)

plot_boundary(test, knn20_pred, "Decision Boundary   KNN   k = 20")

# 4. LDA
lda_model <- lda(diagnosis ~ radius + texture, data = train)
lda_pred  <- predict(lda_model, newdata = test)$class

plot_boundary(test, lda_pred, "Decision Boundary   LDA")

# 5. QDA
qda_model <- qda(diagnosis ~ radius + texture, data = train)
qda_pred  <- predict(qda_model, newdata = test)$class

plot_boundary(test, qda_pred, "Decision Boundary   QDA")

# 6. Naive Bayes
nb_model <- naive_bayes(diagnosis ~ radius + texture, data = train)
nb_pred  <- predict(nb_model, newdata = test, type = "class")

plot_boundary(test, nb_pred, "Decision Boundary   Naive Bayes")
