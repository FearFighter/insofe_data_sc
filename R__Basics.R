## ----setup, include=FALSE------------------------------------------------

## ------------------------------------------------------------------------
# An addition
3 + 4


# A subtraction
5 - 5 

# A multiplication
3 * 5

# A division
(5 + 7) / 2 

# Exponentiation (^)
10^2

# Modulo (%%)
10%%2

# Few Examples

2+3^2
(2+2)^4
sqrt(2) # Squareroot
log(100)  # default base is exp
log(x = 100, base = 10)


## ------------------------------------------------------------------------

# Multiply 13 with 9 and then subtract 10 and add 35?
# Divide this result by 42 
# What will be the final output?


## ------------------------------------------------------------------------

#### R works with numerous data types. Some of the most basic types to get started are:
####  i) Decimals values like 4.5 are called numeric.
####  ii) Natural numbers like 4 are called integers. Integers are also numeric.
####  iii) Boolean values (TRUE or FALSE) are called logical.
####  iv) Text (or string) values are called characters

# Declare variables of different types
my_numeric <- 42
my_character <- "Universe"
my_logical <- FALSE
my_complex <- 10 + 11i

# Check class of my_numeric, my_character and my_logical
class(my_numeric)
class(my_character)
class(my_logical)
class(my_complex)


## ------------------------------------------------------------------------
# Assign the value 42 to x. # The <- symbol is the assignment operator.
x <- 42   ## nothing printed

# Print out the value of the variable x
 
x 		   ## auto-printing occurs
print(x) ## explicit printing

# Assiging a value and performing operations

x <- 6
y = 10
z <- x+y
z



## ------------------------------------------------------------------------

# Assign a value to the variables my_apples and my_oranges
# Add these two variables together
# Create a variable my_fruit to store the sum of my_apples and my_oranges


## ------------------------------------------------------------------------

# The : operator is used to create sequences.
x <- 1:20
x

y <- 20:1
y

cat(paste('','\n'))     # Adding newline separator

# Sequencing Numbers using seq
# Using the “seq()” function we can produce a vector of numbers between a specified interval with a particular increment

myseq1=seq(1,5, by=0.5)
myseq1

myseq2=seq(length=10, from=2, by=0.5)
myseq2

myseq3 <- seq(from = 0, to = 100, by = 10)
myseq3

# Replicating a number
rep1<-rep(1,10)
rep1

# Try with character object


## ------------------------------------------------------------------------

# i) Vectors are one-dimension arrays that can hold numeric data, character data, or logical data. 
# ii) In R, you create a vector with the combine function - c(). You place the vector elements separated by a comma between the parentheses.

numeric_vector <- c(1,2,3,4,5)                   # numeric vector
character_vector <- c("a","b","c","d","e")       # character vector
boolean_vector <- c(TRUE,FALSE,TRUE,FALSE,TRUE)  # logical vector

str(numeric_vector)       # to view the structure of the vector
length(numeric_vector)  # to get number of elements in the vector

str(character_vector)

str(boolean_vector)

# Functions applied on vector
v4 <- c(10,9,8,7,6,5)
max(v4)
min(v4)
mean(v4)
v4[c(1,3)] # To get 1st and 3rd element from the vector v4
v4[c(2:5)] # To get 2nd to 5th element
v4[v4 > 8] # To get elements which are greater than 8




## ------------------------------------------------------------------------

DOW <- c("04-Jun","05-Jun","06-Jun","07-Jun","08-Jun","09-Jun","10-Jun")
names(DOW) <- c("Mon","Tue","Wed","Thu","Fri","Sat","Sun") 
DOW





## ------------------------------------------------------------------------

# Finding the sum of two vectors
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector+B_vector

# Print out total_vector
total_vector


## ------------------------------------------------------------------------

# Create a vector that contains numbers between the interval of 1 to 2500, with an increment of 6.
# Subset the first 50 elements of that vector


## ------------------------------------------------------------------------
# Try creating following vectors -

# For poker_vector:
# On Monday you won $140
# Tuesday you lost $50
# Wednesday you won $20
# Thursday you lost $120
# Friday you won $240

# For roulette_vector:
# On Monday you lost $24
# Tuesday you lost $50
# Wednesday you won $100
# Thursday you lost $350
# Friday you won $10


# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
poker_vector

# Roulette winnings from Monday to Friday

# Find the poker and roulette winnings from Monday to Friday


## ------------------------------------------------------------------------

# Create a vector Player with two elements. Assign column names as "Name" and "Profession". Print the result.


## ------------------------------------------------------------------------

# Matrices are tabular data structures that store data of a single type
# Matrices can be constructed using the “matrix()” function

m1 <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)
m1

m2 <- matrix(1:6, nrow = 2, ncol = 3)  # here byrow=FALSE by default
m2

# Constructing Matrices from vectors using cbind-ing and rbind-ing

x <- c(1:3)
y <- c(10:12)

cbind(x, y)

rbind(x, y)



## ------------------------------------------------------------------------

matrix_one <- matrix(c(1:9), nrow = 3, ncol = 3)

matrix_two <- matrix(c(10:18), nrow = 3, ncol = 3)

matrix_one

matrix_two

matrix_two - matrix_one

matrix_two * matrix_one

