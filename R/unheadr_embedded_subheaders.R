#' @title Rectangling  embedded subheaders
#' @description  Rectangling  embedded subheaders
#' @param df a dataframe with embedded subheaders
#' @param regex Regular expression to match the subheaders
#' @param orig Variable containing the extraneous subheaders
#' @param new Name or variable that will contain the group values
#'
#' @return dataframe
#'
#' @examples
#' dat <- data.frame(
#' drink = c(
#'    "Cold Drinks", "Soda", "Water", "Juice", "Lemonade",
#'    "Hot Drinks", "Tea", "Coffee"
#' ),
#' price = c(NA, 2.99, 1.99, 3.15, 2, NA, 3.99, 1.99), stringsAsFactors = FALSE
#' )
#' (dat, "Drinks$", drink, "beverage_type")
#'
#' @rdname unheadr_embedded_subheaders
#' @export

unheadr_embedded_subheaders <- unheadr::untangle2
