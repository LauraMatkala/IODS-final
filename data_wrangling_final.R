#Laura Matkala, laura.matkala@helsinki.fi
#December 18th 2017
#Data wrangling file for the IODS course final assignment

#This file includes all the data wrangling I did for the final assignment of the IODS course.
#I chose to use the dataset Boston. I will perform linear and logistic regression to variable "crim".
#The dataset is fine as it is now for linear regression. 
#For logistic regression I need to change "crim" into a categorical variable


#First I need to access the data, which is in the package MASS. I have installed the package beforehand.

library(MASS)
data<-Boston
str(data) # with this one can check the structure of the data. Boston seems to have 506 observations of 14 variables, which are mostly numeric. 
summary(Boston) # This shows the summary of all variables, their means, min. and max. values, 1st and 3rd quantiles. 


#This is the part where I mutate "crim" into a categorical variable called "crime"
#I will keep both "crim" and "crime" in the dataset

class(data)
data<-as.data.frame(data)
bins <- quantile(data$crim)
crime <- cut(data$crim, breaks = bins, include.lowest = TRUE, label=c("low", "med_low", "med_high", "high")) 
data<- data.frame(data, crime)

# I will save the dataset as a csv file 

write.csv(data, file = "C:/HY-Data/MATKALA/GitHub/IODS-final/Boston.csv", row.names = FALSE)
