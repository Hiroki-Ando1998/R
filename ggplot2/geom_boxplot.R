plot <- ggplot(data_all_sample, aes(x = as.factor(COUNTY), y = adjust_cidm, fill = as.factor(sample))) + geom_boxplot() +
  labs(x = "County", y = "Concentration (ug/g or ug/L)")
plot <- plot + scale_fill_manual(values = c("lightblue", "orange", "red"))
plot <- plot + theme_classic()
plot <- plot + theme(
  axis.text.x = element_text(angle = 45, hjust = 1),
  axis.line = element_line(size = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = c(0.28, 0.90), #"top
  legend.text = element_text(size = 14),
  legend.key.size = unit(3, "lines"),
  legend.direction = "horizontal",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot <- plot + guides(fill = guide_legend(title = NULL))
plot
