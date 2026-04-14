plot_1_alpha <- ggplot(data_1_alpha, aes(x = alpha_id, y = median)) +
  geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
  geom_point(shape = 21, fill = "#02818A", colour = "#02818A") +
  scale_y_continuous(limits = c(3.5, 9.5), breaks = seq(4, 9, 1)) +
  scale_x_continuous(limits = c(0, 30), breaks = seq(0, 30, 10)) + 
  theme_minimal() +
  theme(
    axis.title.x  = element_blank(),     
    axis.text.x   = element_blank(),    
    axis.ticks.x  = element_blank(),     
    axis.title.y  = element_blank(), 
    axis.line = element_line(linewidth = 0.5, lineend = "square"),
    axis.line.x   = element_blank(), 
    text = element_text(colour = "black", size = 11),
    legend.position = "none",
    axis.ticks = element_line(linewidth = 0.5),
    axis.ticks.length = unit(-2, "mm")
  )
