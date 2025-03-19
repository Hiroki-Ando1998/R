library(scales)
plot <- ggplot(Data_GDP, aes(x = AA, y = BB, fill = factor(Dummy)))
plot <- plot + geom_point(shape = 21, size = 3.0, colour = "black")
plot <- plot + scale_fill_manual(values = c("lightskyblue3", "thistle1"))
plot <- plot + scale_y_log10(breaks = 10^(-7:-2), labels = trans_format("log10", math_format(10^.x)))

plot <- plot + scale_x_continuous(limits = c(1.5, 5.5), breaks = seq(2, 5, 1), label = NULL)
plot <- plot + theme_classic()
plot <- plot + theme_bw(
  axis.line = element_line(size = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot
