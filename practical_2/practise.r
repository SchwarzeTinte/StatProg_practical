#install.packages("palmerpenguins")
#' Convert a variable name into a readable label
#' 
#' Replaces underscores with spaces and converts the resulting
#' string to sentence case. Also replaces "_mm" with " (mm)" and "_g" with " (g)".
#' @param variable_name A string representing a variable name.
#' @return A character string formatted as a readable label.
#' @example 
#' make_label("bill_length_mm") 
library(palmerpenguins)
library(tidyverse)
head(penguins)

#p <- penguins %>%
#  filter(species == "Adelie") %>%
#  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
#  geom_point() +
#  labs(
#    title = "Bill length vs bill depth for Adelie penguins",
#    x = "Bill length (mm)",
#    y = "Bill depth (mm)"
#  )
#
#print(p)

#' Convert a variable name into a readable label
#' 
#' Replaces underscores with spaces and converts the resulting
#' string to sentence case. Also replaces "_mm" with " (mm)" and "_g" with " (g)".
#' @param variable_name A string representing a variable name.
#' @return A character string formatted as a readable label.
#' @example 
#' make_label("bill_length_mm") 

make_label <- function(variable_name) {
    variable_name %>%
    str_replace( "_mm$", " (mm)") %>%
    str_replace( "_g$", " (g)") %>%
   str_replace_all( "_", " ") %>%
   str_to_sentence()
}

#' Create a scatter plot for one penguin species
#'
#' Filters the `penguins` dataset to one species and creates a scatter
#' plot using two user-selected numeric variables.
#'
#' @param species_name A character string specifying the penguin species.
#'   Must normally be one of `"Adelie"`, `"Chinstrap"`, or `"Gentoo"`.
#' @param x_var A character string giving the name of the column to use
#'   on the x-axis.
#' @param y_var A character string giving the name of the column to use
#'   on the y-axis.
#'
#' @return A `ggplot` object containing the scatter plot.
#'
#' @examples
#' scatter_penguins(
#'   "Adelie",
#'   "flipper_length_mm",
#'   "body_mass_g"
#' )
#'
#' scatter_penguins(
#'   "Gentoo",
#'   "bill_length_mm",
#'   "bill_depth_mm"
#' )

scatter_penguins <- function(species_name, x_var, y_var) {
    valid_species <- c("Adelie", "Chinstrap", "Gentoo")
    if(!species_name %in% valid_species) {
        stop(paste("Invalid species name. Must be one of:", paste(valid_species, collapse = ", ")))
    } 

    stopifnot(x_var %in% names(penguins),
              is.numeric(penguins[[x_var]]), 
              y_var %in% names(penguins),
              is.numeric(penguins[[y_var]]))
    plot <- penguins %>%
        filter(species == .env$species_name) %>% 
        ggplot(aes(x = .data[[x_var]], y = .data[[y_var]])) +
        geom_point() +
        labs(
            title = 
            paste("Scatter plot of", make_label(x_var), "vs", make_label(y_var), "for", species_name, "penguins"),
            x = make_label(x_var),
            y = make_label(y_var)
        )
    return(plot)
}

print(scatter_penguins("Emperor",  "fluffiness", "body_mass_g"))

scatter_penguins(
  "Adelie",
  x_var = "island",
  y_var = "body_mass_g"
)
#View(penguins %>%
#  group_by(species) %>%
#  summarise(
#    mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
#    median_bill_depth = median(bill_depth_mm, na.rm = TRUE),
#    sd_bill_length = sd(bill_length_mm, na.rm = TRUE)
#  )
#)
#
#p2 <- penguins %>% 
#    pivot_longer(
#        cols = c(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g),
#        names_to = "features",
#        values_to = "value"
#    ) %>%
#    ggplot(aes(x = species, y = value, fill = species)) +
#    geom_boxplot() +
#    facet_wrap(~features, scales = "free_y") + 
#    labs(
#        title = "Distribution of penguin features by species",
#        x = "Species",
#        y = "Value"
#
#    )
#
#print(p2)

# library(rainer)

filter_penguins_species <- function(data, species_name){
    data %>% filter(species == species_name)
}

scatter_plot <- function(data, x_var, y_var, title){
    data %>%
        ggplot(aes(x = .data[[x_var]], y = .data[[y_var]])) +
        geom_point() +
        labs(
            title = title,
            x = make_label(x_var),
            y = make_label(y_var)
        )
}

scatter_penguins_with_helper <- function(species_name, x_var = "bill_length_mm", y_var = "bill_depth_mm") {
    title <- paste("Scatter plot of", make_label(x_var), "vs", make_label(y_var), "for", species_name, "penguins")
    penguins %>%
        filter_penguins_species(species_name) %>%
        scatter_plot(x_var, y_var, title)
}

print(scatter_penguins_with_helper("Chinstrap", "flipper_length_mm", "body_mass_g"))
