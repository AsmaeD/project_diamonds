# file for data analysis only

## libraries ----

#libraries for data manipulation
library(lubridate)
library(anytime)
library(DT)
library(data.table)
library(dplyr)
library(stringi)

#libraries for data transformation
library(maditr)
library(plotly)

#file for statistical methods application
library(FactoMineR)
library(pls)
library(plsr)
library(corrplot)


## File opening and verification ----
library(datasets)
data("diamonds")
data_diamonds<- diamonds

#keep only a saple of data base
data_diamonds <- data_diamonds[seq.int(from = 1,
                                       to = length(data_diamonds$clarity), 
                                       by=10), ]

#verification or data types
summary(data_diamonds)

#change column names for better understanding
names(data_diamonds) <- c("carat",
                          "cut",
                          "color",
                          "clarity",
                          "depth_relation",
                          "table",
                          "price",
                          "length",
                          "width",
                          "depth" )


## Elementary description ----

#plot of possible realtions between values
plot(data_diamonds[,-c(2,3,4)])

#visualize corrolation
corrplot(cor(data_diamonds[,-c(2,3,4)]))

#isolate all qualitative data 
data_diamonds_quali <- Filter(is.factor, data_diamonds)

#create contengincy table
data_diamonds_cont <- dcast(data_diamonds_quali, 
                            cut ~ color,
                            fun.aggregate = length, 
                            value.var = c('color',
                                          "clarity"
                                          )
                            )



