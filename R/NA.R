#' @title NA to something
#' @description convert NA to something
#' @param s The input vector (of arbitrary class)
#' @param x The elements to transform into NA resp. what to transform NA into, Default: 0
#' @return A vector with same dimension and class as s
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #na_na2x(na_x2na(c(1:10),5),5)
#'  }
#' }
#' @rdname na_na2x
#' @export 

na_na2x <- function (s, x = 0)
{
    sapply(s, function(y) ifelse(is.na(y), x, y))
}

#' @title na_x2na
#' @description convert vecter to NA
#' @param s 	The input vector (of arbitrary class)
#' @param x  The elements to transform into NA resp. what to transform NA into
#' @return A vector with same dimension and class as s
#'
#' @examples na_x2na(1:10, 1:5)
#'
#' @rdname na_x2na
#' @export

na_x2na <- function (s, x = 0)
{
    sapply(s, function(y)
        ifelse(y %in% x, NA, y))
}


#' @title NULL to NA
#' @description try to convert NULL to NA
#' @param x list element
#'
#' @return list element
#' @rdname null2na
#' @export
#' @examples
#' test <- list(1, 2, 3, NULL)
#' test %>% map(~ na_null2na(.x))
#'

na_null2na <- function (x)
{
    if (is.null(x) || length(x) == 0)
        x <- as.character(NA)
    else x <- unique(unlist(x))
    x
}

# RpsiXML::null2na

#' @title plot the missing value
#' @description plot the missing value
#' @param df dataframe
#'
#' @return plot
#'
#' @examples
#'
#' @importFrom naniar vis_miss
#'
#' @rdname na_vis_miss
#' @export
#'

na_vis_miss  <-
    function(df) {
        naniar::vis_miss(df)
    }


#' @title remove vector NA element
#' @description remove vector NA element
#' @param x vector
#'
#' @return vector
#'
#' @examples
#'
#'
#' @rdname na_remove
#' @export
na_remove <- function(x){
    x <-x[which(!is.na(x))]
    return(x)
}


#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param s PARAM_DESCRIPTION
#' @param x PARAM_DESCRIPTION, Default: 0
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname na_x2na_ifLessX
#' @export 

na_x2na_ifLessX <- function (s, x = 0) {
    sapply(s, function(y)
        ifelse(y < x, NA, y))
}


#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param s PARAM_DESCRIPTION
#' @param x PARAM_DESCRIPTION, Default: 0
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname na_x2na_ifMoreX
#' @export 

na_x2na_ifMoreX <- function (s, x = 0) {
    sapply(s, function(y)
        ifelse(y > x, NA, y))
}

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param df PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[DataExplorer]{plot_missing}}
#'  \code{\link[ggplot2]{ggtheme}}
#' @rdname na_plot_missing
#' @export 
#' @importFrom DataExplorer plot_missing
#' @importFrom ggplot2 theme_light
#' 
na_plot_missing <- function(df) {
    df %>% 
    DataExplorer::plot_missing(
        ggtheme = ggplot2::theme_light())
}
