#Laura Matkala, laura.matkala@helsinki.fi
#December xxth 2017
#Data wrangling file for the IODS course final assignment

#This file includes all the data wrangling I did for the final assignment of the IODS course.
#I chose to use the dataset Boston. I will perform linear and logistic regression to variable "crime".
#First I need to access the data, which is in the package MASS.

library(MASS)
data<-Boston
str(data) # with this one can check the structure of the data. Boston seems to have 506 observations of 14 variables, which are mostly numeric. 
summary(Boston) # This shows the summary of all variables, their means, min. and max. values, 1st and 3rd quantiles. 
#Based on the summary I can tell that different variables have rather different scales. Some have very low values, some very high.
#In order to be able to handle the dataset it needs standardization

#The next step is to standardize the dataset and turn the variable currently named as "crim" to a categorical variable "crime", which can be used in the analysis.

boston_scaled <- scale(Boston) #scaling the dataset
summary(boston_scaled) #checking what the data looks like now. The scales are now similar for different variables, which was exactly what I was hoping for.
class(boston_scaled)
boston_scaled<-as.data.frame(boston_scaled)
bins <- quantile(boston_scaled$crim)
crime <- cut(boston_scaled$crim, breaks = bins, include.lowest = TRUE, label=c("low", "med_low", "med_high", "high")) # this puts the crime rate into different classes instead of numbers, which aren't as easy to understand.
boston_scaled <- dplyr::select(boston_scaled, -crim)
boston_scaled <- data.frame(boston_scaled, crime)


str(boston_scaled) #yes, variable crime is now factorial

# I will save the dataset as a csv file 

Boston<-write.csv()
