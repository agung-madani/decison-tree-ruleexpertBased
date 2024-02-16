# Advertisement Analysis with Decision Trees

This project uses a decision tree model to analyze an advertisement dataset. The dataset includes features such as `Gender`, `Age`, and `EstimatedSalary`, and the target variable is `Purchased`.

## Libraries Used

- rpart: For creating the decision tree model.
- rpart.plot: For visualizing the decision tree.
- ggplot2: For creating plots.
- caTools: For splitting the dataset into training and test sets.
- caret: For evaluating the model.

## Dataset

The dataset used in this project is "Advertisement.csv". It is split into a training set (80% of the data) and a test set (20% of the data).

## Plots

Two contour plots are created using ggplot2:

1. A contour plot of the training data, with `Age` on the x-axis, `EstimatedSalary` on the y-axis, and points colored by whether the product was purchased.
2. A similar contour plot for the test data.

## Model

A decision tree model is trained on the training data, using the `rpart` function from the rpart library. The model predicts the `Purchased` variable based on `Gender`, `Age`, and `EstimatedSalary`.

## Model Evaluation

The model's performance is evaluated on the test data. The confusion matrix is calculated using the `confusionMatrix` function from the caret library, and the accuracy of the model is printed.
