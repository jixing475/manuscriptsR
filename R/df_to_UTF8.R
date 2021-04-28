#' @title Turn GBK or other char coding to UTF-8
#' @description Turn GBK or other char coding to UTF-8
#' @param df data frame
#' @return data frame
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[purrr]{set_names}}
#'  \code{\link[tmcn]{toUTF8}}
#'  \code{\link[dplyr]{mutate_all}}
#' @rdname df_to_UTF8
#' @export 
#' @importFrom purrr set_names
#' @importFrom tmcn toUTF8
#' @importFrom dplyr mutate_all
#' 
df_to_UTF8 <- function(df){
  df %>% 
    purrr::set_names(colnames(.) %>% tmcn::toUTF8()) %>% 
    dplyr::mutate_all(~ tmcn::toUTF8(.x))
}