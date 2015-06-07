colname<-read.table("./Coursera asgmnt/expl analys project files//Week one project files//household_power_consumption.txt",header=TRUE,sep=";",nrow=5,na.strings = "?")
datasettemp<-read.table("./Coursera asgmnt/expl analys project files//Week one project files//household_power_consumption.txt",header=TRUE,sep=";",nrow=2880,na.strings = "?",skip=66636)
colnames(datasettemp)<-colnames(colname)

temp<-as.data.frame(strptime(paste(datasettemp[,1],datasettemp[,2]),"%d/%m/%Y %H:%M:%S"))
dataset<-merge(temp,datasettemp[,3:9])
colnames(dataset)<-c("datetime",colnames(dataset[,2:8]))

png("./Coursera asgmnt/expl analys project files//Week one project files/plot2.png",width=480,height=480)
plot(dataset$Global_active_power,type="l",xaxt='n',ylab="Global Active Power(kilowatts)")
axis(1,at=c(1,4000000,8000000),labels=c("Thu", "Fri","sat"))
dev.off()
