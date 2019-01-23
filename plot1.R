##set the working directory to your desired on your own
##download the file from the link and unzip the file into the same directory
##if you want to change to another directory, you can edit the scripts
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="C:/Users/zhaole/Downloads/coursera/exploratory_data_analysis/power.zip")
zipfile<-"C:/Users/zhaole/Downloads/coursera/exploratory_data_analysis/power.zip"
unzip(zipfile, exdir=".")

##read the desired data from the file
sample<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=70000,na.strings="?",stringsAsFactors=FALSE)
data<-rbind(subset(sample, Date=="1/2/2007"),subset(sample, Date=="2/2/2007"))

##convert the Date and Time variables to Date/Time classes
##rename the Date variables to Date/Time & subset all variables except Time 
data$Date<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
names(data)[1]="Date/Time"
data<-data[,-2]

##plot the histgram required & labeled as "Plot 1"
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
mtext("Plot 1", adj=0, padj =-3)

##export the plot to a png file
dev.copy(png, file="plot1.png")
dev.off()