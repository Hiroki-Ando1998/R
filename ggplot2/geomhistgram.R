library(ggplot2)


# histogram for lag-time (Width: 250, height: 190)
plot_his <- ggplot(data_lag_time, aes(x = lag_time)) 
plot_his <- plot_his + geom_histogram(binwidth = 1, fill = "#3690C0", color = "#0570B0")
plot_his <- plot_his + scale_x_continuous(limits = c(-4, 12), breaks = seq(-4, 12, 4)) 
plot_his <- plot_his + labs(x = "leading time", y = "count")
plot_his <- plot_his + theme_bw()
plot_his <- plot_his + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  axis.title = element_blank(),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot_his


# histogram for lag-time (Width: 250, height: 190)
plot_his <- ggplot(data_lag_time, aes(x = lag_time)) 
plot_his <- plot_his + geom_histogram(binwidth = 1, fill = "#980043", color = "#67001F")
plot_his <- plot_his + scale_x_continuous(limits = c(-4, 12), breaks = seq(-4, 12, 4)) 
plot_his <- plot_his + labs(x = "leading time", y = "count")
plot_his <- plot_his + theme_bw()
plot_his <- plot_his + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  axis.title = element_blank(),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
plot_his