matrix_two %*% matrix_one


## ------------------------------------------------------------------------

matrix_example <- matrix(data = c(1:12), nrow = 3, ncol = 4)

matrix_example

# Let’s subset the element from the third row and the 4th column using the “[ ]” operator

matrix_example[3, 4]

# Most of the subsetting rules for vectors can be expanded to matrices in two dimensions


## ------------------------------------------------------------------------

# Create a matrix with 4 rows and 3 columns having Months of the year e.g. "Jan", "Feb", etc. as values
# Create a matrix by combining following vectors using rbind and cbind -
  ## vector_sub <- c(1, 2, 3, 4)
  ## vector_sub2 <- c(8, 16, 24, 32)


## ------------------------------------------------------------------------

# What is a dataframe?
# i) A data frame has the variables of a data set as columns and the observations as rows. Its a tabular structure.
# ii) Columns can hold different data types but of same dimensions

x <- data.frame(Age = c(25,30,35,40), Working = c(T, T, F, F))
x
str(x)
nrow(x)
ncol(x)
names(x)

x$Age

# Another Example
y <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
y


## ------------------------------------------------------------------------

# Few examples

# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name,type,diameter,rotation,rings)
planets_df

# The planets_df data frame from the previous exercise is pre-loaded

# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]

# Print out data for Mars (entire fourth row)
planets_df[4,]

# Selection of data frame elements 
# 
# Instead of using numerics to select elements of a data frame, you can also use the variable names to select columns of a data frame.
# 
# Suppose you want to select the first three elements of the type column. One way to do this is

planets_df[1:3,2]

# A possible disadvantage of this approach is that you have to know (or look up) the column number of type, which gets hard if you have a lot of variables. It is often easier to just make use of the variable name:

planets_df[1:3,"type"]

str(planets_df)

#### Select first 5 values of diameter column
planets_df[1:5,"diameter"]

planets_df[,3]
planets_df[,"diameter"]

# There is a short-cut for above command. If your columns have names, you can use the $ sign to fetch all the values:
planets_df$diameter


## ------------------------------------------------------------------------

# A list in R allows you to gather a variety of objects under one name (that is, the name of the list) in an ordered way. These objects can be matrices, vectors, data frames, even other lists, etc. Lists can hold objects of different data types and different dimensions and hence enable us to bundle together a collection of heterogenous elements.

first_list <- list("a" = c(1, 2, 3), "b" = TRUE, "c" = 20)
first_list

# Subsetting elements of a list
# When we use “[ ]” to subset a list, we get an object of the list type with the element at the specified position
first_list[1]
first_list[2]
first_list[3]

# Another Example
# Vector with numerics from 1 up to 10
my_vector <- c(1:10) 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# Print out built-in R data frame
mtcars
dim(mtcars)

# Investigate the structure of mtcars
str(mtcars)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector,my_matrix,my_df)
my_list

# Adapt list() call to give the components names
names(my_list) <- c("vec","mat","df")

# Print out my_list
my_list


## ------------------------------------------------------------------------

# if statement
x = 1

if(x > 0){
  print("Positive Number")
}

# if else statement
x = -1
if(x > 0){
  print("Positive number")
} else {
  print("Negative number")
}

# Nested if...else statement
x = 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

# ifelse() function
a = c(5,7,2,9)
ifelse(a %% 2 == 0, "even", "odd")


## ------------------------------------------------------------------------

x = c(2, 5, 3, 9, 8, 11, 6)
count = 0
for (val in x) {
  if(val %% 2 == 0)  
    count = count+1
    print(count)
}

count

x %% 2

# while loop
i = 1
while (i < 6) {
  print(i)
  i = i+1
}

# break statement
x = 1:5

for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}

# next statement
x = 1:5


## ------------------------------------------------------------------------


# What's a factor and why would you use it?

# The term factor refers to a statistical data type used to store categorical variables. The difference between a categorical variable and a continuous variable is that a categorical variable can belong to a limited number of categories. A continuous variable, on the other hand, can correspond to an infinite number of values.

# It is important that R knows whether it is dealing with a continuous or a categorical variable, as the statistical models you will develop in the future treat both types differently. (You will see later why this is the case.)

x <- factor(c("1", "2", "2", "1","1","2","1","2","2"))
x

# A good example of a categorical variable is sex. In many circumstances you can limit the sex categories to "Male" or "Female". (Sometimes you may need different categories. For example, you may need to consider chromosomal variation, hermaphroditic animals, or different cultural norms, but you will always have a finite number of categories.)

# Category vector
category_vector <- c("Male", "Female", "Female", "Male", "Male")
typeof(category_vector)
# Convert Category_vector to a factor
factor_category_vector <- factor(category_vector)

# Print out factor_category_vector
factor_category_vector

# Another example

# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector

# Create speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")

# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector,order=TRUE,levels = c("slow","medium","fast"))

# Print factor_speed_vector
factor_speed_vector

summary(factor_speed_vector)

# Create factor_speed_vector
#speed_vector <- c("medium", "slow", "slow", "medium", "fast")
#factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))
#factor_speed_vector

# Factor value for second data analyst
da2 <- factor_speed_vector[2]
da2

# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]
da5

# Is data analyst 2 faster than data analyst 5?
da2>da5


