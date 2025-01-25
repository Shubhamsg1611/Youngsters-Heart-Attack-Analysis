# Youngsters-Heart-Attack-Project
![](https://www.datascienceportfol.io/static/profile_pics/pr30_EC1C0F1E844F46CDB662.jpg)

The Youngsters Heart Attack Data Analysis and Machine Learning Project focuses on analyzing a comprehensive health dataset to predict health outcomes such as diabetes and heart attack likelihood. The project uses machine learning algorithms and various data analysis techniques to provide insights into how lifestyle factors, biometric measurements, and health conditions influence the likelihood of these health issues.

## Objectives:

- **Exploratory Data Analysis (EDA):** Uncover patterns and relationships in the data.
- **Visualization:** Create visual representations to better understand feature distributions and correlations.
- **Machine Learning:** Build and evaluate models to predict the likelihood of diabetes and heart attack.
- **Model Evaluation:** Compare model performance based on various metrics, including accuracy, precision, recall, F1-score, and AUC.

## Programming Language & Libraries:

- Programming Language: R

```
tidyverse: For data manipulation and visualization.
ggplot2: For detailed visualizations.
caret: For machine learning model building and evaluation.
dplyr: For efficient data manipulation.
GGally: For correlation matrices and pair plots.
e1071: For implementing machine learning algorithms.
ROCR: For ROC curves and AUC calculation.
```

## Dataset Description:

The dataset consists of demographic, lifestyle, biometric, and health-related features of individuals. Key columns include age, gender, region, socioeconomic status, smoking and alcohol habits, diet type, physical activity level, screen time, sleep duration, BMI, cholesterol, blood pressure, family history of heart disease, and presence of conditions like diabetes and hypertension. The target variables are Diabetes and Heart Attack Likelihood, labeled as "Yes" or "No."

## Project Steps:

1. Data Preprocessing
2. Exploratory Data Analysis
3. Data Visualization
4. Machine Learning
5. Model Evaluation
6. Insights

## Model Performance:

- **Heart Attack Likelihood:** The Random Forest model achieved an AUC of 0.5, which suggests a need for further model improvements, such as addressing class imbalance and tuning hyperparameters.
- **Class Imbalance:** The model shows a strong bias towards predicting the majority class ("No"), which may affect its ability to detect rare events like heart attacks ("Yes").

## Conclusion:

The machine learning models developed in this project aimed to predict health outcomes such as heart attack likelihood and diabetes. While the Random Forest model showed decent accuracy for predicting "No" (no heart attack), it struggled with detecting the "Yes" class (heart attack), likely due to class imbalance. The model's performance, reflected in an AUC of 0.5, indicates the need for further improvements, such as handling class imbalance, tuning model parameters, and exploring other algorithms. Overall, the project demonstrates the potential of machine learning in health prediction but also highlights areas for model optimization.
