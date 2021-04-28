#' @title change factor variable code
#' @description change factor variable code
#' @param var variable name
#' @param levels_code_string a string for code change, Default: '0=否, 1=是'
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' ABData <- tribble(
#'     ~name, ~sex, ~seek,
#'     "Mary", "F", "M",
#'     "Henry", "M", "F"
#' ) %>% as.data.frame()
#'
#'
#' df_repl <- tibble::tribble(
#'     ~var,         ~var_code,
#'     "sex",  "F=Woman, M=Man",
#'     "seek", "F=zhu, M=jixing"
#' )
#'
#' for(i in 1:nrow(df_repl)) {
#'     print(df_repl$var[i])
#'     ABData <-
#'         ABData %>%
#'         mutate_at(df_repl$var[i],
#'                   my_clean_factor, levels = df_repl$var_code[i])
#' }
#'
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[purrr]{set_names}}
#'  \code{\link[cleaner]{clean}}
#' @rdname my_clean_factor
#' @export 
#' @importFrom purrr set_names
#' @importFrom cleaner clean_factor
#' 
my_clean_factor <- function(var, levels_code_string = "0=否, 1=是", ... ) {
    # get the
    levels_code_df <-
        levels_code_string %>%
        str_split("[,，]") %>% unlist() %>%
        str_split("=") %>% unlist() %>%
        str_squish() %>%
        matrix(ncol = 2, byrow = TRUE) %>%
        as.data.frame() %>%
        purrr::set_names(c("from", "to"))

    levels_code <- levels_code_df$to %>% as.character()
    names(levels_code) <- levels_code_df$from %>% as.character()
    var_factor_clean <- cleaner::clean_factor(var, levels = levels_code)
    return(var_factor_clean)
}
