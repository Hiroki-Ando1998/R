
data_2 <- Data %>% drop_na()
p1 <- ggplot(data_2, aes(x = log10(IAV/389), y = Positive, size = PN)) + 
geom_point(alpha = 0.4, shape = 21, colour = "black", fill = "lightblue") + 
scale_size_continuous(range = c(1, 20)) + 
xlab("Newly reported case") + ylab("Detection rate") + 
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
print(p1)
