SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

baltimore_emm <- NEI[NEI$fips=="24510",]

bm_emission<- aggregate (Emissions ~ year, baltimore_emm, sum)

png ('plot2.png')

barplot(height = bm_emission$Emissions, names.arg = bm_emission$year,
        xlab = "years", ylab = expression('total PM'[2] * ' emission'),
        main = expression('Total PM' [2]* ' emission in Baltimore City across the years'))
dev.off()
