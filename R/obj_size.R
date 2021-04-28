#' @title calculate the size of objector
#' @description calculate the size of objector
#' @param x R object
#' @return strings
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname obj_size
#' @export 

obj_size <- function(x){
    size <- format(object.size(x), units = "auto")
    return(size)
}
