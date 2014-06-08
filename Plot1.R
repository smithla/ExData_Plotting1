# Plot1.R - Exporatory Data Analysis - Homework 1

# read the data in. File should be in working directory. 
df <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

# check the data
head(df)
str(df)

# create a subset of the data for the days required
df_02022007 <- df[df$Date == "2/2/2007",]
df_02012007 <- df[df$Date == "1/2/2007",]
df_proper <- rbind(df_02012007,df_02022007)

# Add a column of DateTime. Create from Date and Time columns.
df_proper$DateTime <- strptime(paste(df_proper$Date, df_proper$Time), "%d/%m/%Y %H:%M:%S") 

# checkt the data
head(df_proper)

# create and save the plot
png(filename="Plot1.png",height=480,width=480,units="px")
hist(as.numeric(df_proper$Global_active_power),xlab="Global Active Power (Kilowatts)",col="Red",main="Global Active Power")
dev.off()