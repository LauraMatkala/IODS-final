#Laura Matkala, laura.matkala@helsinki.fi
#December xxth 2017
#Data wrangling file for the IODS course final assignment

#This file includes all the data wrangling I did for the final assignment of the IODS course.
#I chose to use the dataset Boston. I will perform linear and logistic regression to variable "crim".
#First I need to access the data, which is in the package MASS.

library(MASS)
data<-Boston
str(data) # with this one can check the structure of the data. Boston seems to have 506 observations of 14 variables, which are mostly numeric. 
summary(Boston) # This shows the summary of all variables, their means, min. and max. values, 1st and 3rd quantiles. 
#Based on the summary I can tell that different variables have rather different scales. Some have very low values, some very high.

#In order to be able to handle the dataset it needs standardization
#boston_scaled <- scale(Boston) #scaling the dataset
#summary(boston_scaled) #checking what the data looks like now. The scales are now similar for different variables, which was exactly what I was hoping for.

#The dataset is fine as it is now for linear regression that I chose to do for the data. 
#However, for logistic regression, that I will later perform I need to change "crim" into a categorical variable
#I will keep both "crim" and "crime" in the dataset

#class(boston_scaled)
#boston_scaled<-as.data.frame(boston_scaled)
#bins <- quantile(boston_scaled$crim)
#crime <- cut(boston_scaled$crim, breaks = bins, include.lowest = TRUE, label=c("low", "med_low", "med_high", "high"))
#boston_scaled <- data.frame(boston_scaled, crime)

class(data)
data<-as.data.frame(data)
bins <- quantile(data$crim)
crime <- cut(data$crim, breaks = bins, include.lowest = TRUE, label=c("low", "med_low", "med_high", "high"))
data<- data.frame(data, crime)

# I will save the dataset as a csv file 

write.csv(data, file = "C:/HY-Data/MATKALA/GitHub/IODS-final/Boston.csv", row.names = FALSE)
