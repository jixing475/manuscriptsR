#' @title super split
#' @description split function plus from #' Lists are my secret weapon for reporting stats with knitr, https://www.tjmahr.com/lists-knitr-secret-weapon/. The first variable splits the list at depth 0, the second variable splits the sublists at depth 1 (which were created in the prior split), and so on.
#' @param .data PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[rlang]{nse-defuse}},\code{\link[rlang]{as_name}}
#'  \code{\link[purrr]{map_if}}
#' @rdname super_split
#' @export 
#' @importFrom rlang enquos as_name
#' @importFrom purrr map_depth
#' 
#' 
super_split <- function(.data, ...) {
  dots <- rlang::enquos(...)
  for (var in seq_along(dots)) {
    var_name <- rlang::as_name(dots[[var]])
    .data <- purrr::map_depth(
      .x = .data,
      .depth = var - 1,
      .f = function(xs) split(xs, xs[var_name])
    )
  }
  .data
}
