script.dir <- dirname(sys.frame(1)$ofile)
source(paste(script.dir, "Common.R", sep = "/"))

plot_sub_metering() # function sourced from Common.R

dev.copy(png,paste(script.dir, "Plot3.png", sep = "/"))
dev.off()