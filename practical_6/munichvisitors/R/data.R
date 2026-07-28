#' Monthly visitor counts for Munich museums
#'
#' Monthly visitor statistics for Munich's public museums, sourced from
#' Munich Open Data (Statistisches Amt München). Data covers all major
#' municipal museums with year-on-year comparison figures.
#'
#' @format A data frame with one row per museum per month:
#' \describe{
#'   \item{monatszahl}{Category label (always "Besucher*innen")}
#'   \item{auspraegung}{Museum name}
#'   \item{jahr}{Year}
#'   \item{monat}{Year-month code (YYYYMM format)}
#'   \item{wert}{Visitor count for that month}
#'   \item{vorjahreswert}{Visitor count in the same month of the prior year}
#'   \item{veraend_vormonat_prozent}{Percentage change vs. previous month}
#'   \item{veraend_vorjahresmonat_prozent}{Percentage change vs. same month prior year}
#'   \item{zwoelf_monate_mittelwert}{12-month rolling average}
#' }
#' @source Landeshauptstadt München (2017). Monatszahlen Museen.
#'   Statistisches Amt München. Lizenz: Datenlizenz Deutschland
#'   Namensnennung 2.0 (dl-by-de).
#'   <https://datengartln.de/datasets/detail/bfb4a286-bea5-4bfe-82ce-b9bd354284a5/>
"museum_visitors"