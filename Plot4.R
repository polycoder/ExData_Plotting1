script.dir <- dirname(sys.frame(1)$ofile)
source(paste(script.dir, "Common.R", sep = "/"))

par(mar=c(2,4,2,1))
par(mfrow = c(2, 2))

plot_global_active_power(ylab="Global Active Power") # function sourced from Common.R

plot(polycoder_pwr_data$Time, polycoder_pwr_data$Voltage, 
     type="o", 
     cex=0, 
     cex.lab=.75,
     ylab="Voltage", 
     xlab=""
)

plot_sub_metering() # function sourced from Common.R

plot(polycoder_pwr_data$Time, polycoder_pwr_data$Global_reactive_power, 
     type="o", 
     cex=0, 
     cex.lab=.75,
     ylab="Global Reactive Power", 
     xlab=""
)

dev.copy(png,paste(script.dir, "Plot4.png", sep = "/"))
dev.off()
par(mfrow = c(1, 1))
