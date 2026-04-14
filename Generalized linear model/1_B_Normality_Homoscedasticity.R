lm_model <- lm (Y ~ X + as.factor(D), data = d) 

#Extract residual data
res <- lm_model$residuals
data_res <- data.frame(res)
 
#-------------------------------------------------------------------------------------------------Normality check (1)散布図
RR_plot <- ggplot() + geom_point(aes(x = X, y = res))#プロット + 
labs(title = "Linear regerssion", x = "Number of drivers (log10)", y = "deaths (log10)") +
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


#----------------------------------------------------------------------------------------------------Normality check (2) #ヒストグラム
data_res <- data.frame(res)
RR_plot <- ggplot(data_res, aes(x = res)) + 
geom_histogram(aes(y = after_stat(density)), binwidth = 0.3, colour = “blue”)+ 
stat_function(fun = dnorm, args = list(mean = mean(data_res$res), sd = sd(data_res$res)) + 
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

#----------------------------------------------------------------------------------------------------Normality check (3) #Shapiro-wilk test and Q-Q plot
shapiro_test_result <- shapiro.test(data_res$res)
print(shapiro_test_result) 

qq_data <- data.frame(Theoretical = qnorm(ppoints(length(data_res$res))), Observed = sort(data_res$res))
ggplot(qq_data, aes(x = Theoretical, y = Observed)) + geom_point() +
  geom_abline(intercept = mean(data_res$res), slope = sd(data_res$res), color = "red", linetype = "dashed") +
  labs(title = "Q-Q Plot", x = "Theoretical Quantiles", y = "Observed Quantiles") + theme_minimal() +
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



#------------------------------------------------------------------------------------------------------Homoscedasticity
library(car)
ncvTest(res_lm) “res_lm is model name

#Breusch-Pagan test
library(lmtest)
bptest(model)


#不均一分散に頑健な標準誤差
library(sandwich)
sqrt(vcovHC(model, type = “HC”)) #modelは回帰分析の名前

#パラメータの分散・共分散行列の出力
vcov(model)
                                 


                                   
