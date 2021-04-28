#' @title factor to character
#' @description opposite to separate_rows() from tidyr
#'
#' @examples
#'
#' library(magrittr)
#' data.frame(
#'     stringsAsFactors = FALSE,
#'     player = c("Allan Houston", NA, "Latrell Sprewell", NA, NA),
#'     teams = c(
#'         "Pistons", "Knicks", "Warriors", "Knicks",
#'         "Timberwolves"
#'     ),
#'     position = c("Shooting guard", NA, "Small forward", NA, NA)
#' ) %>%
#'     manuscriptsJX::un_separate_rows(groupingVar = player, separator = ", ")
#' #> # A tibble: 2 x 3
#' #>   player           teams                          position
#' #>   <chr>            <chr>                          <chr>
#' #> 1 Allan Houston    Pistons, Knicks                Shooting guard
#' #> 2 Latrell Sprewell Warriors, Knicks, Timberwolves Small forward
#'
#'
#' @rdname un_separate_rows
#' @export
#'
un_separate_rows <- unheadr::unwrap_cols
