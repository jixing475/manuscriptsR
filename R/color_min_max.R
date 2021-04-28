#' @title color the cell with min and max values
#' @description color the cell with min and max values
#' @param df dataframe
#' @return flextable
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #iris %>%
#'     head() %>%
#'     color_min_max() %>%
#'     manuscriptsJX::my_ft()
#'  }
#' }
#' @seealso 
#'  \code{\link[flextable]{flextable}}
#'  \code{\link[dplyr]{select_all}}
#' @rdname color_min_max
#' @export 
#' @importFrom flextable flextable
#' @importFrom dplyr select_if

color_min_max <- function(df){
    ft <- flextable::flextable(df)
    col_name <- dplyr::select_if(df, is.numeric) %>% colnames()
    for (col in col_name) {
        ft <-
            ft %>%
            color_cell(df, ., col, fn = max) %>%
            color_cell(df, ., col,  fn = min)
    }
    return(ft)
}
