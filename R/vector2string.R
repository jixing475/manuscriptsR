#' @title Convert vector to string
#' @description Convert vector to string
#' @param vector PARAM_DESCRIPTION
#' @param sep PARAM_DESCRIPTION, Default: ', '
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname vector2string
#' @export 

vector2string <- function (vector, sep = ", ")
{
    s <- as.character(vector[1])
    if (length(vector) > 1) {
        for (i in 2:length(vector)) {
            s <- paste(s, vector[i], sep = sep)
        }
    }
    return(s)
}
