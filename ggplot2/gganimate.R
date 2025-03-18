

library(ggplot2)
library(gganimate)
library(dplyr)

# サンプルデータ作成（時間ごとの値の変化）
df <- data.frame(
  time = rep(1:10, times = 2),
  value = c(cumsum(runif(10, -1, 1)), cumsum(runif(10, -1, 1))),
  group = rep(c("A", "B"), each = 10)
)

# X軸の変化とともに: transition_reveal
p <- ggplot(df, aes(x = time, y = value, color = group)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(title = "Time: {frame_time}", x = "Time", y = "Value") +
  theme_minimal() +
  transition_reveal(time)  # x 軸の "time" に沿ってアニメーション

# アニメーションを作成
animate(p, fps = 10, duration = 5, width = 600, height = 400)






# 凡例(year)の変化とともに: transition_time
p <- ggplot(gapminder, aes(x = year, y = lifeExp, size = pop, color = continent)) +
  geom_point(alpha = 0.7) +
  scale_x_continuous(breaks = seq(1950, 2010, 10)) +
  labs(title = "Year: {frame_time}", x = "Year", y = "Life Expectancy") +
  theme_minimal() +
  transition_time(year)  # x 軸の year に沿ってアニメーション

# アニメーションを作成
animate(p, fps = 10, duration = 5, width = 600, height = 400)





