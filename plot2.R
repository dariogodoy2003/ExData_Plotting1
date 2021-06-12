## Load dataset
data<-read.table("C:/Users/dario/Desktop/household_power_consumption.txt", header=TRUE, sep=";",dec=".")
names(data)  ##Names of columns
str(data)  ##Type of Variables
dates<-data$Date
times<-data$Time
x<-paste(dates,times)
z<-strptime(x, format = "%d/%m/%Y %H:%M:%S",tz="GMT")
data$Date<-as.Date(data$Date,"%d/%m/%Y") ##Format DATE
data$Time<-z ##Format time
## Replace "?" by NA
data[which(data[,3]=="?"),3]<-NA
data[which(data[,4]=="?"),4]<-NA
data[which(data[,5]=="?"),5]<-NA
data[which(data[,6]=="?"),6]<-NA
data[which(data[,7]=="?"),7]<-NA
data[which(data[,8]=="?"),8]<-NA
data[which(data[,9]=="?"),9]<-NA

## Columns 3-8 are numeric variables
data[,3]<-as.double(data[,3])
data[,4]<-as.double(data[,4])
data[,5]<-as.double(data[,5])
data[,6]<-as.double(data[,6])
data[,7]<-as.double(data[,7])
data[,8]<-as.double(data[,8])

##create "subdata" dataframe
subdata<-data[which(data$Date>="2007-02-01"&data$Date<="2007-02-02"),]
rm(dates,times,x,z,data)

##Plot 2
png("plot2.png")
with (subdata, 
      plot(Time, Global_active_power,type="n",xlab="",
           ylab="Global Active Power (kilowatts)"))
lines(subdata$Time, subdata$Global_active_power,lwd=1,col="black")
dev.off()
