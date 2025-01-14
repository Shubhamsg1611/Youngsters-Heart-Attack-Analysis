# Load required libraries
library(dplyr)
library(tidyverse)      
library(caret)          
library(randomForest)   
library(e1071)          
library(ROCR)          
library(ggplot2)




# Load dataset
data <- read.csv("heart_attack_youngsters_india.csv")

# View the first few rows
head(data)

# Check structure
str(data)

# Convert categorical variables to factors
data$Gender <- as.factor(data$Gender)
data$Region <- as.factor(data$Region)
data$Urban.Rural <- as.factor(data$Urban.Rural)
data$SES <- as.factor(data$SES)
data$Smoking.Status <- as.factor(data$Smoking.Status)
data$Alcohol.Consumption <- as.factor(data$Alcohol.Consumption)
data$Diet.Type <- as.factor(data$Diet.Type)
data$Physical.Activity.Level <- as.factor(data$Physical.Activity.Level)
data$Family.History.of.Heart.Disease <- as.factor(data$Family.History.of.Heart.Disease)
data$Diabetes <- as.factor(data$Diabetes)
data$Hypertension <- as.factor(data$Hypertension)
data$Heart.Attack.Likelihood <- as.factor(data$Heart.Attack.Likelihood)

# Check for missing values
colSums(is.na(data))

# Normalize numeric columns (e.g., Cholesterol, BMI)
data <- data %>%
  mutate(across(where(is.numeric), scale))

# Age Distribution (Histogram for Age)
ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 2, fill = "red", color = "black", alpha = 0.7) +
  labs(title = "Age Distribution", x = "Age", y = "Count") +
  theme_minimal()

#Gender Distribution (Bar plot for Gender)
ggplot(data, aes(x = Gender, fill = Gender)) +
  geom_bar() +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  theme_minimal()


# Heart Attack Likelihood by Gender (Stacked bar chart)
ggplot(data, aes(x = Gender, fill = Heart.Attack.Likelihood)) +
  geom_bar(position = "dodge") +
  labs(title = "Heart Attack Likelihood by Gender", x = "Gender", y = "Count", fill = "Heart Attack") +
  theme_minimal()

# Physical Activity vs. Heart Attack Likelihood (Grouped bar plot for Physical Activity and Heart Attack Likelihood)
ggplot(data, aes(x = Physical.Activity.Level, fill = Heart.Attack.Likelihood)) +
  geom_bar(position = "dodge") +
  labs(title = "Physical Activity vs Heart Attack Likelihood", x = "Physical Activity Level", y = "Count", fill = "Heart Attack") +
  theme_minimal()

# Sleep Duration Distribution (Density plot for Sleep Duration)
ggplot(data, aes(x = Sleep.Duration..hrs.day., fill = Heart.Attack.Likelihood)) +
  geom_density(alpha = 0.5) +
  labs(title = "Sleep Duration Distribution", x = "Sleep Duration (hrs/day)", y = "Density") +
  theme_minimal()

# Bar plot for gender distribution
ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "red") +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  theme_minimal()

# Create training and testing sets (80% training, 20% testing)
set.seed(123)
trainIndex <- createDataPartition(data$Heart.Attack.Likelihood, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Train a Random Forest model
rf_model <- randomForest(Heart.Attack.Likelihood ~ ., data = trainData, ntree = 500, mtry = 3)
print(rf_model)

# Make predictions on the test set
rf_predictions <- predict(rf_model, testData)

# Confusion matrix
confusionMatrix(rf_predictions, testData$Heart.Attack.Likelihood)

# ROC Curve and AUC
pred <- prediction(as.numeric(rf_predictions), as.numeric(testData$Heart.Attack.Likelihood))
perf <- performance(pred, "tpr", "fpr")
plot(perf, col = "blue", main = "ROC Curve")
auc <- performance(pred, "auc")
print(auc@y.values[[1]])

# Predict for new data (if available)
new_data <- testData[1:5, ]  # Example: Taking the first 5 rows from test set
predictions <- predict(rf_model, new_data)
print(predictions)