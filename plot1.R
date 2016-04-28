# Exploratory Data analysis - Course project 1
# script for generating plot 1

# Get column names
colnames <- read.table('household_power_consumption.txt',nrows=1, sep=';')
colnames <- as.list(t(colnames))

# Read lines of interest
power_df = read.table('household_power_consumption.txt', sep=';', skip=66637, nrows=2880, col.names=colnames)

# Generate plot 1
png(file='plot1.png', units='px', height=480, width=481)
with(power_df, hist(Global_active_power, 
                    main='Gobal Active Power', 
                    xlab='Global Active Power (kilowatts)',
                    col='red'))
dev.off()
