script.dir <- dirname(sys.frame(1)$ofile)
source(paste(script.dir, "Common.R", sep = "/"))

plot_sub_metering()
dev.copy(png,paste(script.dir, "Plot3.png", sep = "/"))
dev.off()