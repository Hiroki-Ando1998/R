
library(ggplot2)


plot_dynamics_2 <- ggplot(data_shedding, aes(x = time, y = feces_med_7_IAV))
plot_dynamics_2 <- plot_dynamics_2 + geom_bar(stat = "identity", colour = "#35978F", fill = "#80CDC1", width = 1.0)
plot_dynamics_2 <- plot_dynamics_2 + geom_errorbar(aes(ymin = feces_low_7_IAV, ymax = feces_upr_7_IAV), width = 0.4, colour = "#01665E", size = 0.8)
plot_dynamics_2 <- plot_dynamics_2 + theme_bw()
plot_dynamics_2 <- plot_dynamics_2 + scale_x_continuous(limits = c(0,20), breaks = seq(0, 20, 5))
plot_dynamics_2 <- plot_dynamics_2 + scale_y_continuous(limits = c(0,40), breaks = seq(0, 40, 10))
plot_dynamics_2 <- plot_dynamics_2 + theme(
  axis.text.x = element_text(angle = 45, hjust = 1),
  axis.line = element_line(size = 1.0, lineend = "square"),
  text = element_text(colour = "black", size = 14),
  legend.position = "none",
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  axis.ticks = element_line(linewidth = 1.5),
  axis.ticks.length = unit(-2, "mm"),
  strip.text = element_blank() # ストリップラベルを非表示にする
)
plot_dynamics_2 <- plot_dynamics_2 + guides(fill = guide_legend(title = NULL))
plot_dynamics_2 