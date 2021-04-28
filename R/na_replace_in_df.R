#' @title na to x in df with all columns
#' @description na to x in df with all columns
#' @param df dataframe
#' @param x the replace value
#' @return dataframe
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[dplyr]{mutate_all}}
#'  \code{\link[tidyr]{replace_na}}
#' @rdname na_replace_in_df
#' @export 
#' @importFrom tidyr replace_na
na_replace_in_df <- function(df, x){
    df <-
    df %>%
      tidyr::replace_na(list(value = 0))
    return(df)
}
