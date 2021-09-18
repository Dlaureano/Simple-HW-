library(MASS)
myData <- Cars93

#check data type of each column by using str()
str(myData)

#empty values in dataset? Remove empty values 
summary(myData)
#Rear.seat.room, Luggage.room,
x <- myData

x <- na.omit(myData)
summary(x)
str(x)

#remove all columns of Factor type
x <- x[, !(names(x) %in% c("Manufacturer", "Model", "Type",
                              "AirBags", "DriveTrain","Cylinders",
                              "Man.trans.avail","Origin",
                               "Make"))]
str(x)

#Split into training and testing
#first 60 rows are training set and the rest test
#Slit to train and testing
XTrainingSet1 = x[1:60, ]

XTestingSet1 = x[61:82, ]


#linear model to presict horsepower using training data
results <- lm(Horsepower ~ . , data =  XTrainingSet1)
summary(results)


#predict on Testing
predicted_test <- predict(results, XTestingSet1)
predicted_test[1:10]
XTestingSet1$Horsepower[1:10]

# 4. mean squared error = sum((pred - true)^2) / (num row test)
test_MSE <- mean((predicted_test - XTestingSet1$Horsepower)^2)
#square root
sqrt(221.3)

