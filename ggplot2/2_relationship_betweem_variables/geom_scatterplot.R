
library(scales)

plot <- ggplot(Data_GDP, aes(x = AA, y = BB, fill = factor(Dummy))) + 
geom_point(shape = 21, size = 3.0, colour = "black") + 
scale_fill_manual(values = c("lightskyblue3", "thistle1")) + 
scale_y_log10(breaks = 10^(-7:-2), labels = trans_format("log10", math_format(10^.x))) + 
scale_x_continuous(limits = c(1.5, 5.5), breaks = seq(2, 5, 1), label = NULL) +
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
