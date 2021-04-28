#' @title grouped data transformation
#'
#' @description Repeated consecutive values of group columns will
#' be used to define the title of the groups and will
#' be added as a row title.
#'
#' @param x dataset
#' @param groups columns names to be used as row separators.
#' @param columns columns names to keep
#' @examples
#' # as_grouped_data -----
#' library(data.table)
#' CO2 <- CO2
#' setDT(CO2)
#' CO2$conc <- as.integer(CO2$conc)
#'
#' data_co2 <- dcast(CO2, Treatment + conc ~ Type,
#'   value.var = "uptake", fun.aggregate = mean)
#' data_co2
#' data_co2 <- as_grouped_data(x = data_co2, groups = c("Treatment"))
#' data_co2
#' @rdname as_grouped_data
#' @export

as_grouped_data <- flextable::as_grouped_data
