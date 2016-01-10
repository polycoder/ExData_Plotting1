script.dir <- dirname(sys.frame(1)$ofile)
source(paste(script.dir, "Common.R", sep = "/"))

hist_global_active_power()
dev.copy(png,paste(script.dir, "Plot1.png", sep = "/"))
dev.off()
