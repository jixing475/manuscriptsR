#' get df colnames
#'
#' @param df The name of a \code{data.frame} or a \code{data.frame} itself, if not provided, an addin is launched.
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' # Launch addin
#'
#' # or pass the name of a data.frame
#' colnames_to_clipboard("iris")
#'
#' # or directly the object
#' colnames_to_clipboard(iris)
#'
#' }
#' @importFrom miniUI miniPage miniButtonBlock miniContentPanel
#' @importFrom rstudioapi getSourceEditorContext
#' @importFrom shiny actionLink actionButton icon observeEvent
#'  runGadget dialogViewer tags stopApp
#' @importFrom utils browseURL
#' @importFrom writexl write_xlsx
#'
#'
colnames_to_clipboard <- function(df = NULL) {
    if (is.null(df)) {
        context <- try(rstudioapi::getSourceEditorContext(), silent = TRUE)
        if ("try-error" %in% class(context)) {
            df <- obj_search()
        } else {
            df <- context$selection[[1]]$text
            is_df <- tryCatch({
                test <- get(df, envir = .GlobalEnv)
                test <- as.data.frame(test)
                list(res = is.data.frame(test))
            }, error = function(e) {
                list(res = FALSE)
            })
            if (!is_df$res) {
                df <- obj_search()
            }
        }
    }
    if (is.character(df) & length(df) == 0) {
        message("It seems that there are no data.frames in global environment...")
        return(invisible())
    }
    if ((is.character(df) & length(df) == 1) | is.data.frame(df)) {
        tmp <- tempfile(fileext = ".xlsx")
        df <- get_df(df)
        if (is.null(df)) {
            message("Selected object must be a data.frame in GlobalEnv.")
            return(invisible())
        }
        df <- as.data.frame(df)
        df %>% colnames() %>% clipr::write_clip()
    }
}
