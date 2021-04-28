#' @title combine a list of word file
#' @description combine a list of word file
#' @param files_docx a list of word file
#' @param out the path of combined word file
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname my_combine_word
#' @export 

my_combine_word <- function(files_docx, out) {
    doc <- read_docx()
    for (i in 1:length(files_docx)) {
        print(i)
        para <-
            files_docx[i] %>%
            basename() %>%
            # str_remove(pattern = reg) %>%
            str_remove(".docx")
        doc <-
            doc %>%
            body_add_break(., pos = "after") %>%
            body_add_par(., para, style = "heading 1") %>%
            body_add_docx(src = files_docx[i])
    }
    print(doc, target = out)
    print("Word combine is done!")
}
