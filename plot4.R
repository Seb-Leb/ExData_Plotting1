# Exploratory Data analysis - Course project 1
# script for generating plot 4

library(lubridate)

# Get column names
colnames <- read.table('household_power_consumption.txt',nrows=1, sep=';')
colnames <- as.list(t(colnames))

# Read lines of interest
power_df = read.table('household_power_consumption.txt', sep=';', skip=66637, nrows=2881, col.names=colnames)

# Generate plot 4
draw_plots_4 <- function(){

# Setup the canvas to 2x2 plots
    png(file='plot4.png', units='px', height=480, width=480)
    par(mfrow=c(2,2))

# First Plot
    with(power_df,
         plot(dmy_hms(paste(Date, Time)),
                Global_active_power,
                ylab='Global Active Power',
                xlab='',
                type='l')
         ) 

# Second plot
    with(power_df,
         plot(dmy_hms(paste(Date, Time)),
                Voltage,
                ylab='Voltage',
                xlab='datetime',
                type='l')
         )

# Third plot
    with(power_df,
         plot(range(dmy_hms(paste(Date, Time))),
                range(Sub_metering_1),
                ylab='Energy sub metering',
                xlab='',
                type='n'),
         )

    with(power_df,
         lines(dmy_hms(paste(Date, Time)),
               Sub_metering_1,
               col='black',
               type='l')
         )

    with(power_df,
         lines(dmy_hms(paste(Date, Time)),
               Sub_metering_2,
               col='red',
               type='l')
         )

    with(power_df,
         lines(dmy_hms(paste(Date, Time)),
               Sub_metering_3,
               col='blue',
               type='l')
         )

    with(power_df,
         legend('topright',
                legend=c('Sub_metering_1',
                         'Sub_metering_2',
                         'Sub_metering_3'),
                col=c('black', 'red', 'blue'),
                lty=c(1,1,1))
         )

# Fourth plot
    with(power_df,
         plot(dmy_hms(paste(Date, Time)),
                Global_reactive_power,
                ylab='Global reactive power',
                xlab='datetime',
                type='l')
         )
    dev.off()
}
