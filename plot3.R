library(ggplot2)

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

baltimore_emm <- NEI[NEI$fips=="24510",]

bm_emission_type<- aggregate (Emissions ~ year + type, baltimore_emm, sum)

png ('plot3.png', height = 480, width = 680)

ggplot(bm_emission_type, aes(x=factor(year), y = Emissions, fill=type)) + 
  geom_bar(stat="identity") + facet_grid(. ~ type) + 
  xlab("year") + 
  ylab(expression("Total PM"[2.5]*" emission")) + 
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore City by various source types",
                                     sep="")))

dev.off()
  