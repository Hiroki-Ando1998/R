

# プロット作成 330*220
plot <- ggplot(data_shedding_onset) + 
geom_density(aes(x = incubation_time), fill = "#FEC44F", alpha = 0.5)  + 
geom_density(aes(x = shedding_onset), fill = "#0570B0", alpha = 0.5)  + 
labs(x = "day", y = "Probability density")  + 
scale_y_continuous(limits = c(0.0, 0.4), breaks = seq(0.0, 0.4, 0.1))  +
scale_x_continuous(limits = c(-1, 15), breaks = seq(0.0, 15, 10)) 
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
print(plot)
