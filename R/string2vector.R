#' @title turn string to vector
#' @description turn string to vector
#' @param string PARAM_DESCRIPTION
#' @param sep PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[stringr]{str_split}}
#' @rdname string2vector
#' @export 
#' @importFrom stringr str_split

string2vector <-
    function(string, sep){
        unlist(stringr::str_split(string, sep))
    }
