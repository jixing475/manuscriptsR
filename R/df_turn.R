#' @title t() for data frame
#' @description t() for data frame
#' @param df data frame
#' @return data frame
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname df_turn
#' @export 

df_turn <- function(df){
  row_names <- rownames(df)
  col_names <- colnames(df)
  df_t <- df %>% t() %>% as.data.frame()
  rownames(df_t) <- col_names
  colnames(df_t) <- row_names
  return(df_t)
}
