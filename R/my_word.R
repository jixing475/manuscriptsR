#' @title Table to Word
#' @description Write a table to docx file
#' @param df dataframe or flextable
#' @param para text to write, Default: 'Just for test'
#' @param docx_path path to write docx file, Default: '~/Desktop/tmp.docx'
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[officer]{fp_text}},\code{\link[officer]{read_docx}},\code{\link[officer]{body_add_par}},\code{\link[officer]{body_add_fpar}},\code{\link[officer]{fpar}}
#'  \code{\link[flextable]{body_add_flextable}}
#'  \code{\link[manuscriptsR]{my_ft}}
#'  \code{\link[glue]{glue}}
#' @rdname my_word
#' @export 
#' @importFrom officer fp_text read_docx body_add_par body_add_fpar fpar ftext
#' @importFrom flextable body_add_flextable
#' @importFrom fs file_chmod 
#' @importFrom glue glue

my_word <- function(df, para = "Just for test", docx_path = "~/Desktop/tmp.docx", open = TRUE) {
  my.prop = officer::fp_text(font.size = 14,
                             bold = TRUE,
                             font.family = "Times")
  if(file.exists(docx_path)){
    doc <- officer::read_docx(docx_path) 
  }
  else{
    doc <- officer::read_docx() #create word with table
  }
  officer::body_add_par(doc, para, style = "heading 1") # add heading
  officer::body_add_fpar(doc, officer::fpar(ftext(para, prop = my.prop)))# add formated para
  officer::body_add_par(doc, " ") # add empty line
  
  # add table
  flextable::body_add_flextable(doc,
                                value = df %>% my_ft(.))
  print(doc, target = docx_path) # output
  fs::file_chmod(docx_path, mode = "777")
  # open word
  if(open){
    glue::glue("open {docx_path}") %>% system(intern = TRUE)
  }
}
