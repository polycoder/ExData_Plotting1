script.dir <- dirname(sys.frame(1)$ofile)
source(paste(script.dir, "Common.R", sep = "/"))

par(mar=c(4,4,1,1))
par(mfrow = c(2, 2))

plot_global_active_power(ylab="Global Active Power") # function sourced from Common.R

plot(polycoder_pwr_data$Time, polycoder_pwr_data$Voltage, 
     type="o", 
     cex=0, 
     cex.lab=.75,
     ylab="Voltage", 
     xlab="datetime"
)

plot_sub_metering(bty="n") # function sourced from Common.R

plot(polycoder_pwr_data$Time, polycoder_pwr_data$Global_reactive_power, 
     type="o", 
     cex=0, 
     cex.lab=.75,
     ylab="Global_reactive_power", 
     xlab="datetime"
)

dev.copy(png,paste(script.dir, "Plot4.png", sep = "/"))
dev.off()
par(mfrow = c(1, 1))
