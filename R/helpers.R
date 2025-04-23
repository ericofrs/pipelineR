# Factors function
factors <- function(n) {
  which(n %% 1:n == 0)
}

# Best factor
best_factor <- function(.vec) {
  valid_factors <- factors(length(.vec))

  filtered <- valid_factors[length(.vec) / valid_factors <= 100 & length(.vec) / valid_factors > 30]

  n_groups <- min(filtered)

  return(n_groups)
}
