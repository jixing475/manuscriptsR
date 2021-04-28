#' @title sum of the na number in df
#' @description sum of the na number in df
#' @param df dataframe
#' @return dataframe
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[purrr]{map}}
#' @rdname na_numb_sum
#' @export 
#' @importFrom purrr map
na_numb_sum <- function(df) {
    df %>%
        purrr::map(~ is.na(.x) %>% sum()) %>%
        unlist() %>%
        sum()
}

