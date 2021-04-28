#' @title from gtf file to data frame
#' @description from gtf file to data frame
#' @param path_gtf path to gtf file
#' @return data frame
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[rtracklayer]{io}}
#'  \code{\link[tidyr]{separate}}
#' @rdname gtf_to_df
#' @export 
#' @importFrom rtracklayer import
#' @importFrom tidyr separate

gtf_to_df <-
  function(path_gtf) {
    gtf_df <-
      rtracklayer::import(path_gtf) %>%
      as.data.frame() %>%
      tidyr::separate(gene_id,
                      into = c("gene_id", "discard"),
                      sep = "\\.")
    return(gtf_df)
  }
