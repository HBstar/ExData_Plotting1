##set the working directory to your desired on your own
##download the file from the link and unzip the file into the same directory
##if you want to change to another directory, you can edit the scripts
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="./power.zip")
zipfile<-"./power.zip"
unzip(zipfile, exdir=".")

##read the desired data from the file
sample<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=70000,na.strings="?",stringsAsFactors=FALSE)
data<-rbind(subset(sample, Date=="1/2/2007"),subset(sample, Date=="2/2/2007"))

##convert the Date and Time variables to Date/Time classes
##rename the Date variables to Date/Time & subset all variables except Time 
data$Date<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
names(data)[1]="Date/Time"
data<-data[,-2]

##plot the plot required & labeled as "Plot 3"
plot(data$`Date/Time`,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
points(data$`Date/Time`,data$Sub_metering_1,type="l")
points(data$`Date/Time`,data$Sub_metering_2,type="l",col="red")
points(data$`Date/Time`,data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7,adj=0.05,inset=0)
mtext("Plot 3", adj=0, padj =-3)

##export the plot to a png file
dev.copy(png, file="plot3.png")
dev.off()
