# Exploratory Data analysis - Course project 1
# script for generating plot 2

library(lubridate)

# Get column names
colnames <- read.table('household_power_consumption.txt',nrows=1, sep=';')
colnames <- as.list(t(colnames))

# Read lines of interest
power_df = read.table('household_power_consumption.txt', sep=';', skip=66637, nrows=2881, col.names=colnames)

# Generate plot 2
png(file='plot2.png', units='px', height=480, width=480)
with(power_df,
     plot(dmy_hms(paste(Date, Time)),
            Global_active_power,
            ylab='Global Active Power (kilowatts)',
            xlab='',
            type='l')
     )
dev.off()
