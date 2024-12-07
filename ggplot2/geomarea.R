

# プロット作成 375*220
plot <- ggplot(data_shedding_onset)
plot <- plot + geom_density(aes(x = incubation_time), fill = "#FEC44F", alpha = 0.5) 
plot <- plot + geom_density(aes(x = shedding_onset), fill = "#0570B0", alpha = 0.5) 
plot <- plot + labs(x = "day", y = "Probability density") 
plot <- plot + scale_y_continuous(limits = c(0.0, 0.4), breaks = seq(0.0, 0.4, 0.1)) 
plot <- plot + scale_x_continuous(limits = c(-1, 15), breaks = seq(0.0, 15, 10)) 
plot <- plot + theme_bw()
plot <- plot + theme(
    axis.line = element_line(linewidth = 1.0, lineend = "square"),
    text = element_text(colour = "black", size = 14),
    legend.position = "none",
    axis.ticks = element_line(linewidth = 1.0),
    axis.ticks.length = unit(-2, "mm")
  )

print(plot)