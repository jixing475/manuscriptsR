#' @title extract table from word
#' @description extrac word from word
#' @param doc_path doc file papth
#' @return table list 
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[officer]{read_docx}}
#'  \code{\link[tibble]{as_tibble}}
#'  \code{\link[dplyr]{filter}}
#'  \code{\link[tidyr]{pivot_wider}}
#'  \code{\link[purrr]{set_names}}
#' @rdname extract_word_table
#' @export 
#' @importFrom officer read_docx
#' @importFrom tibble as_tibble
#' @importFrom dplyr filter
#' @importFrom tidyr pivot_wider
#' @importFrom purrr set_names

extract_word_table <- function(doc_path){
  doc <- officer::read_docx(doc_path)
  # * EXTRACT THE DOCX CONTENTS -----
  content_tbl <- docx_summary(doc) %>% tibble::as_tibble()
  
  word_content_tbl <-
    content_tbl %>%
    filter(content_type == "table cell") %>%
    group_by(doc_index) %>%
    nest() %>%
    # * FORMAT THE DATA ----
  mutate(data = data %>% map(~ {
    # * Table Headers ----
    table_header <-
      .x %>%
      dplyr::filter(is_header) %>%
      pull(text)
    
    # * Table Contents ----
    .x %>%
      filter(!is_header) %>%
      select(text, row_id, cell_id) %>%
      tidyr::pivot_wider(names_from = cell_id, values_from = text) %>%
      select(-row_id) %>%
      purrr::set_names(table_header)
  }))
  return(word_content_tbl)
}
# [business-science/free_r_tips: Free R-Tips is a FREE Newsletter provided by Business Science. It comes with bite-sized code tutorials every Tuesday.](https://github.com/business-science/free_r_tips)