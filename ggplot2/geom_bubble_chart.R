data_2 <- Data %>% drop_na()
p1 <- ggplot(data_2, aes(x = log10(IAV/389), y = Positive, size = PN))
p1 <- p1 + geom_point(alpha = 0.4, shape = 21, colour = "black", fill = "lightblue")
p1 <- p1 + scale_size_continuous(range = c(1, 20))
p1 <- p1 + xlab("Newly reported case") + ylab("Detection rate")
p1 <- p1 + theme_bw()
p1
