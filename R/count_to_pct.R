#' @title add percent to count
#' @description add percent to count
#' @param data dataframe
#'
#' @return dataframe
#'
#' @examples
#'
#' iris %>%
#'     count(Species) %>%
#'     count_to_pct()
#' @rdname count_to_pct
#' @export
#'
#'
count_to_pct <- function(data, ..., col = n) {
    grouping_vars_expr <- quos(...)
    col_expr <- enquo(col)

    ret <- data %>%
        group_by(!!!grouping_vars_expr) %>%
        mutate(pct = (!!col_expr) / sum(!!col_expr)) %>%
        ungroup()

    return(ret)

}


