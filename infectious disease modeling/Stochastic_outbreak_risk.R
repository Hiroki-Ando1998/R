

solve_P <- function(a, R) {
  f <- function(P) (1 - P) * (1 + (R * P) / a)^a - 1
  
  # P = 0 is obvious answer. The range of P is set (1e-8, 1-1e-8)
  result <- tryCatch({
    uniroot(f, lower = 1e-8, upper = 1 - 1e-8, tol = 1e-9)$root
  }, error = function(e) NA)  # if there is no answer, NA
  
  return(result)
}

# for instance: a = 1, R = 1.5
a <- 3
R <- 3
P_solution <- solve_P(a, R)
print(P_solution)
