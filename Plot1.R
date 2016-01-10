script.dir <- dirname(sys.frame(1)$ofile)
source(paste(script.dir, "Common.R", sep = "/"))

hist(polycoder_pwr_data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"
)

dev.copy(png,paste(script.dir, "Plot1.png", sep = "/"))
dev.off()
