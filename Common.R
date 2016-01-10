# load polycoder_pwr_data table if it does not exist in the environment already. Helpul since it takes a long time to read it in, so skip if possible...
if(!exists("polycoder_pwr_data")) {
  script.dir <- dirname(sys.frame(1)$ofile)

  data_file <- paste(script.dir, "household_power_consumption.txt", sep="/")

  # if we don't have a data file then download and unzip it now.
  if(!file.exists(data_file)){
    zip_file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zip_file <- paste(script.dir, "exdata-data-household_power_consumption.zip", sep="/")
    download.file(zip_file_url, zip_file, mode="wb", method="curl")
    unzip(zip_file, exdir=script.dir)
  }

  polycoder_pwr_data <- read.csv(
    data_file,
    sep=";",
    dec=".", 
    na.strings="?",
    header=TRUE,
    stringsAsFactors=FALSE
  )

  # convert date and time information.
  polycoder_pwr_data <- polycoder_pwr_data[polycoder_pwr_data$Date=="1/2/2007"|polycoder_pwr_data$Date=="2/2/2007",]
  polycoder_pwr_data$Time <- strptime(paste(polycoder_pwr_data$Date, polycoder_pwr_data$Time), "%d/%m/%Y %H:%M:%S")
  polycoder_pwr_data$Date <- as.Date(polycoder_pwr_data$Date, "%d/%m/%Y")
}

hist_global_active_power <- function() {
  hist(polycoder_pwr_data$Global_active_power, 
       col="red", 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)"
  )
}

plot_global_active_power <- function(ylab="Global Active Power (kilowatts)") {
  plot(polycoder_pwr_data$Time, polycoder_pwr_data$Global_active_power, 
       type="o", 
       cex=0, 
       cex.lab=.75,
       ylab=ylab, 
       xlab=""
  )
}

plot_sub_metering <- function() {
  yrange<-range(c(polycoder_pwr_data$Sub_metering_1,polycoder_pwr_data$Sub_metering_2,polycoder_pwr_data$Sub_metering_3))
  yrange[[2]] <- yrange[[2]] + 5 # +5 for padding from legend

  plot(polycoder_pwr_data$Time, polycoder_pwr_data$Sub_metering_1,
       ylim=yrange,
       type="o", 
       cex=0, 
       cex.lab=.75,
       ylab="Energy sub metering", 
       xlab=""
  )
  lines(polycoder_pwr_data$Time, polycoder_pwr_data$Sub_metering_2,type="l",col="red")
  lines(polycoder_pwr_data$Time, polycoder_pwr_data$Sub_metering_3,type="l",col="blue")

  legend("topright", 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lwd=c(1,1,1),
         col=c("black","red","blue"),
         cex=.75
  )
}
