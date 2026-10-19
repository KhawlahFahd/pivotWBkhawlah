#' Convert World Bank mortality data from wide to long format
#'
#' @description
#' Converts World Bank mortality data from wide format, where years are
#' stored in separate columns, into long format.
#'
#' @param data A data frame containing an `iso` variable and year columns
#' beginning with "X".
#' @param varname A character string specifying the name of the mortality
#' variable in the output data.
#'
#' @return A data frame containing `iso`, `year`, and the mortality variable.
#'
#' @examples
#' mortality_fun(maternal_mortality, "maternal_mortality")
#'
#' @export
mortality_fun <- function(data, varname) {

  data |>
    tidyr::pivot_longer(
      cols = tidyselect::starts_with("X"),
      names_to = "year",
      names_prefix = "X",
      values_to = varname
    ) |>
    dplyr::mutate(year = as.numeric(.data$year)) |>
    dplyr::select(.data$iso, .data$year, tidyselect::all_of(varname))
}
