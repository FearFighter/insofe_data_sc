# Housekeeping
rm(list = ls())
setwd("~/Dropbox/insofe/data_viz")
library(tidyverse)

View(iris)

iris %>% 
  View()

iris %>% 
  ggplot(aes(x = Sepal.Length, 
             y = Sepal.Width)) + 
  geom_point(size = 4)

iris %>% 
  str()

iris %>% 
  ggplot(aes(x = Sepal.Length, 
             y = Sepal.Width, 
             colour = Species)) + 
  geom_point(size = 2)

# Scatterplot exercise
# 2 - variable plot (numeric vs numeric)

# Look for high performers, low performers, average performers, and possibly 1 CEO of the company
# Look for trends, correlations
# Identify bounds of the variables
# Give fixed size and alpha to check overplotting!

# Basic scatter plot
"salary_data.csv" %>% 
  read_csv() %>% 
  ggplot(aes(x = experience, 
             y = salary)) + 
  geom_point() 

# Add titles and change theme
"salary_data.csv" %>% 
  read_csv() %>%
  ggplot(aes(x = experience, 
             y = salary)) + 
  geom_point() + 
  labs(title = "Employee Salary vs Experience",
       x = "Experience in years",
       y = "Salary in lakhs per annum") +
  theme_minimal()

# Add Transparency and point size
"salary_data.csv" %>% 
  read_csv() %>% 
  ggplot(aes(x = experience,
             y = salary))  +
  geom_point(size = 5, 
             alpha = 0.5) + 
  labs(title = "Employee Salary vs Experience",
       x = "Experience in years",
       y = "Salary in lakhs per annum") +
  theme_minimal() + 
  theme(axis.text.x = element_text(size = 20))

