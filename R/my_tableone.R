#' @title create table one for publication
#' @description create table one for publication
#' @param data_tidy dataframe
#' @param group group factor
#' @return dataframe
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[stringr]{str_glue}}
#'  \code{\link[compareGroups]{compareGroups}},\code{\link[compareGroups]{createTable}}
#' @rdname my_tableone
#' @export 
#' @importFrom stringr str_glue
#' @importFrom compareGroups compareGroups createTable
my_tableone <- function(data_tidy, group) {
    formula <- stringr::str_glue("{group} ~ . ") %>% as.formula()
    res_tab <-
        data_tidy %>%
        compareGroups::compareGroups(formula,
                                     data = .,
                                     method = NA) %>%
        #1 - forces analysis as "normal-distributed";
        #2 - forces analysis as "continuous non-normal";
        #3 - forces analysis as "categorical";
        #4 - NA, which performs a Shapiro-Wilks test to decide between normal or non-normal
        compareGroups::createTable(
            .,
            #digits = c(p14 = 0, hormo = 1),
            # show.p.mul = TRUE, show.p.overall = FALSE, # 显示过个 P value, 两两之间的比较
            #extra.labels = c("Mean (SD)","Median (IQR)","",""), # 给变量添上额外标签
            digits.p = 3, # 小数点位数
            sd.type = 2, # 是1 () 还是 2 ±
            type = 2,
            show.all = TRUE,
            hide.no = "no",
            show.n = FALSE
        )
    return(res_tab)
}

# export2word(restab,
#             file = "~/Desktop/example.docx",
#             header.labels = c(p.overall = "p-value"))
