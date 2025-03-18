

library(ggplot2)
library(gganimate)
library(dplyr)

# サンプルデータ作成（時間ごとの値の変化）
df <- data.frame(
  time = rep(1:10, times = 2),
  value = c(cumsum(runif(10, -1, 1)), cumsum(runif(10, -1, 1))),
  group = rep(c("A", "B"), each = 10)
)

# ggplot2 の通常のプロット
p <- ggplot(df, aes(x = time, y = value, color = group)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(title = "Time: {frame_time}", x = "Time", y = "Value") +
  theme_minimal() +
  transition_reveal(time)  # x 軸の "time" に沿ってアニメーション

# アニメーションを作成
animate(p, fps = 10, duration = 5, width = 600, height = 400)
