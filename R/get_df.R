#' @title Retrieve a data.frame by name from an environment
#' @description Retrieve a data.frame by name from an environment
#' @param df character, name of the object
#' @param env an environment, Default: globalenv()
#' @return the object
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname get_df
#' @export 

get_df <- function(df, env = globalenv()) {
    if (is.data.frame(df))
        return(df)
    if (df %in% ls(name = env)) {
        get(x = df, envir = env)
    } else {
        NULL
    }
}
