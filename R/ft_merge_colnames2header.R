#' @title colnames merge to header
#' @description This function is use to merge the dataframe colname the same element as head. first, i seprate the colnames with sep as dataframe typology. them I use flextable function to merge the same element.
#' @param df dataframe
#' @param sep the separator, Default: '\.'
#' @return flextable object
#' @details DETAILS
#' @examples 
#' head(iris) %>%
#' ft_merge_colnames2header(., sep = "\\.")
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[dplyr]{mutate}},\code{\link[dplyr]{if_else}}
#'  \code{\link[tidyr]{separate}}
#'  \code{\link[flextable]{flextable}},\code{\link[flextable]{set_header_footer_df}},\code{\link[flextable]{merge_h}},\code{\link[flextable]{merge_v}},\code{\link[flextable]{theme_booktabs}},\code{\link[flextable]{autofit}},\code{\link[flextable]{fix_border_issues}},\code{\link[flextable]{align}}
#' @rdname ft_merge_colnames2header
#' @export 
#' @importFrom dplyr mutate if_else
#' @importFrom tidyr separate
#' @importFrom flextable flextable set_header_df merge_h merge_v theme_booktabs autofit fix_border_issues align
ft_merge_colnames2header <- function(df, sep = "\\.") {
    typology <-
        data.frame(col_keys = colnames(df),
                   stringsAsFactors = FALSE ) %>%
        dplyr::mutate(to_sep = col_keys) %>%
        tidyr::separate(to_sep, into=c("top","second"), sep = sep) %>%
        dplyr::mutate(second = dplyr::if_else(is.na(second), top, second))


    flextable::flextable(df) %>%
        flextable::set_header_df(mapping = typology, key = "col_keys" ) %>%
        flextable::merge_h(part = "header") %>%
        flextable::merge_v(part = "header") %>%
        flextable::theme_booktabs() %>%
        flextable::autofit() %>%
        flextable::fix_border_issues() %>%
        flextable::align(align = "center", part = "header") %>%
        flextable::align(align = "center", part = "body")
}
