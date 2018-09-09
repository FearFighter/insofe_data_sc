
##----------------------------------------------------------------------------------##
##------------------------ SIMPLE LINEAR REGRESSION MODEL --------------------------##
##----------------------------------------------------------------------------------##


##--- Step 1: Clear environment variables ------------------------------------------##
rm(list=ls())

##__________________________________________________________________________________##


##--- Step 2: Set working Directory ------------------------------------------------##
# do i really need to do this ?

##__________________________________________________________________________________##


##--- Step 3: Read the data --------------------------------------------------------##
path = "/Users/amithprasad/repos/insofe_data_sc/20180902/20180902_Batch_47_CSE_7302c_Lab01_SimpleLinearRegression_2/Toyota_SimpleReg.csv"
toyota = read.delim(path,sep=",",header=TRUE)

##__________________________________________________________________________________##


##--- Step 4: Perform Exploratory Data Analysis and Data Pre-processing-------------##
str(toyota)
summary(toyota)
## Drop any irrelevant attribute(s)
toyota_reqrd = subset(toyota,select = c('Price','Age_06_15'))

## Summary of the data and look for any missing values
summary(toyota_reqrd)
sum(is.na(toyota_reqrd))
## Generate Scatter Plot
plot(toyota_reqrd$Age_06_15,toyota_reqrd$Price,
     main = "Price vs Age",
     ylab = "Price",
     xlab = "Age",
     col = "blue",lwd = 1)

## Covariance and Correlation between the attributes
covariance = cov(toyota_reqrd$Age_06_15,toyota_reqrd$Price);
covariance
correlation = cor(toyota_reqrd$Age_06_15,toyota_reqrd$Price);
correlation
# Do the attributes have a good enough Correlation Coefficient to support linear regression model building?
# Age is -vely related and highly correlated to price

##__________________________________________________________________________________##


##--- Step 5: Split the data into train and test datasets --------------------------##
rows = seq(1,nrow((toyota_reqrd)))
trainRows = sample(rows,(70*nrow(toyota_reqrd))/100)
trainRows
train = toyota_reqrd[trainRows,]
test = toyota_reqrd[-trainRows,]
dim(train)
dim(test)
##__________________________________________________________________________________##


##--- Step 6: Linear Regression Model building--------------------------------------##
lineFit = lm(train$Price~.,data=train)

## Summary of the model
summary(lineFit)

# Extract the coefficients from the linear regression model
# beta_0 = 26211.548
# beta_1 = -172.209
# price = 26211.548 - 172.209(age)

# Extract the residual values
abline(lineFit,col="red",lwd=2);
grid(10,10,lwd=1)

##__________________________________________________________________________________##


##--- Step 7: Check for validity of linear regression assumptions ------------------##
#HINT: plot the 4 graphs to check. Write your comments

# extracting the residuals
plot(lineFit$residuals,ylab="Residuals",main="Residuals",col = 'brown', lwd = 2)

# residual plot
plot(lineFit$fitted.values,lineFit$residuals,main = "Residual vs Predicted values", col = 'brown',lwd = 2,
     xlab ="Predicted Values / Fitted Values", ylab = "Residuals")
abline(h = 0,col = 'blue',lwd  =2)
grid(10,10,lwd=1)

# q-q plot
qqnorm(residuals, col = "red", pch = 1, frame = FALSE)
qqline(residuals, col = "steelblue", lwd = 2)

par(mfrow = c(2,2))
plot(lineFit)

# residuals plot analysis -> data points show no other pattern wrt to zero residual line - so the linear assumption is not violated
# q-q plot analysis -> the line almost fits the residual scatter plot - so the normal distribution of errors assumption is not violated
# heteroscadasticity test - the data is not diverging or converging - so the assumption of homosacdasticity of covariance is not violated
# there appears to be one influencial or leverage point
# ----------------------


##__________________________________________________________________________________##


##--- Step 8: Predict on testdata --------------------------------------------------##
pred <- predict(lineFit, test)
pred
##__________________________________________________________________________________##

pred_train <- predict(lineFit, train)
pred_train
##--- Step 9: Error Metrics --------------------------------------------------------##


# Error verification on train data
MSE.lm <- sum((pred_train - train$Price)^2)/nrow(train)
MSE.lm

ssr = sum((pred_train - mean(train$Price))^2)
ssr

sse = sum((train$Price - pred_train)^2)
sse

sst = sum((train$Price - mean(train$Price))^2)
sst

sum_ssr_sst = ssr+sse
sum_ssr_sst

r_square = 1 - (ssr/(sse + ssr))
r_square

#  r_square = 76.77185% , good predictor on train data

# Error verification on test data
MSE.lm <- sum((pred - test$Price)^2)/nrow(test)
MSE.lm

sse = sum((pred - mean(test$Price))^2)
sse

ssr = sum((pred - test$Price)^2)
ssr

sst = sum((test$Price - mean(test$Price))^2)
sst

r_square = 1 - (ssr/(sse + ssr))
r_square

#  r_square = 77.9399% , good predictor on test data

##__________________________________________________________________________________##


##--- Step 10: Confidence and Prediction Intervals----------------------------------##
# Find the confidence and prediction intervals and plot them for the WHOLE dataset


##__________________________________________________________________________________##

#--------------------------------------END------------------------------------------##