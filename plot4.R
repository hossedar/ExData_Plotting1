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

#Plots 2x2 multiplw plots
png(file = 'plot4.png', width = 480, height = 480)
#Arranges plots
par(mfrow = c(2, 2))
#[1,1] plot
with(EPC_data.sub, plot(Time, Global_active_power, type = 'l', ylab = 'Global Active Power', xlab =''))
#[1,2] plot
with(EPC_data.sub, plot(Time, Voltage, type = 'l', ylab = 'Voltage', xlab ='datetime'))
#[2,1] plot (Note the smaller font for the legend, using cex)
with(EPC_data.sub, plot(Time, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab =''))
with(EPC_data.sub, lines(Time, Sub_metering_2, col = 'red'))
with(EPC_data.sub, lines(Time, Sub_metering_3, col = 'blue'))
legend('topright', lty = c(1,1,1), col = c('black', 'red', 'blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty = 'n', cex=0.95, pt.cex=1)
#[2,2] plot.
with(EPC_data.sub, plot(Time, Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab ='datetime'))
dev.off()