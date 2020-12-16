#install.packages("reshape2") #delete the # at the beginning of this line if you need to install reshape2
library(reshape2) #this has the melt function that this function also uses

#install.packages("dplyr") #delete the # at the beginning of this line if you need to install dplyr
library(dplyr) # this has the rename function used in platemelter to rename the columns in the resultant dataframe

melterboi <- function(column, startingdf) { #assistant function to the platemelter
  name <- c(startingdf[ ,column]) #where startingdf is  the df produced by importing your csv, column is the number of the ones that contain the data you are interested in
}

#melterboi makes a list of lists of datapoints, each titled after the header for the relevant column
#this is best then melted, as in the platemelter function
#best not to run melterboi, it is written here solely so it can be integrated in to platemelter
#i cant think of another use for it

platemelter <- function(startingdf, time, columns) { #where startingdf is the excel sheet youh have imported, time is the column in that with your time data, and columns is a string of the column numbers you want to extract data from
  plate <- melterboi(columns, startingdf)
  plate <- melt(plate)
  plate <- data.frame(plate, time)
  plate <- rename(plate, data1 = value, wellinfo = L1) #this renames the columns to something more helpful, wellinfo is derived from the column headers in your startingdf
}

example <-platemelter(startingdf = mylovelydata, time = mylovelydata$mins, columns = c(2:50))
#the above line will output a 3 column dataframe called example 
#with a column called time with the timepoints in, retrieved from whereever that may be, could also a vector you have defined separately
#in this example all the inputs are retrieved from the startingdf, but other reasonable options are possible like strings or lists or subsets from other locations etc
#the columns is a string of numbers that will be input to the melterboi to generate the list of datapoints
#the type of table produced here is useful for doing anovas or linear regression models or plotting using ggplot2



