library(ggplot2)


# histogram for lag-time (Width: 230, height: 190)
plot_his <- ggplot(data_lag_time, aes(x = lag_time))  + 
geom_histogram(binwidth = 1, fill = "#3690C0", color = "#0570B0") + 
scale_x_continuous(limits = c(-4, 12), breaks = seq(-4, 12, 4))  + 
labs(x = "leading time", y = "count") + 
  theme_minimal() +
  theme(
    #axis.title.x  = element_blank(),     
    #axis.text.x   = element_blank(),    
    #axis.ticks.x  = element_blank(),     
    axis.title.y  = element_blank(), 
    axis.line = element_line(linewidth = 0.5, lineend = "square"),
    #axis.line.x   = element_blank(), 
    text = element_text(colour = "black", size = 11),
    legend.position = "none",
    axis.ticks = element_line(linewidth = 0.5),
    axis.ticks.length = unit(-2, "mm")
  )
plot_his


# histogram for lag-time (Width: 330, height: 190)
plot_his <- ggplot(data_lag_time, aes(x = lag_time))  + 
geom_histogram(binwidth = 1, fill = "#980043", color = "#67001F") + 
scale_x_continuous(limits = c(-4, 12), breaks = seq(-4, 12, 4)) + 
labs(x = "leading time", y = "count") +
  theme_minimal() +
  theme(
    #axis.title.x  = element_blank(),     
    #axis.text.x   = element_blank(),    
    #axis.ticks.x  = element_blank(),     
    axis.title.y  = element_blank(), 
    axis.line = element_line(linewidth = 0.5, lineend = "square"),
    #axis.line.x   = element_blank(), 
    text = element_text(colour = "black", size = 11),
    legend.position = "none",
    axis.ticks = element_line(linewidth = 0.5),
    axis.ticks.length = unit(-2, "mm")
  )













