

solve_P <- function(a, R) {
  f <- function(P) (1 - P) * (1 + (R * P) / a)^a - 1
  
  # P = 0 は自明な解なので除外し、Pの範囲を(1e-6, 1-1e-6) にする
  result <- tryCatch({
    uniroot(f, lower = 1e-6, upper = 1 - 1e-6, tol = 1e-9)$root
  }, error = function(e) NA)  # 解がない場合はNAを返す
  
  return(result)
}

# 例: a = 1, R = 1.5 の場合
a <- 3
R <- 3
P_solution <- solve_P(a, R)
print(P_solution)
