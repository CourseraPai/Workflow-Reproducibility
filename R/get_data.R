#' .. content for \Get data for the URL provided{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @get_data(url)

get_data <- function(url) {

  data <- readr::read_csv(url)
  return(data)

}
