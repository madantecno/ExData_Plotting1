colname<-read.table("./Coursera asgmnt/expl analys project files//Week one project files//household_power_consumption.txt",header=TRUE,sep=";",nrow=5,na.strings = "?")
datasettemp<-read.table("./Coursera asgmnt/expl analys project files//Week one project files//household_power_consumption.txt",header=TRUE,sep=";",nrow=2880,na.strings = "?",skip=66636)
colnames(datasettemp)<-colnames(colname)

temp<-as.data.frame(strptime(paste(datasettemp[,1],datasettemp[,2]),"%d/%m/%Y %H:%M:%S"))
dataset<-merge(temp,datasettemp[,3:9])
colnames(dataset)<-c("datetime",colnames(dataset[,2:8]))

png("./Coursera asgmnt/expl analys project files//Week one project files/plot1.png",width=480,height=480)
hist(datasettemp$Global_active_power,col="RED",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()