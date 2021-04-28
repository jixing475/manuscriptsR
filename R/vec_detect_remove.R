#' @title delete element from vector by str_dectect
#' @description delete element from vector by str_dectct
#' @param vec vector
#' @param pattern PARAM_DESCRIPTION
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
#'  \code{\link[stringr]{str_detect}}
#' @rdname vec_detect_remove
#' @export 
#' @importFrom stringr str_detect
#' 
#' 
vec_detect_remove <-
    function(vec, pattern,...){
        vec <-
            vec[-(which(stringr::str_detect(vec, pattern = pattern)))]
        return(vec)
    }
