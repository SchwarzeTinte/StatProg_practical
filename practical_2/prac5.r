load_penguins <- function() {
  palmerpenguins::penguins
}

drop_missing <- function(data, cols) {
  data[complete.cases(data[, cols]), ]
}

print_summary <- function(data) {
  cat("n =", nrow(data), "\n")
  cat(
    "mean bill length:",
    mean(data$bill_length_mm),
    "\n"
  )
  cat(
    "mean body mass:",
    mean(data$body_mass_g),
    "\n"
  )
}

scatter_bill_vs_mass <- function(data, title) {
  ggplot(
    data,
    aes(
      x = bill_length_mm,
      y = body_mass_g
    )
  ) +
    geom_point() +
    labs(title = title)
}

penguin_report <- function(species_name) {
  data <- load_penguins() %>%
    drop_missing(
      c(
        "bill_length_mm",
        "body_mass_g"
      )
    ) %>%
    filter(species == .env$species_name)

  print_summary(data)

  scatter_bill_vs_mass(
    data,
    title = paste(
      "Bill length vs. body mass —",
      species_name
    )
  )
}

penguin_report("Adelie")


