install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)
head(penguins)

p <- penguins %>%
  filter(species == "Adelie") %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  labs(
    title = "Bill length vs bill depth for Adelie penguins",
    x = "Bill length (mm)",
    y = "Bill depth (mm)"
  )

print(p)

View(penguins %>%
  group_by(species) %>%
  summarise(
    mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
    median_bill_depth = median(bill_depth_mm, na.rm = TRUE),
    sd_bill_length = sd(bill_length_mm, na.rm = TRUE)
  )
)
p2 <- penguins %>% 
    pivot_longer(
        cols = c(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g),
        names_to = "features",
        values_to = "value"
    ) %>%
    ggplot(aes(x = species, y = value, fill = species)) +
    geom_boxplot() +
    facet_wrap(~features, scales = "free_y") + 
    labs(
        title = "Distribution of penguin features by species",
        x = "Species",
        y = "Value"

    )

print(p2)
