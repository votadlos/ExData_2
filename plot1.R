library(dplyr)

#set working directory
setwd("C:\\Users\\svs\\Documents\\GitHub\\R\\ExData_2\\exdata_data_NEI_data")

# load data
NEI <- readRDS("summarySCC_PM25.rds")


#open file for writing
png(filename="plot1.png", width = 480, height = 480)

#prepare data
x = NEI %>% group_by(year) %>% summarize(value=sum(Emissions))

plot(x, main="Total PM2.5 emission",type="l")

#close file
dev.off()
