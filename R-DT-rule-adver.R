library(rpart)
library(rpart.plot)
library(ggplot2)
library(caTools)
library(caret)

dataset <- read.csv("Advertisement.csv")

set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.8)
train_data <- subset(dataset, split == TRUE)
test_data <- subset(dataset, split == FALSE)

ggplot(train_data, aes(x = Age, y = EstimatedSalary, color = factor(train_data$Purchased))) +
  geom_point() +
  geom_density_2d() +
  labs(title = "Contour Plot - Training Data", x = "Age", y = "Estimated Salary", color = "Purchased")

ggplot(test_data, aes(x = Age, y = EstimatedSalary, color = factor(test_data$Purchased))) +
  geom_point() +
  geom_density_2d() +
  labs(title = "Contour Plot - Test Data", x = "Age", y = "Estimated Salary", color = "Purchased")

dt_model <- rpart(Purchased ~ Gender + Age + EstimatedSalary, 
                  data = train_data, method = "class")
rpart.plot(dt_model, fallen.leaves = FALSE, uniform = TRUE, 
           box.palette = "auto", shadow.col = "gray", under = TRUE, 
           varlen = 0, clip.right.labs = TRUE)


summary(dt_model)
predictions <- predict(dt_model, test_data, type = "class")

test_data$Purchased <- factor(test_data$Purchased, levels = levels(predictions))

confusion_matrix <- caret::confusionMatrix(data=predictions,
                                              reference=test_data$Purchased)
fourfoldplot(as.table(confusion_matrix),color=c("green","red"),main = "Confusion Matrix")

accuracy <- confusion_matrix$overall['Accuracy']
print(paste("Accuracy:", accuracy))
