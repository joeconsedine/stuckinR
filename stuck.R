
# Install and load the readr and gtrendsR packages

installed.packages("readr","gtrendsR","tidyr")
library(readr)
library(gtrendsR)
library(tidyr)
library(dplyr)
library(tidyverse)


raw.data <- read.delim("listbuildtest.csv", header=T, sep=",")
 print(raw.data)
 

 newDataStuff %>%
 mutate(raw.data$date =  as.Date(raw.data$date,"%m/%d/%y")) %>%
    complete(raw.data$date = seq.Date(min(raw.data$date), max(raw.data$date), by="day"))


