library(dplyr)

#set working directory
setwd("C:\\Users\\svs\\Documents\\GitHub\\R\\ExData_2\\exdata_data_NEI_data")

# load data
NEI <- readRDS("summarySCC_PM25.rds")

#open file for writing
png(filename="plot2.png", width = 480, height = 480)

#prepare data
x = NEI %>% filter(fips==24510) %>% group_by(year) %>% summarize(value=sum(Emissions))

plot(x, main="Total PM2.5 emission in the Baltimore City, Maryland", type="l")

#close file
dev.off()