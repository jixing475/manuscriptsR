#' @title Search for object with specific class in an environment
#' @description Search for object with specific class in an environment
#' @param what a class to look for, Default: 'data.frame'
#' @param env An environment, Default: globalenv()
#' @return Character vector of the names of objects, NULL if none
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #obj_search("data.frame")
#'  library(ggplot2)
#'   data("mpg")
#'   obj_search("data.frame")
#'  
#'  }
#' }
#' @rdname obj_search
#' @export 

obj_search <- function(what = "data.frame", env = globalenv()) {
    all <- ls(name = env)
    objs <- lapply(
        X = all,
        FUN = function(x) {
            if (inherits(get(x, envir = env), what = what)) {
                x
            } else {
                NULL
            }
        }
    )
    objs <- unlist(objs)
    if (length(objs) == 1 && objs == "") {
        NULL
    } else {
        objs
    }
}
