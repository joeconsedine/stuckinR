
# Install and load the readr and gtrendsR packages

installed.packages("readr","gtrendsR","tidyr")
library(readr)
library(gtrendsR)
library(tidyr)
library(dplyr)
library(tidyverse)
library(tsibble)
library(lubridate)


kwlist = readLines("classy2.csv")
# kwlist = "wild fire"

print(kwlist)

# The for loop downloads the data for every single keyword in your list

resultslist <- list() 
# print(list)
for (keywords in kwlist){
  
  # Set the geographic region, time span, Google product,... 
  # for more information read the official documentation https://cran.r-project.org/web/packages/gtrendsR/gtrendsR.pdf
  print(keywords)
  # hits %>%
    # complete()
    country=c('US')
  time=("today+5-y")
  channel='web'
  trends = gtrends(keywords, gprop =channel,geo=country, time = time )
  # kwlist[[keywords]] <- trends$interest_over_time
  resultslist[[keywords]] <- trends$interest_over_time
  # mutate(date = as.date(date)) %>%
  # complete(Date = seq.date(min(date), max(date), by="day"))
}

output <- as.data.frame(do.call("rbind", resultslist)) 
print(output)

#"output' was just printed
# print(output$keyword)
output[with(output, order(output$keyword, output$date)),]
# orderedOutput <- output[order(output$keyword, output$date)]
print(output)

actualnewDataStuff <- output %>% complete(date = seq(min(date), max(date), by="day"))


#### PLEASE HELP HERE REDDIT
print(actualnewDataStuff)

datanerd <- actualnewDataStuff %>% fill(hits,keyword,geo,time,gprop,category) 

print(datanerd)


# write.csv(datanerd,"google trends R results output/masterSmasher.csv")




