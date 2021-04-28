#' @title Merge break rows
#' @description Merge break rows
#' @param df A data frame with at least two contiguous rows to be merged
#' @param regex	A regular expression to identify sets of rows to be merged, meant for the leading of the two contiguous rows.
#' @param ogcol Variable with the text strings to match.
#' @param sep Character string to separate the unified values
#'
#' @return dataframe
#'
#' @examples
#' bball <-
#'     data.frame(
#'         stringsAsFactors = FALSE,
#'         v1 = c(
#'             "Player", NA, "Sleve McDichael", "Dean Wesrey",
#'             "Karl Dandleton"
#'         ),
#'         v2 = c("Most points", "in a game", "55", "43", "41"),
#'         v3 = c("Season", "(year ending)", "2001", "2000", "2010")
#'     )
#' unheadr_unbreak_rows(bball, "Most", v2)

#'
#' @rdname unheadr_unbreak_rows
#' @export

unheadr_unbreak_rows <- unheadr::unbreak_rows

