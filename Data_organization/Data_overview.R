head(data, 5)
nrow(data_name)
ncol(data_name)

#Table & summary & quantile
Table(data$col)
summary(data$col)
quantile(data$A, c(0.025, 0.5, 0.975))

#Histogram
ggplot(data, aes(x = values)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black", aes(y = ..density..)) +
  geom_density(alpha = 0.2, fill = "orange") +
  labs(title = "Histogram of Random Data", x = "Values", y = "Density")

#Boxplot and dotplot
RR_plot <- ggplot(data_fil_1_1, aes(x = 1, y = change)) + 
geom_boxplot(notch = FALSE, width = 0.9) + 
geom_dotplot(binaxis = "y", binwidth = 1.0, stackdir = "center", alpha = 0.5)  + 
theme_minimal() + theme(
  axis.line = element_line(size = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"))
RR_plot
