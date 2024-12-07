

library(ggplot2)

#plot shape and colours are determined based on data

plot <- ggplot(data, aes(x = as.Date(Date)))
plot <- plot + geom_point(aes(y = log10(case)), shape = 23, color = "#FEC44F", fill = "#FEC44F")
plot <- plot + geom_point(aes(y = ww_2, color = as.character(posi), shape = as.character(posi), fill = as.character(posi)))
plot <- plot + scale_shape_manual(values = c(25, 16))
plot <- plot + scale_fill_manual(values = c("#ECE7F2","#0570B0"))
plot <- plot + scale_color_manual(values = c("#74A9CF","#0570B0"))
plot <- plot + labs(x = "Date", y = "wastewater concentration")
plot <- plot + scale_x_date(limits = c(as.Date("2022-08-01"), as.Date("2024-07-01")), date_breaks = "3 months", date_labels = "%b")
plot <- plot + scale_y_continuous(limits = c(-0.5, 5.5), breaks = seq(1.0, 5.0, 1.0))
plot <- plot + theme_bw()
plot <- plot + theme(
  axis.line = element_line(linewidth = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.ticks = element_line(linewidth = 1.0),
  axis.ticks.length = unit(-2, "mm"))
plot




#Plot shape and colours are determined manually

#360*190
plot <- ggplot(data_3, aes(x = as.Date(Date)))
plot <- plot + geom_ribbon(aes(ymin = risk_1_low, ymax = risk_1_upr), colour = "NA", alpha = 0.5, fill = "#74A9CF")
plot <- plot + geom_point(aes(y = risk_1_med), color = "#D0D1E6", size = 1.5) #100%
plot <- plot + geom_point(aes(y = risk_2_med), shape = 25, color = "#DFC27D", fill = "#FEC44F", size = 1.0) #25%
plot <- plot + geom_point(aes(y = risk_3_med), shape = 21, color = "#0570B0", fill = "#DEEBF7", size = 1.1) #10%
plot <- plot + geom_point(aes(y = risk_4_med), color = "#DFC27D", size = 1.5) #5%
plot <- plot + geom_point(aes(y = risk_5_med), shape = 24, color = "#35978F", fill = "#80CDC1", size = 1.0) #2.5%
plot <- plot + geom_point(aes(y = risk_6_med), color = "#35978F", size = 1.5) #1.0%
plot <- plot + labs(x = "day", y = "Risk")
plot <- plot + scale_y_continuous(limits = c(0.0,1.0), breaks = seq(0.0, 1.0, 0.25))
plot <- plot + scale_x_date(limits = c(as.Date("2022-08-01"), as.Date("2024-07-01")), date_breaks = "3 months", date_labels = "%b")
plot <- plot + theme_bw()
plot <- plot + theme(
  axis.text.x = element_text(angle = 45, hjust = 1),
  axis.line = element_line(size = 1.0, lineend = "square"),
  text = element_text(colour ="black", size = 14),
  legend.position = "none",
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  axis.ticks = element_line(linewidth = 1.0),
  axis.ticks.length = unit(-2, "mm"))
plot <- plot + guides(fill = guide_legend(title = NULL))
plot