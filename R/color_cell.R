#' @title color the cell
#' @description color a specific location cell
#' @param df dataframe
#' @param ft flextable object
#' @param col the coulumns names for formate
#' @param fn the fuction to locate, Default: min
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[dplyr]{pull}}
#'  \code{\link[flextable]{color}},\code{\link[flextable]{bold}}
#' @rdname color_cell
#' @export 
#' @importFrom dplyr pull
#' @importFrom flextable color bold
color_cell <- function(df, ft, col, fn = min) {
    if (deparse(substitute(fn)) == "min") {
        color = "#4CA533" # green
    } else{
        color = "darkred"
    }
    value <- df %>% dplyr::pull(col) %>% fn
    row_id <- df %>% dplyr::pull(col) %>% `==`(., value)
    col_id <- col
    ft <-
        ft %>%
        flextable::color(., i = row_id, j = col_id, color = color) %>%
        flextable::bold(.,  i = row_id, j = col_id, bold = TRUE, part = "body")
    return(ft)
}

