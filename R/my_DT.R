#' @title dataframe to DT
#' @description dataframe to DT
#' @param df dataframe
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[DT]{datatable}}
#' @rdname my_DT
#' @export 
#' @importFrom DT datatable
my_DT <- function(df) {
  df %>% 
  DT::datatable(escape=F, filter = "top", selection = list(target = "none"),
                extensions = "Buttons", rownames = F,
                option = list(scrollX = T, 
                              autoWidth = T, 
                              dom = "Bfrtip",
                              buttons = c("copy", "csv", "excel"),
                              pageLength = 14))
}

