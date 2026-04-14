
library(ggplot2)

#330(width)*170(hight)

plot_dynamics_2 <- ggplot(data_shedding, aes(x = time, y = feces_med_7_IAV)) + 
geom_bar(stat = "identity", colour = "#35978F", fill = "#80CDC1", width = 1.0) + 
geom_errorbar(aes(ymin = feces_low_7_IAV, ymax = feces_upr_7_IAV), width = 0.4, colour = "#01665E", size = 0.8) + 
scale_x_continuous(limits = c(0,20), breaks = seq(0, 20, 5)) + 
scale_y_continuous(limits = c(0,40), breaks = seq(0, 40, 10)) +
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
  ) + 
guides(fill = guide_legend(title = NULL))
print(plot_dynamics_2)
