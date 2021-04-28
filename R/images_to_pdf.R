#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param path_dir PARAM_DESCRIPTION
#' @param pdf_name PARAM_DESCRIPTION, Default: 'merge'
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[fs]{dir_ls}}
#'  \code{\link[stringr]{str_c}},\code{\link[stringr]{str_glue}}
#' @rdname images_to_pdf
#' @export 
#' @importFrom fs dir_ls
#' @importFrom stringr str_c str_glue
images_to_pdf <- function(path_dir, pdf_name = "merge"){
  image_files <- 
    fs::dir_ls(path_dir) %>% 
    stringr::str_c(collapse = " ")
  stringr::str_glue(
    "magick ",
    "{image_files } ",
    "{path_dir}/{pdf_name}.pdf") %>% 
    system(intern = TRUE)
}
