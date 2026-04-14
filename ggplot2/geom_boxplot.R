
plot <- ggplot(data_all_sample, aes(x = as.factor(COUNTY), y = adjust_cidm, fill = as.factor(sample))) + geom_boxplot() +
labs(x = "County", y = "Concentration (ug/g or ug/L)") + 
scale_fill_manual(values = c("lightblue", "orange", "red")) +
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
print(plot)
