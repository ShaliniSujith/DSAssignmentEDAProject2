#four types of sources indicated by the ???????????????? (point, nonpoint, onroad, nonroad)
#Which of the 4 sources have seen decreases & increases in emissions
#Year: 1999 - 2008
#Use ggplot2

library(ggplot2)

#Subset NEI data by Baltimore
baltimoreNEI <- NEI[NEI$fips=="24510",]

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)
