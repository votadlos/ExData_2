library(dplyr)
library(ggplot2)

#set working directory
setwd("C:\\Users\\svs\\Documents\\GitHub\\R\\ExData_2\\exdata_data_NEI_data")

# load data
NEI <- readRDS("summarySCC_PM25.rds")

#open file for writing
png(filename="plot3.png", width = 480, height = 600)
#pdf("plots.pdf")

#prepare data
x = NEI %>% filter(fips==24510) %>% group_by(year,type) %>% summarize(value=sum(Emissions))

#plot(x, main="Total PM2.5 emission in the Baltimore City, Maryland", type="l")
print(
  qplot(year,value,data=x,facets =type~.,color=type, geom=(c("point","smooth")),
        main="Emission in Baltimore by type")
  )

#close file
dev.off()
