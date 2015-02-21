library(dplyr)
library(ggplot2)

#set working directory
setwd("C:\\Users\\svs\\Documents\\GitHub\\R\\ExData_2\\exdata_data_NEI_data")

# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

x = SCC %>% filter(grepl("veh", Short.Name, ignore.case="T"))
y = NEI %>% filter(fips==24510)
y=merge(x,y,by="SCC")

#open file for writing
png(filename="plot5.png", width = 480, height = 480)

#prepare data
x = y %>% group_by(year) %>% summarize(value=sum(Emissions))

#plot(x, main="Total PM2.5 emission in the Baltimore City, Maryland", type="l")
print(
  qplot(year,value,data=x, geom=c("point","smooth"),
        main="Emissions from motor vehicle sources in Baltimore")
  )

#close file
dev.off()

