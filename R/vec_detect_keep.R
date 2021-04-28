#' @title keep element from vector by str_dectect
#' @description keep element from vector by str_dectct
#' @param vec vector
#' @param pattern the pattern to match
#' @param ... PARAM_DESCRIPTION
#' @return vector
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[stringr]{str_detect}}
#' @rdname vec_detect_keep
#' @export 
#' @importFrom stringr str_detect

vec_detect_keep <-
  function(vec, pattern, ...) {
    vec <-
      vec[stringr::str_detect(vec, pattern = pattern)]
    return(vec)
  }
