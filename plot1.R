#Total emission from PM2.5 decreased 
#country: US
#Year: 1999 - 2008

#Using base plotting system - show total PM2.5 emission from all sources for each year 1999, 2002, 2005 & 2008


#SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
#NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))


NEI[,Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

totalNEI <- NEI[,lapply(.SD,sum,na.rm=TRUE), .SDcols=c("Emissions"), by=year]

png(filename='plot1.png')

barplot(totalNEI[,Emissions] 
        , names = totalNEI[,year]
        , xlab = "Years"
        , ylab = "Emissions"
        , main = "Emissions over the years")

dev.off()