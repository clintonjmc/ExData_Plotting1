##Read file into R
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", quote = "\"'", na.strings = "?", 
                   stringsAsFactors = FALSE)

##Get column names to make summarised object easier to interrogate
colNames <- names(data)

#create a logical vector indicating the rows that relate to the 
##requested dates
rows <- as.logical((data[,1] == "2/2/2007") + (data[,1] == "1/2/2007"))

#Create summarised object containing dates required and converting separate
#date and time fields into R POSIXt object
data <- data.frame(strptime(paste(data[rows,1],data[rows,2], sep = " "), 
                            format = "%d/%m/%Y %H:%M:%S"), 
                   data[rows,3], data[rows,4], data[rows,5], data[rows,6], 
                   data[rows,7], data[rows,8], data[rows,9])

##Add column names to summarised data
names(data) <- c("Date.Time",colNames[3:9])

##Plot2
png("plot2.png")
plot(data[,1],data[,2], type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()