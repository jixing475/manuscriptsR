#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param data PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  #iris %>% manuscriptsR::run_bamboolib()
#'  }
#' }
#' @seealso 
#'  \code{\link[feather]{read_feather}}
#' @rdname run_bamboolib
#' @export 
#' @importFrom feather write_feather
#' @importFrom stringr str_glue
#' @importFrom fs dir_create
#' 

run_bamboolib <- function(data, dir = "~/Desktop/work" ) {
  fs::dir_create(dir)
  #write.csv(data, "~/Desktop/bam_data.csv")
  feather::write_feather(data, stringr::str_glue("{dir}/bam_data.feather"))
  system(stringr::str_glue("cp /Users/zero/Documents/_15_Alfred/scripts/python/bamboolib.ipynb {dir}"))
  system(stringr::str_glue("cd {dir} && /Users/zero/anaconda3/envs/bamboolib/bin/jupyter notebook"))
}
