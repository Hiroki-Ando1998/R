# Diffrent dataframe is referred

plot_ww_2 <- ggplot() +
  geom_ribbon(data = data_figure_b, aes(x = time, ymin = log10(lower_ww_2), ymax = log10(upper_ww_2)), fill = "grey", alpha = 0.40)  + 
  geom_ribbon(data = data_figure_a, aes(x = time, ymin = log10(lower_ww), ymax = log10(upper_ww)), fill = "#0570B0", alpha = 0.20) +
  geom_line(data = data_figure_b, aes(x = time, y = log10(median_ww_2)), color = "#4D4D4D") +
  geom_line(data = data_figure_a, aes(x = time, y = log10(median_ww)), color = "#0570B0") +
  geom_point(data = data_figure_a, aes(x = time, y = log_ww), shape = 21, color = "#0570B0", fill = "#0570B0", size = point_size_2) +
  labs(x = "Month", y = "CAR") +
  scale_y_continuous(limits = c(1, 7.5), breaks = seq(1, 7, 2)) +
  scale_x_continuous(limits = c(start, end), breaks = seq(start, end, interval)) +
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
print(plot_ww_2)
