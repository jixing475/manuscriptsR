#' @title get dataframe meta infomation
#' @description get dataframe meta infomation
#' @param df data frame
#' @return data frame
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  meta_info_extract(iris)
#'  }
#' }
#' @seealso 
#'  \code{\link[dplyr]{summarise_all}}
#'  \code{\link[tidyr]{gather}}
#'  \code{\link[labelled]{var_label}}
#' @rdname meta_info_extract
#' @export 
#' @importFrom dplyr summarise_all
#' @importFrom tidyr gather
#' @importFrom labelled var_label
#' @importFrom purrr map_chr
meta_info_extract <- function(df){
  meta <- 
    df %>% 
    dplyr::summarise_all(class) %>% 
    tidyr::gather(variable, class)
  
  meta$label <- labelled::var_label(df) %>% 
    purrr::map_chr(~ {
      if(is.null(.x)){
        return(NA)
      }else(
        return(.x)
      )
    })
  return(meta)
}
