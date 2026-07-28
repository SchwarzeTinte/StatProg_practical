library(readr)
library(readxl)
library(dplyr)
library(lubridate)


unfall_data <- read_excel(
  "mzm_export_verkehrsunfaelle.xlsx",
  sheet = "VERKEHRSUNFÄLLE"
)

write_csv(
  unfall_data,
  "verkehrsunfaelle.csv"
)

accidents <- read.csv("verkehrsunfaelle.csv")

sum(is.na(accidents$WERT))
accidents |>
  filter(is.na(WERT)) |>
  count(JAHR)

accidents_clean <- accidents |>
  filter(MONAT != "Summe") |>
  mutate(date = ym(MONAT))

glimpse(accidents_clean)

names(accidents_clean)

dim(accidents_clean$MONAT)
skimr::skim(accidents_clean)

naniar :: miss_var_summary(accidents_clean)
naniar :: vis_miss(accidents_clean)
