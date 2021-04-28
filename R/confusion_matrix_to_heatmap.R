#' @title turn matrix to heatmap
#' @description turn matrix to heatmap
#' @param confusion_mat matrix from python machine learning
#' @param class vector, the y class order(must the right order)
#' @return ggplot object
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[tibble]{rownames}}
#'  \code{\link[tidyr]{gather}}
#'  \code{\link[ggplot2]{ggplot}}
#' @rdname confusion_matrix_to_heatmap
#' @export 
#' @importFrom tibble rownames_to_column
#' @importFrom tidyr gather
#' @importFrom ggplot2 ggplot
confusion_matrix_to_heatmap <- function(confusion_mat,
                                        class ) {


    confusion_mat <- confusion_mat %>% as.data.frame()
    rownames(confusion_mat) <- class
    colnames(confusion_mat) <- class

    confusion_mat_to_plot <-
        confusion_mat %>%
        tibble::rownames_to_column(., var = "ylab") %>%
        tidyr::gather(., xlab, count, class)

    ggheatmap <-
        ggplot2::ggplot(confusion_mat_to_plot, aes(xlab, ylab, fill = count)) +
        geom_tile(color = "white") +
        scale_fill_gradient_tableau(palette = "Blue") +
        theme_minimal()+
        labs(x = "Predicted", y = "Actual") +
        #theme(axis.text.x = element_text(angle = 0, vjust = 1,
        #                                 size = 12, hjust = 1),
        #      axis.text.y = element_text(angle = 0, vjust = 1,
        #                                 size = 12, hjust = 1))+
        coord_fixed() +
        geom_text(aes(xlab, ylab, label = count), color = "black", size = 4)
    return(ggheatmap)
}
