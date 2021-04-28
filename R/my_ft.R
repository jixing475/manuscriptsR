#' @title formated the dataframe or flextable as my favorite
#' @description formated the dataframe or flextable as my favorite
#' @param df dataframe or flextable
#' @param col.keys PARAM_DESCRIPTION, Default: NULL
#' @param col.digits PARAM_DESCRIPTION, Default: NULL
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[flextable]{flextable}},\code{\link[flextable]{colformat_num}},\code{\link[flextable]{border_outer}},\code{\link[flextable]{border_inner_h}},\code{\link[flextable]{border_inner_v}},\code{\link[flextable]{font}},\code{\link[flextable]{bold}},\code{\link[flextable]{align}},\code{\link[flextable]{autofit}}
#'  \code{\link[officer]{fp_border}}
#' @rdname my_ft
#' @export 
#' @importFrom flextable flextable colformat_num border_outer border_inner_h border_inner_v font bold align autofit
#' @importFrom officer fp_border
my_ft <- function(df,
                  col.keys = NULL,
                  col.digits = NULL) {
    # create basic flextable
    if (is.data.frame(df)) {
        f.table <- flextable::flextable(df)
    } else {
        f.table <- df
    }


    # set numbers of decimals for numeric variables, if specified
    if (!is.null(col.keys)) {
        for (j in 1:length(col.keys)) {
            f.table = flextable::colformat_num(x = f.table,
                                               col_keys = col.keys[j],
                                               digits = col.digits[j])
        }
    }

    f.table <-
    f.table  %>%
        # set table borders
        flextable::border_outer(part = "all",
                                border = officer::fp_border(color = "black", width = 1)) %>%
        flextable::border_inner_h(part = "all",
                                  border = officer::fp_border(color = "black", width = 1)) %>%
        flextable::border_inner_v(part = "all",
                                  border = officer::fp_border(color = "black", width = 1)) %>%

        # set fonts
        flextable::font(fontname = "Times", part = "all") %>%
        # also set the table's header font as bold
        flextable::bold(part = "header") %>%
        flextable::align(
            i = NULL,
            j = col.keys,
            align = "center",
            part = "all"
        ) %>%
        flextable::autofit(.)
        #flextable::autofit(., add_w = - 0.175, add_h = 0)

        return(f.table)
}
