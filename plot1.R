SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

emission<- aggregate (Emissions ~ year, NEI, sum)

png ('plot1.png')

barplot(height = emission$Emissions, names.arg = emission$year,
        xlab = "years", ylab = expression('total PM'[2] * ' emission'),
        main = expression('Total PM' [2]* ' emission across the years'))
dev.off()
