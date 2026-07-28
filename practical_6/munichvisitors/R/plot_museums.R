#' Annual visitor counts per Munich museum
#'
#' Plots annual visitor totals for each museum in the bundled
#' `museum_visitors` dataset, using the yearly summary rows
#' (where `monat == "Summe"`).
#'
#' @return A `ggplot2` plot object.
#' @export
#' @examples
#' plot_museums()
plot_museums <- function() {
  museum_visitors |>
    dplyr::filter(
      monat == "Summe"
    ) |>
    ggplot2::ggplot(
      ggplot2::aes(
        x = jahr,
        y = wert,
        colour = auspraegung
      )
    ) +
    ggplot2::geom_line() +
    ggplot2::labs(
      x = "Year",
      y = "Visitors",
      colour = "Museum"
      
    ) +
    ggplot2::ggtitle(
      "Annual Visitors to Museums in Munich"
    ) +
    ggplot2::scale_y_continuous(
      labels = scales::label_number()
    )
}
