#' Download monthly statistics for Munich theatres
#'
#' Downloads monthly theatre statistics from Munich Open Data and
#' returns observations for a selected indicator and optional set of years.
#'
#' @param indicator A single character string specifying the indicator.
#'   Must be one of `"Besucher*innen"`, `"Auff\u00fchrungen"`, or
#'   `"Platzausnutzung"`.
#' @param years An optional numeric vector of years to retain.
#'   The default, `NULL`, keeps all available years.
#'
#' @return A tibble containing monthly theatre statistics.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_theatre_stats()
#'
#' get_theatre_stats(
#'   indicator = "Auff\u00fchrungen",
#'   years = 2019:2024
#' )
#' }

get_theatre_stats <- function(indicator = "Besucher*innen", years = NULL){
    allowed_indicators <- c(
        "Besucher*innen",
        "Auff\u00fchrungen",
        "Platzausnutzung"
    )
    if(!is.character(indicator) || 
        length(indicator) != 1L || 
        is.na(indicator) || 
        !indicator %in% allowed_indicators){
        stop(
            paste0(
                "Invalid indicator. Must be one of: ",
                paste(allowed_indicators, collapse = ", ")
            ),
        call. = FALSE
        )

    }

    if(!is.null(years)){
        if(!is.numeric(years) || any(is.na(years))){
            stop("Invalid years. Must be a numeric vector of years.", call. = FALSE)
        }
    }

    url <- paste0(
    "https://opendata.muenchen.de/dataset/",
    "dacf1009-8933-4cdf-8c9d-40afd54e4ef7/resource/",
    "eb734a10-3b0a-4421-ae1d-4226f9409538/download/",
    "monatszahlen2510_theater_30_10_25.csv"
  )

  theatre_stats <- readr::read_csv(
    url,
    show_col_types = FALSE
  ) |>
    janitor::clean_names() 

    result <- theatre_stats |>
    dplyr::filter(
      monatszahl == indicator,
      monat != "Summe",
      !is.na(wert)
    )

    if(!is.null(years)){
        result <- result |>
            dplyr::filter(
                jahr %in% years
            )
    }

    return(result)
}
