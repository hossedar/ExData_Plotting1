#Read in data from .txt file
EPC_data_file <- "household_power_consumption.txt"
EPC_data <- read.table(EPC_data_file, nrows = 2075259, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
#Format Date column in dataframe
EPC_data$Date <- as.Date(EPC_data$Date, format = '%d/%m/%Y')
#Selects subset of data
EPC_data.sub <- subset(EPC_data, Date == '2007-02-01' | Date == '2007-02-02') 
#Formates Time in dataframe
EPC_data.sub$Time <- strptime(paste(EPC_data.sub$Date, EPC_data.sub$Time), format = '%Y-%m-%d %H:%M:%S')

#checks there are no NAs in data
#colSums(is.na(EPC_data.sub))

#Plots line graph
png(file = 'plot2.png', width = 480, height = 480)
with(EPC_data.sub, plot(Time, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab =''))
dev.off()