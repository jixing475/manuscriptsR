#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param dois PARAM_DESCRIPTION, Default: NULL
#' @param query PARAM_DESCRIPTION, Default: NULL
#' @param filter PARAM_DESCRIPTION, Default: NULL
#' @param offset PARAM_DESCRIPTION, Default: NULL
#' @param limit PARAM_DESCRIPTION, Default: NULL
#' @param sample PARAM_DESCRIPTION, Default: NULL
#' @param sort PARAM_DESCRIPTION, Default: NULL
#' @param order PARAM_DESCRIPTION, Default: NULL
#' @param facet PARAM_DESCRIPTION, Default: FALSE
#' @param cursor PARAM_DESCRIPTION, Default: NULL
#' @param cursor_max PARAM_DESCRIPTION, Default: 5000
#' @param .progress PARAM_DESCRIPTION, Default: 'none'
#' @param flq PARAM_DESCRIPTION, Default: NULL
#' @param select PARAM_DESCRIPTION, Default: NULL
#' @param async PARAM_DESCRIPTION, Default: FALSE
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
#'  \code{\link[tibble]{as_tibble}}
#' @rdname title_to_doi
#' @export 
#' @importFrom tibble as_tibble

title_to_doi <- rcrossref::cr_works
