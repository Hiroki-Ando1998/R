plot <- ggplot(Data_GDP, aes(x = log10(GDPcapital), y = coverage, fill = factor(Dummy)))
plot <- plot + geom_point(shape = 21, size = 3.0, colour = "black")
plot <- plot + scale_fill_manual(values = c("lightskyblue3", "thistle1"))
plot <- plot + scale_y_continuous(limits = c(0,100), breaks = seq(0, 100, 20), label = NULL)
plot <- plot + scale_x_continuous(limits = c(1.5, 5.5), breaks = seq(2, 5, 1), label = NULL)
plot <- plot + theme_classic()
plot <- plot + theme(
  axis.line = element_line(size = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot
