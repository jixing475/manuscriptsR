#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param filename PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname load_rdata
#' @export 

# The PTS data and journalist data are saved as .RData files, so they load into
# R with their original object names. This function lets you load an .RData file
# directly to a new object instead of bringing in the original name.
# (via https://stackoverflow.com/a/25455968/120898)

load_rdata <- function(filename) {
  load(filename)
  get(ls()[ls() != "filename"])
}
