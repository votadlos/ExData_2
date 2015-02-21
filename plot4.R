library(dplyr)
library(ggplot2)

#set working directory
setwd("C:\\Users\\svs\\Documents\\GitHub\\R\\ExData_2\\exdata_data_NEI_data")

# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


x = SCC %>% filter(grepl("Coal",EI.Sector))
y=merge(x,NEI,by="SCC")

#open file for writing
png(filename="plot4.png", width = 480, height = 480)

#prepare data
x = y %>% group_by(year) %>% summarize(value=sum(Emissions))

print(
  qplot(year,value,data=x, geom=c("point","smooth"), 
        main="Emissions from coal across the United States")
  )

#close file
dev.off()

