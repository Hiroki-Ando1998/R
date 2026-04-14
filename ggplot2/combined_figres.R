
library(cowplot)

plot_simulation <- ggplot(data_xx_2, aes(x = number)) +
  geom_ribbon(aes(ymin = log10(low_0.025), ymax = log10(upr_0.975)), fill = "#A6BDDB", colour = "NA", alpha = 0.25) + 
  geom_ribbon(aes(ymin = log10(low_0.25), ymax = log10(upr_0.75)), fill = "#A6BDDB", colour = "NA", alpha = 0.35) + 
  geom_hline(yintercept = log10(mean_ind), linetype = "dashed") + 
  geom_line(aes(y = log10(median))) + 
  scale_y_continuous(limits = c(2.5, 7.5), breaks = seq(3, 7, 1)) +
  scale_x_log10(limits = c(1, 10000), breaks = c(1, 10, 100, 1000, 10000)) +
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
plot_simulation

plot_simulation_2 <- ggplot(data_figure, aes(x = sd)) +
  geom_line(aes(y = log10(number_050)), colour = "#01665E", linetype = "dashed") + 
  geom_line(aes(y = log10(number_030)), colour = "#02818A", linetype = "solid") + 
  geom_line(aes(y = log10(number_015)), colour = "#DE77AE", linetype = "dashed") + 
  geom_line(aes(y = log10(number_010)), colour = "#FEB24C", linetype = "solid") + 
  geom_line(aes(y = log10(number_005)), colour = "#8C510A", linetype = "dashed") + 
  geom_point(aes(y = log10(number_050)), colour = "#01665E") + 
  geom_point(aes(y = log10(number_030)), colour = "#02818A") + 
  geom_point(aes(y = log10(number_015)), colour = "#DE77AE") + 
  geom_point(aes(y = log10(number_010)), colour = "#FEB24C") + 
  geom_point(aes(y = log10(number_005)), colour = "#8C510A") + 
  scale_x_continuous(limits = c(0.1, 1.5), breaks = seq(0.1, 1.5, 0.20)) +
  scale_y_continuous(limits = c(0, 6.1), breaks = c(0, 1, 2, 3, 4, 5, 6)) +
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
plot_simulation_2


#630*450
Figure_1_b <- plot_grid(
  plot_simulation, plot_simulation_2,
  ncol = 2
)
print(Figure_1_a)
