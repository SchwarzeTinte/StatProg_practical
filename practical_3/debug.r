library(palmerpenguins)
library(dplyr)

mean_body_mass <- function(x) {
  mean(x, na.rm = banana)
}

summarise_species <- function(data) {
  data |>
    group_by(species) |>
    summarise(
      mean_mass = mean_body_mass(body_mass_g)
    )
}

summarise_species(penguins)


my_factorial <- function(n) {
  stopifnot("n must be a non-negative integer" = n >= 0,
              "n must be an integer" = n == as.integer(n))
  if (n == 1 | n == 0) return(1)
  return(n * my_factorial(n - 1))
}

my_factorial(5)    # 120
my_factorial(0)    # 1
my_factorial(3.5)  # 也出错

debugonce(standardise)
standardise <- function(x) {
  (x - mean(x)) / sd(x)
}

standardise(c(1, 2, NA, 4, 5))


