print('hello R')

# data types
# --> numeric, character, logical
num <- 200
str <- 'hello' 
bool <- TRUE 

# vector, factor
puppy <- c('dog', 'cat', 'cat')
puppy <- as.factor(puppy)
class(puppy)

# date
today <- as.Date('2023-09-09')
class(today)


# create new variables
income <- 6000
expense <- 3200
saving <- income - expense
saving

8000 -> income
income

# remove variable
rm(saving)

# create function

my_sum <- function(num1, num2=10) {
  num1 + num2
}

my_sum(10, 15)
my_sum(12)


# call function in library
library(glue)

my_name <- 'alohadancemeow'
my_age <- 100

glue('Hello my name is {my_name}. i am {my_age} years old.')



# create greeting function
hello <- function(name) {
  glue('Hello {name}')
}

hello('alohadncemeow')


# data structures
# --> vector, matrix, list, dataframe

# 1.vector
1:10
seq(from=1, to=100, by=4)

my_friends <- c('A', 'B', 'C', 'D', 'E', 'F')
ages <- c(34, 32, 22, 23, 21, 20)
movie_lover <- c(T,F,T,F,T,F)


# 2.matrix
m1 <- matrix(1:25,nrow = 5, ncol = 5, byrow = T)
ncol(m1)
nrow(m1)
dim(m1)


# 3. list
customer_data <- list(
  id = 1,
  name = 'A',
  location = 'Bangkok',
  language = 'Engish'
)
# access list
customer_data$name
customer_data$location
customer_data[[4]]

# nested list
customers <- list(
  customer_01 = list(
    name = 'B',
    location = 'Tokyo'
  ),
  customer_02 = list(
    name = 'C',
    location = 'London'
  ),
  customer_03 = list(
    name = 'D',
    location = 'Hokaido',
    movie_lover = T,
    visit_back = T,
    account_balance = 2000
  )
)

# access nested list
customers$customer_01$name
customers$customer_03
customers[[2]] # --> customer_02
customers[[3]][[5]] # --> account_balance


# 4.dataframe
df <- data.frame(id = 1:6, my_friends, ages, movie_lover)
dim(df)

# view dataframe
View(df)

# write and read csv file
write.csv(df, 'friends.csv', row.names = F)

friends <- read.csv('friends.csv')
View(friends)


# subset dataframe
friends[1:2, 1:3]
friends[1:4, ]
friends[c(1,3,5), ]
friends[, 1:2]
friends[, c('my_friends', 'ages')]

# with conditions
friends$ages < 30
friends[friends$ages > 30, ]
friends[friends$movie_lover, ]


# create new dataframe
new_friends <- data.frame(
  id = 7:8,
  my_friends = c('G', 'H'),
  ages = c(55, 18),
  movie_lover = c(T,T)
)

# bind row
all_friends <- rbind(friends, new_friends)
all_friends

# add new columns
all_friends$correct_age <- all_friends$ages -1
all_friends


# remove columns
all_friends$ages <- NULL
all_friends

# rename columns 'my_friends' --> 'name'
names(all_friends)[2] <- 'name'
names(all_friends)

# remove rows
mini_friends <- all_friends[-c(6,7), ]
mini_friends


# control flow
# --> if, for, while

# 1.if
score <- 90
if(score >= 80) {
  print('passed')
} else {
  print('failed')
}

check_grade <- function(score) {
  if(score >= 80) {
    print('passed')
  } else {
    print('failed')
  }
}
check_grade(50)

# short hand
ifelse(score >= 80, 'passed', 'failed')

# with many conditions
check_grade2 <- function(score) {
  if(score >= 80) {
    print('A')
  } else if(score >= 70) {
    print('B')
  } else if(score >= 60) {
    print('C')
  } else if(score >= 50) {
    print('D')
  } else {
    print('failed')
  }
}

check_grade2(99)

# 2.for loop
number <- c(10,20,30,40,50)
for(num in number) {
  print(num *2)
}

# --> using element wise
number * 2

friends <- c('A', 'B', 'C')
for(friend in friends) {
  print(paste('Hello', friend))
}
paste('Hello', friends)


# 3.while loop
x <- 0
while(x < 10) {
  print('hello')
  x <- x + 1
}

# input --> default 'character'
as.numeric(readline('what is your name ?'))

check_in <- function() {
  user_name <- readline('What is your name: ')
  password <- readline('What is your password: ')
  
  admins <- c('A', 'B', 'C')
  # user_name == 'A'
  # user_name %in% admins
  
  if(user_name %in% admins & password == '101') {
    print('Login successfully')
  } else {
    print('Please check username and password')
  }
}

check_in()






