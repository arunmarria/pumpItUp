#loading libraries 
library(dplyr)
library(ggplot2)
library(readr)
library(tidyverse)
library(knitr)
library(repr)


# reading data

test_df <- read_csv("../data/testFeatures.csv") # test data for ranking in competition
pumps_df <- read_csv("../data/trainFeatures.csv")
temp_df <- read_csv("../data/trainLabels.csv") 
pumps_df <- merge(pumps_df, temp_df, by = "id" ) #actual data for train


head(pumps_df)

# exploring dataset
str(pumps_df)


# visualizing and exploring columns


# functions for plots

# boxplots

func_boxplot <- function(df, cat_column, numeric_column){
  
  p <- ggplot(df, aes(x ={{cat_column}}, y = {{numeric_column}})) +
    geom_boxplot(fill = "royalblue3", alpha =0.2) + 
    theme(panel.background = element_rect(fill = "lavender"))
    
    
  p
}

# Working on column amount_tsh 


unc_boxplot(pumps_df, status_group, amount_tsh)

#clearly most of the values are NAs

table(pumps_df$amount_tsh)





