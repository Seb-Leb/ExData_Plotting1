# Exploratory Data analysis - Course project 1
# script for generating plot 3

library(lubridate)

# Get column names
colnames <- read.table('household_power_consumption.txt',nrows=1, sep=';')
colnames <- as.list(t(colnames))

# Read lines of interest
power_df = read.table('household_power_consumption.txt', sep=';', skip=66637, nrows=2881, col.names=colnames)

# Generate plot 3
draw_plot_3 <- function(){
    png(file='plot3.png', units='px', height=480, width=480)

# Setup the scene
    with(power_df,
         plot(range(dmy_hms(paste(Date, Time))),
                range(Sub_metering_1),
                ylab='Energy sub metering',
                xlab='',
                type='n'),
         )

# Draw the lines
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

# Add the legend
    with(power_df,
         legend('topright',
                legend=c('Sub_metering_1',
                         'Sub_metering_2',
                         'Sub_metering_3'),
                col=c('black', 'red', 'blue'),
                lty=c(1,1,1))
         )
    dev.off()
    }
